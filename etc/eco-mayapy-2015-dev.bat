@echo off&setlocal

title %~n0
call %~dp0init-launcher.bat

call %python_exe% %ECO_ROOT%\bin\ecosystem.py -r mayapy -t maya2015,dev,base