@echo off&setlocal
call %~dp0init-launcher.bat
title %~0
call %pythonw_exe% %ECO_ROOT%\bin\ecosystem.py -t base,maya,mayaportable -r maya