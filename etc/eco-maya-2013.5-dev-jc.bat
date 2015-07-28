@echo off&setlocal

title %~n1
call %~dp0init-launcher.bat

call %python_exe% %ECO_ROOT%\bin\ecosystem.py -t base,maya2013ext,mayaportable,devjc -r maya