#!/bin/bash
dockerPath=`which docker`
if [ $? = 1 ]; then
    echo ""
    echo "ERROR: Docker doesn't appear to be installed. Please see the labdocs git documentation at https://labdocs.apps.wwtatc.com/github-labdocs/full-dev/"
    echo ""
    exit 1
fi
dockerVersion=`docker version`
if [ $? = 1 ]; then
    echo ""
    echo "ERROR: Docker isn't running"
	echo "Please start docker and then run this command again"
    echo ""
    exit 1
fi

labdocsContainer='docker.wwtatc.com/labdocs:stable'
docker pull ${labdocsContainer}
docker rm -f labdocs
docker run -d -p 8000:8000 --name labdocs -v "${PWD}":/documents ${labdocsContainer}
echo ""
echo "You can now see the docs your editing at http://localhost:8000"
