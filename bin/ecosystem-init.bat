@ECHO OFF

set python_exe=S:\python\Python27\python.exe

for %%d in (%~dp0..) do set ECO_ROOT=%%~fd

set ECO_ENV=%ECO_ROOT%\env
set PATH=%PATH%;%ECO_ROOT%\bin


Doskey eco=%python_exe% ecosystem.py $*



Doskey maya-2015=%python_exe% %ECO_ROOT%\bin\ecosystem.py -r maya -t maya2015,base,pythonBase,mayaPortable
Doskey maya-2015-beta=%python_exe% %ECO_ROOT%\bin\ecosystem.py -r maya -t maya2015,base,pythonBase,mayaPortable,beta
Doskey maya-2015-devUser=%python_exe% %ECO_ROOT%\bin\ecosystem.py -r maya -t maya2015,base,pythonBase,mayaPortable,devUser