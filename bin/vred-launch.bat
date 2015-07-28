pushd %~pd0
set VRED_LAUNCH_PY="%STUDIO_VRED_STARTUP%/startup.py"


"%VRED_EXE%" -prepython "execfile(r'"%VRED_LAUNCH_PY%"')"