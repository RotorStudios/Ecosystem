@echo off&setlocal
call %~dp0ecosystem-init.bat
title eco-maya-2015-devjc
call %python_exe% %ECO_ROOT%\bin\ecosystem.py -r maya -t base,maya2015,mayaPortable,devjc