:: Copyright (c) 2026 Zach Metcalf. All Rights Reserved.

@echo off
title standards

set cwd=%~dp0
set projectdir=%cwd%..\..
set tempdir=%projectdir%\.standards

if exist "%tempdir%" (
	rmdir /s /q "%tempdir%"
)

mkdir "%tempdir%"

pushd "%tempdir%"

git clone --branch main https://github.com/zachmetcalf/zachmetcalf .

popd

call %tempdir%\scripts\standards.bat "%projectdir%"

rmdir /s /q "%tempdir%"

echo standards completed
exit /b 0
