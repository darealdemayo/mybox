@echo off
setlocal

:: Define the username and server
set USERNAME=Mario
set SERVER=nas.26.dengg.one

:: Prompt for the password (input will not be visible)
set /p PASSWORD=Please enter the password: 
echo.

:: Save the credentials using cmdkey
cmdkey /add:%SERVER% /user:%USERNAME% /pass:%PASSWORD%

:: Connect to the network shares persistently with saved credentials
net use D: \\%SERVER%\downloads /savecred /persistent:yes
net use G: \\%SERVER%\Gerlinde /savecred /persistent:yes
net use I: \\%SERVER%\images /savecred /persistent:yes
net use M: \\%SERVER%\MarioPrivat /savecred /persistent:yes
net use P: \\%SERVER%\projects /savecred /persistent:yes
net use T: \\%SERVER%\techwiz-services /savecred /persistent:yes
net use U: \\%SERVER%\techwiz-projects /savecred /persistent:yes
net use Y: \\%SERVER%\media /savecred /persistent:yes
net use Z: \\%SERVER%\fileZ /savecred /persistent:yes

:: Check if the connections were successful
if %errorlevel%==0 (
    echo All shares connected successfully.
) else (
    echo There was an error connecting to the shares.
)

endlocal
pause
