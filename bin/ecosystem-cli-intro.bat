@ECHO OFF

echo.
echo.
echo *** CLI for Rotor Studio Tools ***
echo.
echo.
echo commands:
echo.
echo    eco - ecosystem: Peregrine Ecosystem, environment, 
echo                      build and deploy management toolset v0.1.1
echo.
echo                      eco -r ^<run_command^> -t ^<list_of_tools^>
echo          Example: eco -r maya -t base,maya2015,stable
echo.
echo    maya2015        - maya 2015: stable production, maya portable - on
echo    maya2015-beta   - maya 2015: beta production, maya portable on
echo    maya2015-alpha  - maya 2015: alpha development environment, maya portable - on
echo    maya2015-dev    - maya 2015: launches in the logged in users dev env, maya portable - on
echo    maya2015-dev-jc - maya 2015: dev environment for JC, maya portable - on
echo.
echo    eclipse-luna - eclipse IDE
echo    sublimeText2 - sublimeText2 IDE
echo    sublimeText3 - sublimeText3 IDE
echo.
echo    rv - review tool: simlar to djv
echo    sg - shotgun desktop
echo    xy - xyplorer: windows explorer alternative
echo.
echo.