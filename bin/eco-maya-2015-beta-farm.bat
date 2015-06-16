@echo off&setlocal
call %~dp0ecosystem-init.bat
title eco-mayaBatch-2015
call %python_exe% %ECO_ROOT%\bin\ecosystem.py -r MayaBatch -t base,maya2015,beta