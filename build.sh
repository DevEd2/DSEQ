#!/bin/sh
PROJECTNAME="dseq"

BuildError ()
{
	PROJECTNAME=
	echo Build failed, aborting...
	exit 1
}

echo Assembling...
rgbasm -o $PROJECTNAME.obj Main.asm
if test $? -eq 1; then BuildError; fi

echo Linking...
rgblink -o $PROJECTNAME.gbc -n $PROJECTNAME.sym -p 255 $PROJECTNAME.obj
if test $? -eq 1; then BuildError; fi

echo Fixing...
rgbfix -m 0x19 -v -p 0 $PROJECTNAME.gbc

echo Cleaning up...
rm *.obj

PROJECTNAME=
echo "** Build finished with no errors**"
