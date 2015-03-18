@ECHO OFF

set python_exe="S:\python\Python27\python.exe"

for %%d in (%~dp0..) do set ECO_ROOT=%%~fd

set ECO_ENV=%ECO_ROOT%\env


Doskey eco=Command Line$Texit$TExit
Echo eco | %COMSPEC% /K > NUL
Doskey eco=%python_exe% %ECO_ROOT%\bin\ecosystem.py $*