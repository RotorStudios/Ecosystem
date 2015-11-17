@ECHO OFF

mode con: cols=100 lines=50
powershell -command "&{$H=get-host;$W=$H.ui.rawui;$B=$W.buffersize;$B.width=100;$B.height=9999;$W.buffersize=$B;}"

Doskey eco=%python_exe% %ECO_ROOT%\bin\ecosystem.py $*

Doskey maya2015=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py -r maya -t maya2015,base,stable,mayaportable
Doskey maya2015-beta=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py -r maya -t maya2015,base,beta,mayaportable
Doskey maya2015-alpha=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py -r maya -t maya2015,base,alpha,mayaportable
::Doskey    maya2015-dev=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py -r maya -t maya2015,base,dev,mayaportable
Doskey maya2015-dev=%RS_SHORTCUTS%\maya-2015-dev.lnk
Doskey maya2015-devjc=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py -r maya -t maya2015,base,devjc,mayaportable

Doskey eclipse-luna=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py -r eco-eclipse-luna-setup.bat -t base,eclipse-luna
::Doskey     sublimeText2=%pythonw_exe% %ECO_ROOT%\bin\ecosystem.py -r sublime_text -t base,sublimeText2
Doskey sublime2=%RS_SHORTCUTS%\sublime_text2.lnk
Doskey sublime3=%RS_SHORTCUTS%\sublime_text3.lnk

Doskey rv=%RS_SHORTCUTS%\rv-stable.lnk
Doskey sg=%RS_SHORTCUTS%\shotgun.lnk

Doskey xy=%RS_SHORTCUTS%\XYplorer.lnk