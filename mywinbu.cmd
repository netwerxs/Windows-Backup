@echo off
cls

if %1.==. %0 z y x w v u t s r q p o n m l k j i h g f e d c b a

:LOOP
if exist %1:\WindowsImageBackup\. goto FOUND
shift
if not %1.==. goto LOOP

echo Drive with \WindowsImageBackup directory not found 
goto DONE

:FOUND
wbadmin start backup -backuptarget:%1: -include:c: -systemState -allCritical -vssFull -quiet

:DONE