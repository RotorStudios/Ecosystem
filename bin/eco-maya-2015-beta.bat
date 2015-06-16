@echo off&setlocal
call %~dp0ecosystem-init.bat
title eco-system-maya-2015-beta
call %python_exe% %ECO_ROOT%\bin\ecosystem.py -r maya -t base,maya2015,beta,mayaPortable