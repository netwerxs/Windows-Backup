# WBADMIN #
Windows Backup Admin comes with newer Windows operating systems. However it seems that server systems have more features than desktop system. Windows 7 has less functionality than Windows Server 2012 Essentials, surprisingly Windows 7 has more features than Windows 8. I do not know why MS would degrade Windows Backup in Win 8 but there you go.

To backup desktops I use and recommend Macrium Reflect Professional. Macrium has a server backup solution and cheap compared to what I used to pay for Symantec System Recovery however I prefer Windows Backup over Symantec and Acronis at any price.

Having said all that the Windows GUI to schedule your backup is a nightmare and is not usable. I have figured out how to take full control of Windows Backup and it does not include using the GUI to schedule your nightly server backup.

## Ingrediants ##

- Windows Server 2008, 2008R2, 2011 Essentials, 2012 Essentials, 2012 Standard (tested)
- Free USB 2.0 port
- [Hard drive dock](http://www.google.ca/search?q=hard+drive+dock)
- Assortment of hard drives, new or used

## Instructions ##

At an evevated command prompt run notepad:

c:\windows\system32> notepad c:\windows\system32\mywinbu.cmd

Yes, create a new file and paste the text from mywinbu.cmd on github.

Edit the -include:c:,e:,y: for the drives that you want to backup.

Edit the USB drive info to match your USB drives:

REM 01 \\?\Volume{15e9405a-49a8-11e3-a03d-6805ca013446}\
REM 02 \\?\Volume{15e9912b-49a4-11e3-a03d-6805ca013446}\
REM 03 \\?\Volume{15e941d8-49a8-11e3-a03d-6805ca013446}\
REM 04 \\?\Volume{aa863426-4d05-11e3-a5b2-6805ca013446}\
REM 05 \\?\Volume{15e94125-49a8-11e3-a03d-6805ca013446}\

These lines must match the USB drives that you have. Use 'Disk Management' to delete the volume(s) on your USB backup drives. Then create a New Simple Volume, do not assign a drive letter or drive path and make the Volume Label DISK01.

Don't get Volume Label confused with Volume Name.

When windows formated the drive it made up a new and unique 'Volume Name' and if you were to format that same drive again it would get a new unique Volume Name. Eg: \\?\Volume{15e94125-49a8-11e3-a03d-6805ca013446}\

You can find out what windows 'named' your disk with the mountvol command:


===================================================================================

c:\windows\system32> mountvol

Possible values for VolumeName along with current mount points are:

    \\?\Volume{fdc7f40c-158a-11e3-93ee-806e6f6e6963}\
        *** NO MOUNT POINTS ***

    \\?\Volume{65dfb629-158f-11e3-93f3-002354314034}\
        E:\

    \\?\Volume{fdc7f40d-158a-11e3-93ee-806e6f6e6963}\
        C:\

    \\?\Volume{fdc7f411-158a-11e3-93ee-806e6f6e6963}\
        D:\


======================================================================================

note my usb drive *** NO MOUNT POINTS ***

Since I set it Volume Label to DISK01 I will identify the drive by physically marking it with a pen, pencil or crayon as DISK01.

The Volume Label is important because when I use the wbadmin GUI to restore a file or image it will show DISK01 in the logs of available backups along with dates and whatnot.

The line in mywinbu.cmd to match this drive would be:

REM 01 \\?\Volume{fdc7f40c-158a-11e3-93ee-806e6f6e6963}\


REM = don't try and run this line as a command or something
01 = Just a reference that this is my drive with the physical label 01 and Volume Lable DISK01
Lastley the Volume Name of this drive

Look at this:

for /F "tokens=1,2,3" %%A in (%0) do (

tokens 1 2 and 3
1 - REM
2 - 01
3 - \\?\Volume{fdc7f40c-158a-11e3-93ee-806e6f6e6963}\

%%A
When following tokens=1,2,3 %%A will equal token 1 (REM) and magically %%B wi9ll equal token 2 %%C = token 3

%0 in windows batch files this is the name of the batch file

Please study the batch file, you'll see what's happening.
