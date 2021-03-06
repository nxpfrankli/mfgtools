@echo off

call git --version
IF ERRORLEVEL 1 (
	echo build from tarball
) ELSE (
	IF "%APPVEYOR_BUILD_VERSION%" == "" (
		echo build not from appveryor
	) ELSE (
		git tag uuu_%APPVEYOR_BUILD_VERSION%
	) 

	FOR /F "tokens=*" %%a in ('call git describe --tags --long') do (
		echo #define GIT_VERSION "lib%%a" > %1/gitversion.h
	)
)