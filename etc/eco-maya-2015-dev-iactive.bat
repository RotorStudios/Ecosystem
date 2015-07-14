@echo off&setlocal

title %~n1
call %~dp0init-launcher.bat
s
call %python_exe% %ECO_ROOT%\bin\ecosystem.py -t base,maya2015,mayaPortable,dev,dept-iactive -r maya
