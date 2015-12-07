@echo off&setlocal
call %~dp0ecosystem-init.bat
call %~dp0ecosystem-cli-aliases.bat
call %~dp0ecosystem-cli-intro.bat
title eco-system
set "PROMPT=(eco) %PROMPT%"
cmd