pushd %~pd0
set VRED_LAUNCH_PY="%RS_VRED_STARTUP%/startup.py"

start cmd /k %PYTHON_EXE% "%RS_LAUNCHER_VRED%/startup/launchVredTools.py"

"%VRED_EXE%" -prepython "execfile(r'"%VRED_LAUNCH_PY%"')"