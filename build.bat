@echo off
set PROJECTNAME="dseq"

echo Assembling...
rgbasm -o %PROJECTNAME%.obj Main.asm
if errorlevel 1 goto :BuildError

echo Linking...
rgblink -o %PROJECTNAME%.gbc -n %PROJECTNAME%.sym -p 255 %PROJECTNAME%.obj
if errorlevel 1 goto :BuildError

echo Fixing...
rgbfix -m 0x19 -v -p 0 %PROJECTNAME%.gbc

echo Cleaning up...
del %PROJECTNAME%.obj
goto :end

:BuildError
set PROJECTNAME=
echo Build failed, aborting...
goto:eof

:end
rem unset vars
set PROJECTNAME=
echo ** Build finished with no errors **