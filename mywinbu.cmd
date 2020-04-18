@echo off

net session >nul 2>&1 & if errorlevel 1 echo Failed: Not administrator & exit /b 

setlocal

set myver=1.22
set mylogfilelocation=
set mylogfilename=
set myoptions1=
set myoptions2=
set myignore=
set mytemp1=
set mytemp2=
set myfilelog=
set testing=

c:
cd \rsynclibrary\tools\cmd

set mytemp1=%temp%\956342-1.tmp
set mytemp2=%temp%\956342-2.tmp

if not exist c:\rsynclibrary\tools\include\myinclude.cmd copy c:\windows\system32\myinclude.cmd c:\rsynclibrary\tools\include\myinclude.cmd 

if not exist \rsynclibrary\tools\include\myinclude.cmd goto novarsfile
call c:\rsynclibrary\tools\include\myinclude.cmd
if "%mylogfilelocation%"=="" echo var mylogfilelocation not found 
if "%myoptions1%"=="" echo var myoptions1 not found
if "%myoptions2%"=="" echo var myoptions2 not found
if "%myignore%"=="" echo var myignore not found

if not exist %mylogfilelocation%\. (md %mylogfilelocation%)
if %1.==. (set mylogfilename=backup_test) else (set mylogfilename=backup)
set mylogfile=%mylogfilelocation%\%mylogfilename%.log

if %1.==. set testing=echo

mountvol | find "Volume{" > %mytemp1%
for /F %%A in (%mytemp1%) do (
  dir /A:D %%A\ | find "Volume in drive" > %mytemp2%
  for /F "tokens=1,2,3,4,5,6,7,8,9" %%A in (%mytemp2%) do (
    echo %%D %%F %%G
    if not %%F==%myignore% (
      if exist %%D\WindowsImageBackup (
        rem if %testing%.==echo. ( start %%D )
		set myreport=%%F
        if exist %%D\myoptions2.id (
          echo %date% %time:~0,5% v%myver% backup to %%F with %myoptions2% >> %mylogfile%
          %testing% wbadmin start backup -backuptarget:%%D %myoptions2% -quiet
        ) else (
		  rem echo this is the myoptions2.id file > %%D\myoptions2.id
          echo %date% %time:~0,5% v%myver% backup to %%F with %myoptions1% >> %mylogfile%
          %testing% wbadmin start backup -backuptarget:%%D %myoptions1% -quiet
        )
        if errorlevel  4 goto myresult4
        if errorlevel  3 goto myresult3
        if errorlevel  2 goto myresult2
        if errorlevel  1 goto myresult1
        if errorlevel  0 goto myresult0
        if errorlevel -1 goto myresult-1
        if errorlevel -2 goto myresult-2
        if errorlevel -3 goto myresult-3
        if errorlevel -4 goto myresult-4
        if errorlevel -5 goto myresult-5
        goto myresult00
      )
    )
  )
)

goto eof

:myresult4
set myresult=4
goto eof

:myresult3
set myresult=3
goto eof

:myresult2
set myresult=2
goto eof

:myresult1
set myresult=1
goto eof

:myresult0
set myresult=0
goto eof

:myresult-1
set myresult=-1
goto eof

:myresult-2
set myresult=-2
goto eof

:myresult-3
set myresult=-3
goto eof

:myresult-4
set myresult=-4
goto eof

:myresult-5
set myresult=-5
goto eof

:myresult00
set myresult=00
goto eof

:novars
set myresult=novars
goto eof

:novarsfile
echo Fatal error: myinclude.cmd not found
goto eof

:eof

if %myresult%.==. set myresult=NODRIVE
echo %date% %time:~0,5% Result %myresult% >> %mylogfile%
call myalert %myresult% mywinbu %myreport%
rem call mylog.cmd mywinbu%myresult%
rem call mysync dl_tools go out

del %mytemp1%
del %mytemp2%
endlocal
