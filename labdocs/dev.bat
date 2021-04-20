echo off
if exist "C:\Program Files\Docker\Docker\DockerCli.exe" (
	echo Docker is installed... proceeding
) else (
	echo.
	echo ERROR: Docker doesn't appear to be installed. Please see the labdocs git documentation at https://labdocs.apps.wwtatc.com/github-labdocs/full-dev/
	exit /B 2
)
docker version>"%TEMP%\CommandOutput.tmp"
if errorlevel = 1 (
	echo.
	echo ERROR: Docker isn't running
	echo Please start docker and then run this command again
	exit /B 2
)
set labdocsContainer=docker.wwtatc.com/labdocs:stable
docker pull %labdocsContainer%
docker rm -f labdocs
docker run -d -p 8000:8000 --name labdocs -v %cd%:/documents %labdocsContainer%
echo.
echo You can now see the docs your editing at http://localhost:8000
echo.