@echo off
setlocal

:: Define the username
set USERNAME=domain\Mario
set SERVER=nas.26.dengg.one

:: Prompt for the password (input will not be visible)
set /p PASSWORD=Please enter the password: 
echo.

:: Connect to the network shares
net use D: \\%SERVER%\downloads /user:%USERNAME% %PASSWORD%
net use G: \\%SERVER%\Gerlinde /user:%USERNAME% %PASSWORD%
net use I: \\%SERVER%\images /user:%USERNAME% %PASSWORD%
net use M: \\%SERVER%\MarioPrivat /user:%USERNAME% %PASSWORD%
net use P: \\%SERVER%\projects /user:%USERNAME% %PASSWORD%
net use T: \\%SERVER%\techwiz-services /user:%USERNAME% %PASSWORD%
net use U: \\%SERVER%\techwiz-projects /user:%USERNAME% %PASSWORD%
net use Y: \\%SERVER%\media /user:%USERNAME% %PASSWORD%
net use Z: \\%SERVER%\fileZ /user:%USERNAME% %PASSWORD%


:: Check if the connections were successful
if %errorlevel%==0 (
    echo All shares connected successfully.
) else (
    echo There was an error connecting to the shares.
)

endlocal
pause
