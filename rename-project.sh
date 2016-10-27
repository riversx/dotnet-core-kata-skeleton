ROOTDIR=`pwd`
PROJECTNAME=$1

# echo Resetting git repository 
# rm -Rf .git
# git init

echo Root folder: $ROOTDIR
echo Renamig project: srt/DotNetKata to: src/$PROJECTNAME
mv $ROOTDIR/src/DotNetKata $ROOTDIR/src/$PROJECTNAME

echo Renaming project: test/DotnNetKata.Test to: test/$PROJECTNAME.Tests
mv $ROOTDIR/test/DotNetKata.Tests $ROOTDIR/test/$PROJECTNAME.Tests

echo Updating test project info
sed -i -e "s/DotNetKata/$PROJECTNAME/g" test/DotNetKata.Tests/project.json
rm test/DotNetKata.Tests/project.json-e

echo Restoring and building main project
dotnet restore src/$PROJECTNAME/
dotnet build src/$PROJECTNAME/

echo Restoring and building the test project
dotnet restore test/$PROJECTNAME.Tests/
dotnet build test/$PROJECTNAME.Tests/
dotnet test test/$PROJECTNAME.Tests/
