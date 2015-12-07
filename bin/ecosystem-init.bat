@ECHO OFF

set python_exe=S:\python\Python27\python.exe
set pythonw_exe=S:\python\Python27\pythonw.exe

for %%d in (%~dp0..\..) do set ECO_ROOT=%%~fd
echo ECO_ROOT=%ECO_ROOT%

set eco_run=%python_exe% %ECO_ROOT%\Ecosystem\bin\ecosystem.py
set eco_run_w=%pythonw_exe% %ECO_ROOT%\Ecosystem\bin\ecosystem.py

set ECO_ENV=%ECO_ROOT%\Ecosystem-Env\env
echo ECO_ENV=%ECO_ENV%
set PATH=%PATH%;%ECO_ROOT%\Ecosystem\bin;S:\dev_area\Utilities\unxUtils