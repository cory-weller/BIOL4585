# Viewing files with sftp

## Overview

Until now, you've viewed files using `cat` or `less`. While

SSH File Transfer Protocol. This will let you use a file browser within a text editor, so you can directly open, read, modify, and save text files in your Rivanna directory.

The text editor **atom**, developed by the team that made [github](https://github.com).

1. Download and install the [atom text editor]](https://atom.io/)

2. Open the settings menu under File/Settings or with they key combination `Ctrl` + `comma`

3. Select **install** from the settings window and install the package [ftp-remote-edit](https://atom.io/packages/ftp-remote-edit)

4. Open the package with `Ctrl` + `spacebar`

5. You will be prompted to create a password--this is an entirely new password, specific to the text editor. Think of it like a master password for accessing other servers.

6. To access files on Rivanna, you need to enter information for connecting to it. Yours should look similar to the settings below, but with your own computing ID and your own Rivanna password.

![](../../assets/img/atom_sftp_settings.png)

7. You should now see your `/scratch/<computingID>/` folders within the file browser. You can open them to view or edit the contents. Upon saving, it will be uploaded to Rivanna. You can collapse and expand a directory to refresh its contents.

![](../../assets/img/atom_with_sftp.png)
