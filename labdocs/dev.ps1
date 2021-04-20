if (![System.IO.File]::Exists("C:\Program Files\Docker\Docker\DockerCli.exe")) {
    Write-Warning "ERROR: Docker doesn't appear to be installed. Please see the labdocs git documentation at https://labdocs.apps.wwtatc.com/github-labdocs/full-dev/"
    exit 1
}
if (!(get-process 'com.docker.proxy')){
    Write-Warning "ERROR: Docker isn't running. Please start docker and then run this command again"
    exit 1
}
Set-Variable -Name labdocsContainer -Value "docker.wwtatc.com/labdocs:stable"
docker pull $labdocsContainer
docker rm -f labdocs
docker run -d -p 8000:8000 --name labdocs -v ${PWD}:/documents ${labdocsContainer}
Write-Output "`nYou can now see the docs your editing at http://localhost:8000`n"