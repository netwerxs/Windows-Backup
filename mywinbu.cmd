@echo off
cls

REM 01 13489509348503
REM 02 23489509348503
REM 03 33489509348503
REM 04 43489509348503
REM 05 53489509348503

for /F "tokens=1,2,3" %%A in (%0) do (
  if %%A.==REM. (
    echo wbadmin start backup -backuptarget:\\?\%%C\ -include:c:,d:,e:,f: -systemState -allCritical -vssFull
  )
)
