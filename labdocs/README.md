# Labdocs Template

Use this template to create labdocs for a platform lab


## Labdocs Documentation
<https://labdocs.apps.wwtatc.com/labdocs-docs/>

## Normal Use
Normally this template will be cloned automatically when you click the "CREATE LAB DOCS IN GITHUB" button in the "OPTIONS" of the "Access" section of your lab at <https://admin.apps.wwt.com>. Clicking this button will clone this repository and setup all the necessary settings. The new repo will be called \<labname-slug\>-labdocs and be placed in <https://github.com/wwt> as a private repo.

All editing should be done in the Markdown (.md) files in the docs folder.

A refernece guide for Markdown can be found at <https://www.markdownguide.org/cheat-sheet/>

## Updating the server
After modifying and saving files in the "docs" folder you will need to "commit" them to github. You can use any github GUI or CLI tool you want. You can also edit and create files directly on github.com.

## Contents
Nothing in this folder will be rendered as part of the documentation. Only the files in the "docs" folder will be used.

## Live docs link
Within a couple of minutes of pushing your changes to git you should be able to see them at https://labdocs-review.apps.wwtatc.com/REPONAME

## Testing locally
If you would like to test on your local system you will need to follow these steps

1. install docker
    * mac - <https://download.docker.com/mac/stable/Docker.dmg>
    * win - <https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe>
2. run `dev.sh` for mac & linux or `dev.bat` or `dev.ps1` for windows to run a local server
4. point a browser to the url echoed from the dev command ex: <http://localhost:8000>
4. as you change files and save the changes should show up in the open web browser

