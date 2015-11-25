@echo off&setlocal
call %~dp0init-launcher.bat
title %~0
call %pythonw_exe% %ECO_ROOT%\bin\ecosystem.py -r maya -t base,maya2015,mayaportable,alpha,mtoa,altus