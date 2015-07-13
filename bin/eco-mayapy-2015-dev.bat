@echo off&setlocal
call %~dp0ecosystem-init.bat
title eco-maya-2015-dev
call %python_exe% %ECO_ROOT%\bin\ecosystem.py -r mayapy -t maya2015,dev,base