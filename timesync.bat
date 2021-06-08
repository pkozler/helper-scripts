@echo off

echo Starting time service.
net start w32time
pause

echo Checking service status:
w32tm /query /peers
pause

echo Synchronizing time and date...
echo w32tm /resync /nowait

w32tm /resync /nowait

echo Time and date has been synchronized!
pause