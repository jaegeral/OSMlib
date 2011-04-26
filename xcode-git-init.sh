#!/bin/sh
git init
echo "Creating .gitignore."
echo "build" >> .gitignore
echo "*.pbxuser" >> .gitignore
echo "*.mode1v3" >> .gitignore
echo ".DS_Store" >> .gitignore
echo "Creating .gitattributes."
echo "*.pbxproj -crlf -diff -merge" >> .gitattributes
echo "Commiting initial revision."
git add . -v
git commit -m "Initial revision."
echo "Finished. Have fun."
