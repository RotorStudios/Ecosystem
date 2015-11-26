@ECHO OFF

mode con: cols=100 lines=50
powershell -command "&{$H=get-host;$W=$H.ui.rawui;$B=$W.buffersize;$B.width=100;$B.height=9999;$W.buffersize=$B;}"

Doskey eco=%python_exe% %ECO_ROOT%\bin\ecosystem.py $*

:: Maya aliases
Doskey maya2015=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py       -r maya -t base,maya2015,mayaportable,stable

Doskey maya2015-rc=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py    -r maya -t base,maya2015,mayaportable,rc,mtoa
Doskey maya2015-beta=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py  -r maya -t base,maya2015,mayaportable,beta,mtoa
Doskey maya2015-alpha=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py -r maya -t base,maya2015,mayaportable,alpha,mtoa

Doskey maya2015-dev=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py   -r maya -t base,maya2015,mayaportable,dev,mtoa,altus,alShaders
Doskey maya2015-devjc=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py -r maya -t base,maya2015,mayaportable,devjc,mtoa,altus,alShaders

:: IDE aliases
Doskey eclipse-luna=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py -r eco-eclipse-luna-setup.bat -t base,eclipse-luna
::Doskey     sublimeText2=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py -r sublime_text -t base,sublimeText2
Doskey sublime2=%RS_SHORTCUTS%\sublime_text2.lnk
Doskey sublime3=%RS_SHORTCUTS%\sublime_text3.lnk


:: production tool aliases
Doskey rv=%RS_SHORTCUTS%\rv-stable.lnk
Doskey sg=%RS_SHORTCUTS%\shotgun.lnk

Doskey xy=%RS_SHORTCUTS%\XYplorer.lnk



