@echo off
set PROJECTNAME="rom"

rem	Build ROM
echo Assembling...
rem rgbasm -o Driver.obj Driver.asm
rgbasm -o %PROJECTNAME%.obj Main.asm
if errorlevel 1 goto :BuildError
echo Linking...
rem rgblink -o %PROJECTNAME%.gbc -n %PROJECTNAME%.sym -p 255 %PROJECTNAME%.obj Driver.obj
rgblink -o %PROJECTNAME%.gbc -n %PROJECTNAME%.sym -p 255 %PROJECTNAME%.obj
if errorlevel 1 goto :BuildError
echo Fixing...
rgbfix -m 0x19 -v -p 255 %PROJECTNAME%.gbc
echo Cleaning up...
del %PROJECTNAME%.obj
rem del Driver.obj
echo Build complete.
goto :end

:BuildError
set PROJECTNAME=
echo Build failed, aborting...
goto:eof

:end
rem unset vars
set PROJECTNAME=
echo ** Build finished with no errors **