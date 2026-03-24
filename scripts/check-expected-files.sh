#!/usr/bin/env bash
set -euo pipefail

# Expected Files Check (YAML-driven)
# - Assumes config is always at: .github/assignment.yaml
# - Emits GitHub Actions annotations (::error / ::warning)
# - Exits non-zero if required items are missing

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

YAML_PATH="./.github/assignment.yaml"
FAIL_ON_WARNINGS="${FAIL_ON_WARNINGS:-0}"

missing_required=0
warnings=0

annot_error() { echo "::error title=Expected files check failed::$1"; }
annot_warn()  { echo "::warning title=Expected files check warning::$1"; }

check_required_path() {
  local p="$1"
  if [[ ! -e "$p" ]]; then
    annot_error "Missing required path: '$p'"
    missing_required=$((missing_required + 1))
  fi
}

check_glob_min_count() {
  local glob="$1"
  local min="$2"

  shopt -s nullglob globstar extglob
  local matches=()
  # shellcheck disable=SC2206
  matches=( $glob )
  local count="${#matches[@]}"

  if (( count < min )); then
    annot_error "Expected at least $min file(s) matching '$glob' but found $count"
    missing_required=$((missing_required + (min - count)))
  fi
}

check_optional_glob() {
  local glob="$1"
  local note="${2:-}"

  shopt -s nullglob globstar extglob
  local matches=()
  # shellcheck disable=SC2206
  matches=( $glob )
  local count="${#matches[@]}"

  if (( count == 0 )); then
    if [[ -n "$note" ]]; then
      annot_warn "Optional deliverable missing: '$glob' ($note)"
    else
      annot_warn "Optional deliverable missing: '$glob'"
    fi
    warnings=$((warnings + 1))
  fi
}

extract_from_yaml() {
  # Prints three labeled sections:
  # PATHS:
  # GLOBS:          (JSON lines: {"pattern": "...", "min": N})
  # OPTIONAL_GLOBS: (JSON lines: {"pattern": "...", "note": "..."})
  python - <<'PY' "$YAML_PATH"
import sys, json

yaml_path = sys.argv[1]

try:
    import yaml  # type: ignore
except Exception:
    print("::error title=Expected files check failed::Python dependency missing: PyYAML is required to parse .github/assignment.yaml")
    sys.exit(2)

try:
    with open(yaml_path, "r", encoding="utf-8") as f:
        data = yaml.safe_load(f) or {}
except FileNotFoundError:
    print(f"::error title=Expected files check failed::Missing config file: '{yaml_path}'")
    sys.exit(2)
except Exception as e:
    print(f"::error title=Expected files check failed::Could not read '{yaml_path}': {e}")
    sys.exit(2)

cfg = (data.get("expected_files") or {})

paths = cfg.get("paths") or []
globs = cfg.get("globs") or []
opt_globs = cfg.get("optional_globs") or []

def norm_paths(xs):
    out = []
    for x in xs:
        if isinstance(x, str):
            x = x.strip()
            if x:
                out.append(x)
    return out

def norm_globs(xs):
    out = []
    for item in xs:
        if isinstance(item, str):
            pat = item.strip()
            if pat:
                out.append({"pattern": pat, "min": 1, "note": ""})
        elif isinstance(item, dict):
            pat = str(item.get("pattern", "")).strip()
            if not pat:
                continue
            mn = item.get("min", 1)
            try:
                mn = int(mn)
            except Exception:
                mn = 1
            note = str(item.get("note", "")).strip()
            out.append({"pattern": pat, "min": mn, "note": note})
    return out

paths = norm_paths(paths)
globs = norm_globs(globs)
opt_globs = norm_globs(opt_globs)

print("PATHS:")
for p in paths:
    print(p)

print("GLOBS:")
for g in globs:
    print(json.dumps({"pattern": g["pattern"], "min": int(g.get("min", 1))}))

print("OPTIONAL_GLOBS:")
for g in opt_globs:
    print(json.dumps({"pattern": g["pattern"], "note": g.get("note","")}))
PY
}

echo "== Expected Files Check =="
echo "Repo root: $ROOT"
echo "Config: $YAML_PATH"

yaml_out="$(extract_from_yaml)"

section=""
while IFS= read -r line; do
  line="${line%$'\r'}"
  case "$line" in
    "PATHS:"|"GLOBS:"|"OPTIONAL_GLOBS:")
      section="$line"
      continue
      ;;
  esac

  [[ -z "${line//[[:space:]]/}" ]] && continue

  if [[ "$section" == "PATHS:" ]]; then
    check_required_path "$line"

  elif [[ "$section" == "GLOBS:" ]]; then
    pattern="$(python -c 'import json,sys; print(json.loads(sys.stdin.read())["pattern"])' <<<"$line")"
    min="$(python -c 'import json,sys; print(int(json.loads(sys.stdin.read())["min"]))' <<<"$line")"
    check_glob_min_count "$pattern" "$min"

  elif [[ "$section" == "OPTIONAL_GLOBS:" ]]; then
    pattern="$(python -c 'import json,sys; print(json.loads(sys.stdin.read())["pattern"])' <<<"$line")"
    note="$(python -c 'import json,sys; print(json.loads(sys.stdin.read()).get("note",""))' <<<"$line")"
    check_optional_glob "$pattern" "$note"
  fi
done <<< "$yaml_out"
echo "Done. Missing required: $missing_required. Warnings: $warnings."

if (( missing_required != 0 )); then
  echo "Result: FAIL (required deliverables are missing)."
  exit 1
fi

if (( FAIL_ON_WARNINGS != 0 && warnings > 0 )); then
  echo "Result: FAIL (warnings treated as errors because FAIL_ON_WARNINGS=$FAIL_ON_WARNINGS)."
  exit 2
fi

if (( warnings > 0 )); then
  echo "Result: PASS with warnings (optional deliverables missing)."
else
  echo "Result: PASS (all required deliverables found)."
fi

exit 0