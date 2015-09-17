@ECHO OFF

set python_exe=S:\python\Python27\pythonw.exe

for %%d in (%~dp0..) do set ECO_ROOT=%%~fd

set ECO_ENV=%ECO_ROOT%\env
set PATH=%PATH%;%ECO_ROOT%\bin


Doskey eco=%python_exe% %ECO_ROOT%\bin\ecosystem.py $*

Doskey maya-2015-stable=%python_exe% %ECO_ROOT%\bin\ecosystem.py -t base,maya2015,mayaportable,stable -r maya
Doskey   maya-2015-beta=%python_exe% %ECO_ROOT%\bin\ecosystem.py -t base,maya2015,mayaportable,beta -r maya
Doskey  maya-2015-alpha=%python_exe% %ECO_ROOT%\bin\ecosystem.py -t base,maya2015,mayaportable,alpha -r maya

Doskey    maya-2015-dev=%python_exe% %ECO_ROOT%\bin\ecosystem.py -t base,maya2015,mayaportable,dev -r maya
Doskey maya-2015-dev-jc=%python_exe% %ECO_ROOT%\bin\ecosystem.py -t base,maya2015,mayaportable,devjc -r maya

Doskey     eclipse-luna=start %python_exe% %ECO_ROOT%\bin\ecosystem.py -t base,eclipse-luna -r eclipse-luna-setup.bat

Doskey     rv="S:\dev_area\apps\tweak\rv-stable.lnk"
