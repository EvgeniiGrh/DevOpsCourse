#!/bin/bash 

buildResFile=./dist/client-app.zip

if [ -e "$buildResFile" ]; then
       rm "$buildResFile"	
       echo "previous client-app.zip was removed"
fi

ng build --configuration=$ENV_CONFIGURATION --output-path=./dist
zip -r $buildResFile ./dist/*



