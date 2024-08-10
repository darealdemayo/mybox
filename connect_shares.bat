@echo off
setlocal

set USERNAME=Mario
set SERVER=nas.26.dengg.one

set /p PASSWORD=Please enter the password: 
echo.

:: Save the credentials using cmdkey
cmdkey /add:%SERVER% /user:%USERNAME% /pass:%PASSWORD%

net use D: \\%SERVER%\downloads /user:%USERNAME% /persistent:yes
net use G: \\%SERVER%\Gerlinde /user:%USERNAME% /persistent:yes
net use I: \\%SERVER%\images /user:%USERNAME% /persistent:yes
net use M: \\%SERVER%\MarioPrivat /user:%USERNAME% /persistent:yes
net use P: \\%SERVER%\projects /user:%USERNAME% /persistent:yes
net use T: \\%SERVER%\techwiz-services /user:%USERNAME% /persistent:yes
net use U: \\%SERVER%\techwiz-projects /user:%USERNAME% /persistent:yes
net use Y: \\%SERVER%\media /user:%USERNAME% /persistent:yes
net use Z: \\%SERVER%\fileZ /user:%USERNAME% /persistent:yes

:: Check if the connections were successful
if %errorlevel%==0 (
    echo All shares connected successfully.
) else (
    echo There was an error connecting to the shares.
)

endlocal
pause
