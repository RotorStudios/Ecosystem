@echo off&setlocal
title eco-system

pushd %~dp0

call %~dp0ecosystem-init.bat
set "PROMPT=(eco) %PROMPT%"
cmd

popd