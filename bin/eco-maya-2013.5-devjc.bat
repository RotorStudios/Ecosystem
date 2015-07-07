@echo off&setlocal
call %~dp0ecosystem-init.bat
title eco-system
call %python_exe% %ECO_ROOT%\bin\ecosystem.py -r maya -t base,maya2013ext,mayaPortable,devjc