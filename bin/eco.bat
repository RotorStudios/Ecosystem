@ECHO OFF

set python_exe="S:\python\Python27\python.exe"

for %%d in (%~dp0..) do set ECO_ROOT=%%~fd

set ECO_ENV=%ECO_ROOT%\env
::set PG_SW_BASE /base/sw/

doskey eco=%python_exe% %~dp0ecosystem.py $*

cmd