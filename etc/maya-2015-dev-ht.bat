@echo off&setlocal
call %~dp0ecosystem-init.bat
title eco-maya-2015-devht
call %python_exe% %ECO_ROOT%\bin\ecosystem.py -t base,maya2015,mayaportable,devht -r maya