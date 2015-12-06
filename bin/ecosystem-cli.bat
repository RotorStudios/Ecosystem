@ECHO OFF

mode con: cols=100 lines=50
powershell -command "&{$H=get-host;$W=$H.ui.rawui;$B=$W.buffersize;$B.width=100;$B.height=9999;$W.buffersize=$B;}"

set RS_SHORTCUTS=S:\dev_area\Applications

Doskey eco=%__run_eco_e% $*


:: Maya aliases
Doskey maya2015=%eco_run_w%       -r maya -t base,maya2015,mayaportable,stable

Doskey maya2015-rc=%eco_run_w%       -r maya -t base,maya2015,mayaportable,rc,mtoa
Doskey maya2015-beta=%eco_run_w%  -r maya -t base,maya2015,mayaportable,beta,mtoa
Doskey maya2015-alpha=%eco_run_w% -r maya -t base,maya2015,mayaportable,alpha,mtoa

Doskey maya2015-dev=%eco_run_w%   -r maya -t base,maya2015,mayaportable,dev,mtoa,altus,alShaders
Doskey maya2015-devjc=%eco_run_w% -r maya -t base,maya2015,mayaportable,devjc,mtoa,altus,alShaders

:: IDE aliases
Doskey eclipse-luna=%__run_eco% -r eco-eclipse-luna-setup.bat -t base,eclipse-luna
::Doskey     sublimeText2=%eco_run_w -r sublime_text -t base,sublimeText2
Doskey sublime2=%RS_SHORTCUTS%\sublime_text2.lnk
Doskey sublime3=%RS_SHORTCUTS%\sublime_text3.lnk


:: production tool aliases
Doskey rv=%RS_SHORTCUTS%\rv-stable.lnk
Doskey sg=%RS_SHORTCUTS%\shotgun.lnk

Doskey xy=%RS_SHORTCUTS%\XYplorer.lnk



