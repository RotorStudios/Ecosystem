@ECHO OFF

set python_exe=S:\python\Python27\python.exe
set pythonw_exe=S:\python\Python27\pythonw.exe

for %%d in (%~dp0..) do set ECO_ROOT=%%~fd

set ECO_ENV=%ECO_ROOT%\env
set PATH=%PATH%;%ECO_ROOT%\bin;S:\dev_area\Utilities\unxUtils
