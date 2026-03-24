[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/Hb5tmlAg)
# GitHub Classroom and Environment Setup Assignment

The goal of this assignment is to introduce you to using GitHub Classroom for assignments, and to ensure that you have a few key utilities installed on your machine so we (hopefully) have fewer problems later in the semester. 🤞🏻 

## Technologies Other than Git(Hub)

We'll walk through our first GitHub-Classroom-based assignment below, but first, let's make sure you have a few prerequisites set up. Data engineering is a broad discipline that requires you to touch a lot of different tools, so you'll be using a variety of other technologies throughout the semester. Many of these will be familiar to you from prior classes, and some may not be. I'll provide a starting list below, along with a few resources for you to check out if you feel like you need a refresher (or a crash course if any of them are completely new to you).

### Linux/Shell (and other Command line fun) 

Many cloud technologies are most conveniently (or exclusively) manipulated using a Linux-based command shell. You don't need to be a shell expert, but you should understand the basics of how to navigate a file structure, execute commands with option flags, as well as how to install packages with package managers like `apt-get`.

- Resources: [Linux for Beginners from Ubuntu (text)](https://ubuntu.com/tutorials/command-line-for-beginners#1-overview), [60 Linux Commands you NEED to know (10:49)](https://www.youtube.com/watch?v=gd7BXuUQ91w), [Linux Command Line for Beginners (59:24)](https://www.youtube.com/watch?v=16d2lHc0Pe8), [Beginner's Guide To The Linux Terminal (42:26)](https://www.youtube.com/watch?v=s3ii48qYBxA)
- **Note for Windows Users**: Many of the (local) command line operations we accomplish in class can be done using the Windows Powershell, and I'll do my absolute best to support you in the Windows environment. That said, any cloud service that you interact with via the Shell will most likely be Linux, so it wouldn't hurt to install and configure the Windows Subsystem for Linux (WSL) so that you can get some practice there. This is not required, but here is a nice [set of instructions](https://learn.microsoft.com/en-us/windows/wsl/install) from Microsoft if you want to go this route.

### Visual Studio Code
We'll use Visual Studio Code for pretty much all of our code work. You are welcome to use another IDE, but I won't be able to support you. You've likely used it in prior classes, but go ahead and install it [here](https://code.visualstudio.com/download) if needed. 

Once you have it installed, I'm going to recommend a few extensions and configuration settings that will make your life easier:
- The primary family of extensions we'll need are those used for Python development. Please ensure that you have the following extensions: `Python`, `Pylance`, `Python Debugger`, and `Python Environments`. (Most or all of these will be installed when you add the main Python extension because they are all interdependent.)
- While we're here, let's make your life easier by ensuring that a couple of important settings are enabled: 
  1. Open up VS Code's settings pane, ensure that you're operating on the User (as opposed to Workspace) settings, and use the search bar at the top to quickly find the `python.usePythonEnvironmentsExtension` option. Make sure that the box next to "Enables the Python Environments Extension" is checked.
  2. Now use the search box to find the `python.terminal.activateEnvironment` option, and make sure that the "Activate Pyton Environment in all Terminals created" option is checked.
- Inside VS Code, please become familiar with the Command Pallete. This is found under the `View` menu, and it can be invoked by default with `Ctrl+Shift+P` (Windows) or `Cmd+Shift+P` (Mac). Most extensions you install will expose their main functionality there in the Command Pallete, and it's good for you to know that it's there in case you're looking for something that you can't find in the limited application menus.
- One pro tip: it's _very_ handy to be able to open a given file in VS Code straight from the command line. If you're on Windows, this capability was enabled when you installed VS Code. You can try it out by opening a terminal, finding a text-like file somewhere, and typing `code your_file.txt`. Cool, right?
  - If you're on a Mac, this doesn't work out of the box after install, so let's practice using the Command Pallete to install it. Activate the Command Pallete and start typing "Shell command". You'll see the list quickly narrow to two: `Install 'code' command in PATH` and `Uninstall 'code' command from PATH`. Select the `Install` command. Now you can reload your terminal and try the command above again.

Feeling like a VS Code pro now? Good. Feeling like you're not sure? Don't worry: you'll be more familiar than you EVER wanted by the end of the semester.

## Background on GitHub Classroom

GitHub Classroom is a tool that helps me organize and manage GitHub repositories that are used for class assignments and group project deliverable. GitHub Classroom automates repository creation and access control, making it easy to distribute starter code and collect assignments on GitHub.

A GitHub Classroom assignment is a GitHub repository with access control setup so both you and your instructor can access it. When you accept an assignment, GitHub Classroom will automatically create a new, personalized copy of the assignment repository for you. The assignment repository will belong to your course's organization account on GitHub, but you and your teacher will have access to it.

Once an assignment has been accepted, students no longer interact with GitHub classroom. They just interact with GitHub.

### Git and GitHub Desktop

In order to complete most assignments for this course, you will need to be able to use git and be familiar with GitHub. If you join a data science (or any engineering) team someday, you'll almost certainly do most of your work in code, and you'll likely collaborate with your team via git and GitHub.

You probably already have experience with these tools from prior classes, but just in case, I'd encourage you to watch [this excellent tutorial video](https://www.youtube.com/watch?v=8Dd7KRpKeaE) that summarizes git, GitHub, and GitHub Desktop. It's 22 minutes long, but it's clear and comprehensive (and you can up the playback speed if you want).

### Terms to Know

While you're watching the video above and playing with git/GitHub for this assignment, be sure that you are familiar with the following terms. You need to know them to be successful in completing and submitting assignments. If you can't explain these terms to a friend, I suggest doing some additional research online until you're comfortable with them.

- (Understand the difference between git, GitHub, and GitHub Desktop)
- Repository
- Branch
- Clone
- Add
- Commit
- `.gitignore`
- Push
- Pull
- Publish
- Pull Request
- Merge

### Git Utilities

There are dozens of great git tools that allow you to use git and GitHub, ranging from the command line `git` tool (for the hardcore among you), to GUI tools like GitHub's own GitHub Desktop, to plugins for most common code editors through which you can add, commit, branch, and push/pull files from within your IDE.

If you have a favorite tool, you're welcome to use it. If you don't, **I'd recommend using GitHub Desktop** this semester. It's available (free) for both Mac and Windows, it's built by GitHub, and it's fully capable of doing everything you'll need to do this semester. The (minor) disadvantage is that it's a separate application, but it's not a huge inconvenience. [Download GitHub Desktop here](https://desktop.github.com).

---
## Assignment Instructions

**Important:** The following instructions assume that you've already created a GitHub account (if necessary), accepted the first assignment using the link from the course schedule in Learning Suite, and properly linked your GitHub account with your name from the roster. 

1. Clone your assignment repository **to the `code` parent folder** on your local machine, as described at the beginning of the assignment description on Learning Suite. The easiest way to do this is from the web interface. On the main "Code" tab, there is an attractive green "Code" button, which drops down to provide several options for cloning. Assuming you're using GitHub desktop, just use the "Open with GitHub Desktop" option and you'll hopefully be redirected to the GitHub Desktop app with the details pre-populated. If that doesn't work, you can also copy the provided `https` URL and then use GitHub Desktop to manually clone the repository with that URL.

2. Head to VS Code and ensure that you can see your newly cloned repository there. 

3. Navigate to your profile in our classroom Slack space and take a screenshot that shows that you've uploaded a nice profile picture to your profile. Save this screenshot to the assignment repository as `profile.png` or `profile.jpg`. (Example profile screenshot shown below.)

<img src="screenshots/readme_img/ex_profile.png"  width="30%">

4. Open the `editme.txt` file and add a sentence about a podcast that you enjoy listening to and why.

5. When you have finished editing the file, save the changes and commit them to your repository, adding an appropriate commit message.

6. Verify Your Repository Location by following the steps in the block below:

> To avoid common issues caused by cloud-synchronized folders (e.g., OneDrive, iCloud), your assignment repository must be stored in a local code directory:
> - Windows: `C:\code`
> - macOS: `~/code`
> 
> You will demonstrate this by capturing terminal output that shows the location of your repository.
> 
> Instructions:
> 1. Open a command-line terminal
>   - macOS: Terminal
> 	- Windows: PowerShell
> 2. Navigate to this assignment’s repository folder
> 	- Use `cd` as needed until you are inside the repository directory.
> 3. List the contents of the directory
> 	- macOS: use the command `ls`
>   - Windows (PowerShell): use the command `dir`
> 4. Show the full path to the current directory
>   - macOS: use the command `pwd`
>   - Windows (PowerShell): use the command `(Get-Location).Path`
> 5. Take a screenshot of the terminal window that clearly shows:
> 	- The list of files in the directory
> 	- The full path to the repository
> 6. Save the screenshot as `task_6.png` or `task_6.jpg` in the root of the assignment repository with the other files.
>
> If you've followed the cloning steps properly, you should something pretty close to the image below (or the Windows equivalent) in your terminal:
> 
> <img src="screenshots/readme_img/ex_terminal1.png"  width="80%">

### Brief Aside: Why Environments Matter in Data Engineering

Modern data engineering work is not just about writing correct code. Rather, it is about ensuring that code runs reliably, reproducibly, and consistently across machines, teams, and time. Many of the hardest and most time-consuming problems data engineers face are not caused by logic errors, but by subtle differences in execution environments: mismatched library versions, missing system dependencies, or tools behaving differently on different machines.

For this reason, professional data engineers treat environment management **as a core skill**, not an afterthought. 

In this course, you will work with two complementary layers of environment control:
1. **Python virtual environments**, which isolate Python packages and versions so that projects can specify and reproduce their exact dependencies.
2. **Docker containers**, which encapsulate entire systems—databases, services, and tooling—so that complex data platforms can be run consistently across laptops, servers, and cloud infrastructure.

Python virtual environments help answer the question:
> “Which versions of Python libraries does this project depend on?”

Docker helps answer a broader question:
> “What does this entire system need in order to run?”

Together, these tools allow data engineers to build pipelines that are portable, testable, and shareable. Throughout this course, you will be expected to intentionally manage both layers. Doing so will not only make your assignments easier to run and debug, but will also mirror how real-world data engineering teams design reliable data systems.

# Final Task: Implement and use a Python Virtual Environment

Okay, with that context, let's finish up. We're going to leave the docker topic for the next assignment (get excited!), but your last task before submitting this assignment will be to get a simple script to run within a dedicated python virtual environment. Woohoo! 

## First, A Background Video

First, I'm going to ask you to watch an absolutely _fantastic_ explanation video that describes what python virtual environments are, how they work, and then shows one example of creating a virtual environment. 

**Note:** You can code along with this first video if you _really_ want to, but I'd encourage you to just watch it carefully and absorb as much context as you can from what he's walking you through. Don't worry if it feels overly technical or if you don't follow every piece of his narrative. Down below this first video, I'll point you to my own, more targeted walkthrough video below that will show you every step of my recommended approach to python virtual environments, and we'll also take some time in an upcoming class session to ensure that everyone is comfortable here. 

Sound good? So just watch this video without distraction and try to get a good sense for what a python virtual environment is. Here's the [link](https://www.youtube.com/watch?v=KxvKCSwlUv8).

## Second, A Guided Walkthrough

Wasn't that great? Now let's setup and explore a python virtual environment together. Let's do it.

[Video Walkthrough](https://www.dropbox.com/scl/fi/28azdi7sba5mojgyx7z1q/virtual-environments-with-uv.mp4?rlkey=2yor2cc2l2vergbytd2c5jl1k&dl=0)

(Below are code snippets that you'll see me using during the videos.)

### Installing UV

Mac users can use either (not both) of these commands:
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```
```bash
brew install uv
```

Windows users can use:
```
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

### Code to add to `main.py`

```python
import pyfiglet
import sys


print('------------------------------')
print('|  Virtual Environment Info  |')
print('------------------------------')
print(sys.executable)
print(sys.version)

print(pyfiglet.figlet_format("BYU Cougars"))
```

## Finish up and Submit

If you follow the walkthrough carefully, you should end up with something like you see below:

<img src="screenshots/readme_img/ex_terminal2.png"  width="80%">


> [!IMPORTANT]
> 📷 After following the walkthrough to get your virtual environment working, take a screenshot of your terminal output showing the "BYU Cougars" ASCII art. Save this screenshot as `ascii.png` (or jpg) to the assignment repository.
>
> Lastly, and **MOST IMPORTANTLY**, make sure to **push your changes** to GitHub, probably using the "Push Origin" button in GitHub Desktop. _This is how you submit your assignment._ If you don't, we can't see them and give you credit. I'll try to remind you to do this at the end of each assignment, but you'll be responsible for submitting your code using GitHub for all assignments distributed this way.

