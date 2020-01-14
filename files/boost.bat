wmic process where name="csrss.exe" call setpriority "high"
wmic process where name="csgo.exe" call setpriority "high"
wmic process where name="quakelive_steam.exe" call setpriority "high"
wmic process where name="FortniteClient-Win64-Shipping.exe" call setpriority "high"
wmic process where name="FPSAimTrainer.exe" call setpriority "high"
wmic process where name="steam.exe" call setpriority "idle"
wmic process where name="steamwebhelper.exe" call setpriority "idle"
wmic process where name="steamservice.exe" call setpriority "idle"
wmic process where name="gameoverlayui.exe" call setpriority "idle"
wmic process where name="SetTimerResolutionService.exe" call setpriority "idle"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SetTimerResolutionService.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 00000001 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SetTimerResolutionService.exe\PerfOptions" /v IoPriority /t REG_DWORD /d 00000000 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gameoverlayui.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 00000001 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gameoverlayui.exe\PerfOptions" /v IoPriority /t REG_DWORD /d 00000000 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\steamservice.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 00000001 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\steamservice.exe\PerfOptions" /v IoPriority /t REG_DWORD /d 00000000 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\steamwebhelper.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 00000001 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\steamwebhelper.exe\PerfOptions" /v IoPriority /t REG_DWORD /d 00000000 /f
powercfg -devicedisablewake "HID-compliant mouse"
powercfg -devicedisablewake "HID keyboard Device"
powercfg -devicedisablewake "Intel(R) Ethernet Connection (2) I218-V"
powercfg.exe /setactive 66666666-6666-6666-6666-666666666666
taskkill /f /im explorer.exe
taskkill /f /im NVDisplay.Container.exe
taskkill /f /im ProcessGovernor.exe
taskkill /f /im ProcessLasso.exe
taskkill /f /im ProcessLassoPortable.exe
taskkill /f /im ProcessHacker.exe
sc stop NVDisplay.ContainerLocalSystem
sc stop sppsvc
sc stop nsi
sc stop NlaSvc
sc stop netprofm
sc stop Netman
sc stop AeLookupSvc
sc stop seclogon
sc config kbdclass start=boot
sc config mouhid start=boot
