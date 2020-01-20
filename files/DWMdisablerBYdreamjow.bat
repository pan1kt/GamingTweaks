@echo off

::	Check autologon is enabled
echo Please uncheck "Users must enter a user name and password to use this computer". After press Apply and OK(X2).
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon | find "1"
IF [%errorlevel%] NEQ [0] ECHO Autologon not enabled. Enable Autologon now. & PAUSE & START /WAIT "" "%windir%\System32\control.exe" userpasswords2 & ECHO Press eny key once AutoLogon has been enabled & PAUSE >NUL & GOTO :checkautoadminlogon

::	Take ownership of all necessary files if they exist
IF EXIST %windir%\ImmersiveControlPanel takeown /F %windir%\ImmersiveControlPanel /R /A & icacls %windir%\ImmersiveControlPanel /grant Administrators:(F) /T
IF EXIST %windir%\SystemResources takeown /F %windir%\SystemResources /R /A & icacls %windir%\SystemResources /grant Administrators:(F) /T
IF EXIST %windir%\System32\dwm.exe takeown /F %windir%\System32\dwm.exe /A & icacls %windir%\System32\dwm.exe /grant Administrators:(F)
IF EXIST %windir%\System32\Windows.UI.Search.dll takeown /F %windir%\System32\Windows.UI.Search.dll /A & icacls %windir%\System32\Windows.UI.Search.dll /grant Administrators:(F)
IF EXIST %windir%\System32\UIRibbon.dll takeown /F %windir%\System32\UIRibbon.dll /A & icacls %windir%\System32\UIRibbon.dll /grant Administrators:(F)
IF EXIST %windir%\System32\UIRibbonRes.dll takeown /F %windir%\System32\UIRibbonRes.dll /A & icacls %windir%\System32\UIRibbonRes.dll /grant Administrators:(F)
IF EXIST %windir%\System32\UIAnimation.dll takeown /F %windir%\System32\UIAnimation.dll /A & icacls %windir%\System32\UIAnimation.dll /grant Administrators:(F)
IF EXIST %windir%\System32\UIAutomationCore.dll takeown /F %windir%\System32\UIAutomationCore.dll /A & icacls %windir%\System32\UIAutomationCore.dll /grant Administrators:(F)
IF EXIST %windir%\System32\UIAutomationCoreRes.dll takeown /F %windir%\System32\UIAutomationCoreRes.dll /A & icacls %windir%\System32\UIAutomationCoreRes.dll /grant Administrators:(F)
IF EXIST %windir%\System32\SystemSettings.Handlers.dll takeown /F %windir%\System32\SystemSettings.Handlers.dll /A & icacls %windir%\System32\SystemSettings.Handlers.dll /grant Administrators:(F)
IF EXIST %windir%\System32\SystemSettingsAdminFlows.exe takeown /F %windir%\System32\SystemSettingsAdminFlows.exe /A & icacls %windir%\System32\SystemSettingsAdminFlows.exe /grant Administrators:(F)
IF EXIST %windir%\System32\SystemSettingsAdminFlowUI.dll takeown /F %windir%\System32\SystemSettingsAdminFlowUI.dll /A & icacls %windir%\System32\SystemSettingsAdminFlowUI.dll /grant Administrators:(F)
IF EXIST %windir%\System32\SystemSettingsDatabase.dll takeown /F %windir%\System32\SystemSettingsDatabase.dll /A & icacls %windir%\System32\SystemSettingsDatabase.dll /grant Administrators:(F)
IF EXIST %windir%\System32\SystemSettingsRemoveDevice.exe takeown /F %windir%\System32\SystemSettingsRemoveDevice.exe /A & icacls %windir%\System32\SystemSettingsRemoveDevice.exe /grant Administrators:(F)
IF EXIST %windir%\System32\mspaint.exe takeown /F %windir%\System32\mspaint.exe /A & icacls %windir%\System32\mspaint.exe /grant Administrators:(F)
IF EXIST %windir%\System32\en-US\mspaint.exe.mui takeown /F %windir%\System32\en-US\mspaint.exe.mui /A & icacls %windir%\System32\en-US\mspaint.exe.mui /grant Administrators:(F)
IF EXIST C:\Program Files\Windows NT\Accessories takeown /F C:\Program Files\Windows NT\Accessories /A & icacls C:\Program Files\Windows NT\Accessories /grant Administrators:(F)

::	Bacukup or delete files/folders depending on if backups exist or not.
::	for dwm.exe - check that the file size has not changed instead so it not overwritten each time.
IF NOT EXIST %windir%\ImmersiveControlPanel.old IF EXIST %windir%\ImmersiveControlPanel REN %windir%\ImmersiveControlPanel ImmersiveControlPanel.old
IF EXIST %windir%\ImmersiveControlPanel.old IF EXIST %windir%\ImmersiveControlPanel RMDIR /S /Q %windir%\ImmersiveControlPanel
IF NOT EXIST %windir%\SystemResources.old IF EXIST %windir%\SystemResources REN %windir%\SystemResources SystemResources.old
IF EXIST %windir%\SystemResources.old IF EXIST %windir%\SystemResources RMDIR /S /Q %windir%\SystemResources
IF NOT EXIST %windir%\System32\Windows.UI.Search.dll.old IF EXIST %windir%\System32\Windows.UI.Search.dll REN %windir%\System32\Windows.UI.Search.dll Windows.UI.Search.dll.old
IF EXIST %windir%\System32\Windows.UI.Search.dll.old IF EXIST %windir%\System32\Windows.UI.Search.dll DEL /q %windir%\System32\Windows.UI.Search.dll
IF NOT EXIST %windir%\System32\UIRibbon.dll.old IF EXIST %windir%\System32\UIRibbon.dll REN %windir%\System32\UIRibbon.dll UIRibbon.dll.old
IF EXIST %windir%\System32\UIRibbon.dll.old IF EXIST %windir%\System32\UIRibbon.dll DEL /q %windir%\System32\UIRibbon.dll
IF NOT EXIST %windir%\System32\UIRibbonRes.dll.old IF EXIST %windir%\System32\UIRibbonRes.dll REN %windir%\System32\UIRibbonRes.dll UIRibbonRes.dll.old
IF EXIST %windir%\System32\UIRibbonRes.dll.old IF EXIST %windir%\System32\UIRibbonRes.dll DEL /q %windir%\System32\UIRibbonRes.dll
IF NOT EXIST %windir%\System32\UIAnimation.dll.old IF EXIST %windir%\System32\UIAnimation.dll REN %windir%\System32\UIAnimation.dll UIAnimation.dll.old
IF EXIST %windir%\System32\UIAnimation.dll.old IF EXIST %windir%\System32\UIAnimation.dll DEL /q %windir%\System32\UIAnimation.dll
IF NOT EXIST %windir%\System32\UIAutomationCore.dll.old IF EXIST %windir%\System32\UIAutomationCore.dll REN %windir%\System32\UIAutomationCore.dll UIAutomationCore.dll.old
IF EXIST %windir%\System32\UIAutomationCore.dll.old IF EXIST %windir%\System32\UIAutomationCore.dll DEL /q %windir%\System32\UIAutomationCore.dll
IF NOT EXIST %windir%\System32\UIAutomationCoreRes.dll.old IF EXIST %windir%\System32\UIAutomationCoreRes.dll REN %windir%\System32\UIAutomationCoreRes.dll UIAutomationCoreRes.dll.old
IF EXIST %windir%\System32\UIAutomationCoreRes.dll.old IF EXIST %windir%\System32\UIAutomationCoreRes.dll DEL /q %windir%\System32\UIAutomationCoreRes.dll
IF NOT EXIST %windir%\System32\SystemSettings.Handlers.dll.old IF EXIST %windir%\System32\SystemSettings.Handlers.dll REN %windir%\System32\SystemSettings.Handlers.dll SystemSettings.Handlers.dll.old
IF EXIST %windir%\System32\SystemSettings.Handlers.dll.old IF EXIST %windir%\System32\SystemSettings.Handlers.dll DEL /q %windir%\System32\SystemSettings.Handlers.dll
IF NOT EXIST %windir%\System32\SystemSettingsAdminFlows.exe.old IF EXIST %windir%\System32\SystemSettingsAdminFlows.exe REN %windir%\System32\SystemSettingsAdminFlows.exe SystemSettingsAdminFlows.exe.old
IF EXIST %windir%\System32\SystemSettingsAdminFlows.exe.old IF EXIST %windir%\System32\SystemSettingsAdminFlows.exe DEL /q %windir%\System32\SystemSettingsAdminFlows.exe
IF NOT EXIST %windir%\System32\SystemSettingsAdminFlowUI.dll.old IF EXIST %windir%\System32\SystemSettingsAdminFlowUI.dll REN %windir%\System32\SystemSettingsAdminFlowUI.dll SystemSettingsAdminFlowUI.dll.old
IF EXIST %windir%\System32\SystemSettingsAdminFlowUI.dll.old IF EXIST %windir%\System32\SystemSettingsAdminFlowUI.dll DEL /q %windir%\System32\SystemSettingsAdminFlowUI.dll
IF NOT EXIST %windir%\System32\SystemSettingsDatabase.dll.old IF EXIST %windir%\System32\SystemSettingsDatabase.dll REN %windir%\System32\SystemSettingsDatabase.dll SystemSettingsDatabase.dll.old
IF EXIST %windir%\System32\SystemSettingsDatabase.dll.old IF EXIST %windir%\System32\SystemSettingsDatabase.dll DEL /q %windir%\System32\SystemSettingsDatabase.dll
IF NOT EXIST %windir%\System32\SystemSettingsRemoveDevice.exe.old IF EXIST %windir%\System32\SystemSettingsRemoveDevice.exe REN %windir%\System32\SystemSettingsRemoveDevice.exe SystemSettingsRemoveDevice.exe.old
IF EXIST %windir%\System32\SystemSettingsRemoveDevice.exe.old IF EXIST %windir%\System32\SystemSettingsRemoveDevice.exe DEL /q %windir%\System32\SystemSettingsRemoveDevice.exe
IF NOT EXIST %windir%\System32\en-US\mspaint.exe.mui.old IF EXIST %windir%\en-US\mspaint.exe.mui REN %windir%\en-US\mspaint.exe.mui mspaint.exe.mui.old
IF EXIST %windir%\en-US\mspaint.exe.mui IF EXIST %windir%\en-US\mspaint.exe.mui DEL /q %windir%\en-US\mspaint.exe.mui
IF NOT EXIST C:\Program Files\Windows NT\Accessories.old IF EXIST C:\Program Files\Windows NT\Accessories REN C:\Program Files\Windows NT\Accessories Accessories.old
IF EXIST C:\Program Files\Windows NT\Accessories.old IF EXIST C:\Program Files\Windows NT\Accessories RMDIR /S /Q C:\Program Files\Windows NT\Accessories
move UIAnimation.dll C:\Windows\System32
move UIAutomationCore.dll C:\Windows\System32
move mspaint.exe.mui C:\Windows\System32\en-US
move mspaint.exe C:\Windows\System32

::mspainttweaks
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Colors" /v "NumberOfColors" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar0" /v "BarID" /t REG_DWORD /d "59393" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar1" /v "BarID" /t REG_DWORD /d "59420" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar1" /v "Bars" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar1" /v "Bar#0" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar1" /v "Bar#1" /t REG_DWORD /d "59415" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar1" /v "Bar#2" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar2" /v "BarID" /t REG_DWORD /d "59419" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar2" /v "Bars" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar2" /v "Bar#0" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar2" /v "Bar#1" /t REG_DWORD /d "59416" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar2" /v "Bar#2" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar3" /v "BarID" /t REG_DWORD /d "59415" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar3" /v "XPos" /t REG_DWORD /d "4294967294" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar3" /v "YPos" /t REG_DWORD /d "4294967294" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar3" /v "Docking" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar3" /v "MRUDockID" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar3" /v "MRUDockLeftPos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar3" /v "MRUDockTopPos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar3" /v "MRUDockRightPos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar3" /v "MRUDockBottomPos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar3" /v "MRUFloatStyle" /t REG_DWORD /d "4096" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar3" /v "MRUFloatXPos" /t REG_DWORD /d "2147483648" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar3" /v "MRUFloatYPos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar4" /v "BarID" /t REG_DWORD /d "59416" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar4" /v "XPos" /t REG_DWORD /d "4294967294" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar4" /v "YPos" /t REG_DWORD /d "4294967294" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar4" /v "Docking" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar4" /v "MRUDockID" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar4" /v "MRUDockLeftPos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar4" /v "MRUDockTopPos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar4" /v "MRUDockRightPos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar4" /v "MRUDockBottomPos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar4" /v "MRUFloatStyle" /t REG_DWORD /d "8192" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar4" /v "MRUFloatXPos" /t REG_DWORD /d "2147483648" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Bar4" /v "MRUFloatYPos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Summary" /v "Bars" /t REG_DWORD /d "5" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Summary" /v "ScreenCX" /t REG_DWORD /d "1440" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\General-Summary" /v "ScreenCY" /t REG_DWORD /d "900" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Settings" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Text" /v "ShowTextTool" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Text" /v "PointSize" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Text" /v "PositionX" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Text" /v "PositionY" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Text" /v "Bold" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Text" /v "Underline" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Text" /v "Italic" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Text" /v "VerticalEdit" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Text" /v "TextPen" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Text" /v "TypeFaceName" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Text" /v "CharSet" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\View" /v "WindowPlacement" /t REG_BINARY /d "2c00000002000000030000000000000000000000ffffffffffffffff000000000000000080020000e0010000" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\View" /v "ShowThumbnail" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\View" /v "BMPWidth" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\View" /v "BMPHeight" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\View" /v "ThumbXPos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\View" /v "ThumbYPos" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\View" /v "ThumbWidth" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\View" /v "ThumbHeight" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\View" /v "UnitSetting" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\View" /v "NoStretching" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\View" /v "SnapToGrid" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\View" /v "GridExtent" /t REG_DWORD /d "1" /f

::dwm
IF NOT EXIST %windir%\System32\dwm.exe.old IF EXIST %windir%\System32\dwm.exe REN %windir%\System32\dwm.exe dwm.exe.old
IF EXIST %windir%\System32\dwm.exe.old (
FOR /F "usebackq" %%A IN ('C:\Windows\System32\rundll32.exe') DO SET filesize1=%%~zA
FOR /F "usebackq" %%A IN ('C:\Windows\System32\dwm.exe') DO SET filesize2=%%~zA
IF [%filesize1%] NEQ [%filesize2%] (
DEL /q %windir%\System32\dwm.exe
COPY /B %windir%\System32\Rundll32.exe %windir%\System32\dwm.exe /Y
)
)
pause
exit