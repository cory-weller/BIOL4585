# Connecting to a command-line

## Overview

Humans don't natively speak in binary, meaning there ultimately must be a translator between you and the computer's operating system. The general name given to the program that accepts your commands and translates it for the computer is a **shell**. The shell can be thought of the outermost layer of the computer's operating system that you can see; the actual work is done under the hood, hidden inside.

You are probably accustomed to a graphical user interface (or **GUI**, pronounced *gooey*) for interacting with your computer. GUIs have menus and icons that you can click on to perform tasks on your computer. Macs, Windows computers, and smartphones are all machines with graphical user interfaces.

<center><a href="assets\img\graphical_user_interface.png"><img src="assets\img\graphical_user_interface.png" height="225" width="300"></a></center>
#### A graphical user interface or GUI

The alternative to a GUI is a **Command-line interface** (CLI, or commonly called **command-line** for short). This is an interface for communicating with a computer via text input--no clickable menus or buttons!

<center><a href="assets\img\bash_command_line_interface.png"><img src="assets\img\bash_command_line_interface.png" height="225" width="300"></a></center>
#### A `bash` command-line interface, common to linux operating systems

Notice that the command `cd` was used to changed directories until in a desired location, and `ls` then printed a list of files and folders. The above two images are showing the same information, one with a GUI, the other on the command-line.

While a text-only interface may sound clunky to use at first, it enables a level of automation that is unrivaled by GUIs. Imagine that you wanted to rename one thousand files by appending some text to the file names. Doing this by hand would be tedious, but the task can be automated by writing a generic set of instructions, completing the task within seconds on a command-line interface.

To recap new vocabulary:
**[shell](https://en.wikipedia.org/wiki/Shell_(computing))**: a program that accepts user input and translates it into tasks to run on a computer
**[GUI](https://en.wikipedia.org/wiki/Graphical_user_interface)**: a graphical user interface--a shell with visual menus, icons and/or buttons
**[CLI](https://en.wikipedia.org/wiki/Command-line_interface)**: a command-line interface--a shell where commands are entered as text input
**[bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))**: a specific command-line interface shell, commonly used in Linux operating systems
**[Linux](https://en.wikipedia.org/wiki/Linux)**: a family of free operating systems, like Ubuntu and Fedora, that heavily lean on command-line use

## The Rivanna computing clusters
While Linux operating systems are free/open source and you **could** install it on your own computer, but we'll make it even easier. You can access a Linux environment (via a bash shell) on **Rivanna**, UVA’s High-Performance Computing (HPC) system. Rivanna is a network of resources (hard drives, memory, CPUs, etc) that can be accessed remotely. Rivanna is used by researchers as a platform for high-throughput computing chores, such as large-scale data analysis and image processing. In this guide, will first learn how to access and communicate with Rivanna.

**A note on passwords**: If you are used to only accessing UVA resources via netbadge and do not remember your password, you may need to reset it. See [here](https://virginia.service-now.com/its?id=itsweb_kb_article&sys_id=2f47ff87dbf6c744f032f1f51d961967) for instructions.

**Prerequesite**: Install and enable the UVA Anywhere VPN.  

While connected to Wi-Fi on-grounds, your computer is identified as being “on the UVA network” and you can access Rivanna by default. Any time you are not on-grounds, you need to use a Virtual Private Network (VPN) in order to access Rivanna. Detailed instructions for Mac and Windows users can be found [here](https://virginia.service-now.com/its?id=itsweb_kb_article&sys_id=f24e5cdfdb3acb804f32fb671d9619d0). Note for Linux users: while UVA’s VPN is technically described as ‘unsupported’ for Linux, see openssl instructions described [here](https://arcs.virginia.edu/vpn-on-linux).

## Accessing Rivanna via GUI: FastX
All FastX requires is a supported internet browser and an internet connection on the UVA network (or VPN). Instructions for launching a FastX session can be found [here](https://arcs.virginia.edu/fastx). Briefly familiarize yourself with the contents of the top menu bar, e.g. application browser, file browser (file cabinet), terminal, and firefox icons. Notice you can access your home directory folder on the desktop. You can open a `bash` shell within FastX by clicking on the terminal icon (computer monitor with `>_` on the screen).

## Accessing Rivanna via CLI: SSH
SSH, or *secure shell*, is the most widely used method for accessing Linux systems remotely.
  * **Windows Users**: you will need a program, called an ssh client, to access Rivanna. This course provides a free educational license for MobaXterm, which can be downloaded from the Resources page of our course Collab page. Extract all of the contents of the .zip archive to a folder on your computer, and launch MobaXterm_Professional_9.4.exe whenever you want to start it. When connecting to Rivanna for the first time, you will start a new session of type SSH. For remote host enter `rivanna.hpc.virginia.edu` and for username enter your computing ID (not the full email address, just the characters before @virginia.edu).
  * **Mac and Linux users**: search your apps for “terminal” which will bring up a terminal window. Here, enter the following command, replacing mst3k with your own computing ID: `ssh -Y mst3k@rivanna.hpc.virginia.edu`

  After you initiate the connection, you will be prompted for your password. Be confident that your keys are being entered, even though you don't see any * characters as you type. Hit enter after typing all of your password.
