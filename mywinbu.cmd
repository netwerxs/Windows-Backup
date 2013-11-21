@echo off
setlocal
cls

REM 01 \\?\Volume{15e9405a-49a8-11e3-a03d-6805ca013446}
REM 02 \\?\Volume{88888888-8888-8888-8888-888888888888} 1TB
REM 03 \\?\Volume{15e94125-49a8-11e3-a03d-6805ca013446}
REM 04 \\?\Volume{15e941d8-49a8-11e3-a03d-6805ca013446}
REM 05 \\?\Volume{aa863426-4d05-11e3-a5b2-6805ca013446}
REM 06 \\?\Volume{aa863522-4d05-11e3-a5b2-6805ca013446}
REM 07 \\?\Volume{5f3abba0-4fa8-11e3-95c9-6805ca013446}
REM 08 \\?\Volume{5f3abc1a-4fa8-11e3-95c9-6805ca013446}
REM 09 \\?\Volume{5f3abd4a-4fa8-11e3-95c9-6805ca013446}
REM 10 \\?\Volume{88888888-8888-8888-8888-888888888888} ****
REM 11 \\?\Volume{15e94024-49a8-11e3-a03d-6805ca013446}
REM 12 \\?\Volume{15e94046-49a8-11e3-a03d-6805ca013446}

for /F "tokens=1,2,3" %%A in (%0) do (
  if %%A.==REM. (
    if exist %%C\ (
      wbadmin start backup -backuptarget:%%C -include:c:,e:,y: -allCritical -vssFull -quiet
    )
  )
)
