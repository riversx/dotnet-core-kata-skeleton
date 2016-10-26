ROOTDIR=`pwd`
KATANAME=$1Kata
echo Root folder: $ROOTDIR
echo Renamig project: srt/DotNetKata to: src/$KATANAME
mv $ROOTDIR/src/DotNetKata $ROOTDIR/src/$KATANAME
echo Renaming project: test/DotnNetKata.Test to: test/$KATANAME.Tests
mv $ROOTDIR/test/DotNetKata.Tests $ROOTDIR/test/$KATANAME.Tests
