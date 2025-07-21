@echo off
chcp 65001 >nul
cls
color 4
title Fender's Tools

:loading
cls
echo Loading.
timeout 1 >nul
cls
echo Loading..
timeout 1 >nul
cls
echo Loading...
timeout 1 >nul
cls
echo Loading.
timeout 1 >nul
cls
echo Loading..
timeout 1 >nul
cls

:menu
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                        +--------------------------+
echo                                        ^|      Fender's Tools     ^|
echo                                        +--------------------------+

color 6
echo                                        +------------------------------------------+
echo                                        ^|   Which tool do you want to use?        ^|
echo                                        +------------------------------------------+
echo.
echo                                        ^|   1. NetworkTool                        ^|
echo                                        ^|   2. System Info Tool                   ^|
echo                                        ^|   3. Temp Files Cleaner Tool            ^|
echo                                        ^|   4. Exit                              ^|
echo                                        +------------------------------------------+
echo.
set /p keuze=Type your choice (1-4): 

if "%keuze%"=="1" goto networktool
if "%keuze%"=="2" goto systeminfo
if "%keuze%"=="3" goto tempcleaner
if "%keuze%"=="4" goto exit_program

echo Invalid choice! Please try again...
timeout 2 >nul
goto menu

:networktool
cls
echo =====[ 🌐 NETWORK TOOL ]=====
echo 1. Scan network
echo 2. Show IP configuration
echo 3. Show active network connections
echo 4. Trace route to google.com
echo 5. Flush DNS cache
echo 6. Show MAC addresses
echo 7. Back to main menu
echo.
set /p netkeuze=Choose an option (1-7): 

if "%netkeuze%"=="1" goto net_scan
if "%netkeuze%"=="2" goto net_ipconfig
if "%netkeuze%"=="3" goto net_netstat
if "%netkeuze%"=="4" goto net_tracert
if "%netkeuze%"=="5" goto net_flushdns
if "%netkeuze%"=="6" goto net_mac
if "%netkeuze%"=="7" goto menu

echo Invalid choice! Please try again...
timeout 2 >nul
goto networktool

:net_scan
cls
echo Scanning your network...
for /L %%i in (1,1,254) do (
    ping -n 1 -w 50 192.168.1.%%i | find "TTL=" >nul && echo Active device: 192.168.1.%%i
)
echo.
pause
goto networktool

:net_ipconfig
cls
ipconfig /all
echo.
pause
goto networktool

:net_netstat
cls
netstat -an
echo.
pause
goto networktool

:net_tracert
cls
tracert google.com
echo.
pause
goto networktool

:net_flushdns
cls
ipconfig /flushdns
echo DNS cache cleared.
echo.
pause
goto networktool

:net_mac
cls
getmac
echo.
pause
goto networktool

:systeminfo
cls
echo =====[ ⚙️ SYSTEM INFO TOOL ]=====
echo.
echo User: %USERNAME%
echo Computer Name: %COMPUTERNAME%
echo Uptime:
net stats workstation | find "Statistics since" || net stats srv | find "Statistics since"
echo.
echo Battery Status:
wmic path Win32_Battery get EstimatedChargeRemaining,BatteryStatus
echo.
echo RAM Usage:
systeminfo | findstr /C:"Available Physical Memory"
echo.
echo Free space on C:
wmic logicaldisk where "DeviceID='C:'" get FreeSpace,Size
echo.
pause
goto menu

:tempcleaner
cls
echo =====[ 🧹 TEMP FILES CLEANER ]=====
echo Deleting temporary files...
del /q /f /s %temp%\*
echo Done cleaning temp files.
pause
goto menu

:exit_program
cls
echo Goodbye!
timeout 2 >nul
exit
