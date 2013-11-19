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

Save the file.
