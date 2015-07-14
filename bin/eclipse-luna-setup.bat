@echo off&setlocal
title %~n1

Set P4TICKETS=%RS_USER_DEV_WORKSPACE%\p4tickets.txt
eclipse.exe -eclipse.keyring %RS_USER_DEV_WORKSPACE%\secret