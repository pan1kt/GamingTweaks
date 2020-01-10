reg delete "hkcr\desktopbackground\shell" /f 
reg add "hkcr\desktopbackground\shell\11nv" /v "icon" /t reg_sz /d "c:\program files\nvidia corporation\display.nvcontainer\nvdisplay.container.exe" /f
reg add "hkcr\desktopbackground\shell\11nv" /v "position" /t reg_sz /d "top" /f
reg add "hkcr\desktopbackground\shell\11nv" /ve /t reg_sz /d "Restore NVIDIA Control Panel" /f
reg add "hkcr\desktopbackground\shell\11nv\command" /ve /t reg_sz /d "sc start NVDisplay.ContainerLocalSystem" /f
reg add "hkcr\desktopbackground\shell\12steamnobrowser" /v "icon" /t reg_sz /d "c:\program files (x86)\steam\steam.exe" /f
reg add "hkcr\desktopbackground\shell\12steamnobrowser" /v "position" /t reg_sz /d "top" /f
reg add "hkcr\desktopbackground\shell\12steamnobrowser" /ve /t reg_sz /d "Launch Steam -nobrowser" /f
reg add "hkcr\desktopbackground\shell\12steamnobrowser\command" /ve /t reg_sz /d "powerrun steamnobrowser.bat" /f
reg add "hkcr\desktopbackground\shell\13notepad" /v "icon" /t reg_sz /d "c:\program files\notepad++\notepad++.exe" /f
reg add "hkcr\desktopbackground\shell\13notepad" /v "position" /t reg_sz /d "top" /f
reg add "hkcr\desktopbackground\shell\13notepad" /v "separatorbefore" /t reg_sz /d "" /f
reg add "hkcr\desktopbackground\shell\13notepad" /ve /t reg_sz /d "Notepad++" /f
reg add "hkcr\desktopbackground\shell\13notepad\command" /ve /t reg_sz /d "c:\program files\notepad++\notepad++.exe" /f
reg add "hkcr\desktopbackground\shell\14runas" /v "hasluashield" /t reg_sz /d "" /f
reg add "hkcr\desktopbackground\shell\14runas" /v "icon" /t reg_sz /d "cmd.exe" /f
reg add "hkcr\desktopbackground\shell\14runas" /v "position" /t reg_sz /d "top" /f
reg add "hkcr\desktopbackground\shell\14runas" /v "separatorbefore" /t reg_sz /d "" /f
reg add "hkcr\desktopbackground\shell\14runas" /ve /t reg_sz /d "CMD Promt" /f
reg add "hkcr\desktopbackground\shell\14runas\command" /ve /t reg_sz /d "cmd.exe /s /k pushd \"%%v\"" /f
reg add "hkcr\desktopbackground\shell\5dns" /v "icon" /t reg_sz /d "imageres.dll,20" /f
reg add "hkcr\desktopbackground\shell\5dns" /v "muiverb" /t reg_sz /d "Set DNS" /f
reg add "hkcr\desktopbackground\shell\5dns" /v "position" /t reg_sz /d "top" /f
reg add "hkcr\desktopbackground\shell\5dns" /v "subcommands" /t reg_sz /d "" /f
reg add "hkcr\desktopbackground\shell\5dns\shell\01opendns" /v "icon" /t reg_sz /d "shell32.dll,135" /f
reg add "hkcr\desktopbackground\shell\5dns\shell\01opendns" /v "muiverb" /t reg_sz /d "open dns - 208.67.222.220" /f
reg add "hkcr\desktopbackground\shell\5dns\shell\01opendns\command" /ve /t reg_sz /d "wmic nicconfig where ipenabled=true call setdnsserversearchorder ("208.67.222.220","208.67.222.222") /f
reg add "hkcr\desktopbackground\shell\5dns\shell\02cloudflare" /v "icon" /t reg_sz /d "shell32.dll,135" /f
reg add "hkcr\desktopbackground\shell\5dns\shell\02cloudflare" /v "muiverb" /t reg_sz /d "cloudflare - 1.1.1.1" /f
reg add "hkcr\desktopbackground\shell\5dns\shell\02cloudflare\command" /ve /t reg_sz /d "wmic nicconfig where ipenabled=true call setdnsserversearchorder ("1.1.1.1","1.0.0.1") /f
reg add "hkcr\desktopbackground\shell\5dns\shell\03ultradns" /v "icon" /t reg_sz /d "shell32.dll,135" /f
reg add "hkcr\desktopbackground\shell\5dns\shell\03ultradns" /v "muiverb" /t reg_sz /d "ultra dns - 156.154.71.1" /f
reg add "hkcr\desktopbackground\shell\5dns\shell\03ultradns\command" /ve /t reg_sz /d "wmic nicconfig where ipenabled=true call setdnsserversearchorder ("156.154.71.1","156.154.71.22") /f
reg add "hkcr\desktopbackground\shell\5dns\shell\04google" /v "icon" /t reg_sz /d "shell32.dll,135" /f
reg add "hkcr\desktopbackground\shell\5dns\shell\04google" /v "muiverb" /t reg_sz /d "google - 8.8.8.8" /f
reg add "hkcr\desktopbackground\shell\5dns\shell\04google\command" /ve /t reg_sz /d "wmic nicconfig where ipenabled=true call setdnsserversearchorder ("8.8.8.8","8.8.4.4") /f
reg add "hkcr\desktopbackground\shell\6powerplanconfig" /v "icon" /t reg_sz /d "powercpl.dll" /f
reg add "hkcr\desktopbackground\shell\6powerplanconfig" /v "muiverb" /t reg_sz /d "Power Plans" /f
reg add "hkcr\desktopbackground\shell\6powerplanconfig" /v "position" /t reg_sz /d "top" /f
reg add "hkcr\desktopbackground\shell\6powerplanconfig" /v "subcommands" /t reg_sz /d "" /f
reg add "hkcr\desktopbackground\shell\6powerplanconfig\shell\01highperformance" /v "icon" /t reg_sz /d "powercpl.dll" /f
reg add "hkcr\desktopbackground\shell\6powerplanconfig\shell\01highperformance" /v "muiverb" /t reg_sz /d "Idle Disabled (performance)" /f
reg add "hkcr\desktopbackground\shell\6powerplanconfig\shell\01highperformance\command" /ve /t reg_sz /d "powercfg.exe /setactive 66666666-6666-6666-6666-666666666666" /f
reg add "hkcr\desktopbackground\shell\6powerplanconfig\shell\02balanced" /v "icon" /t reg_sz /d "powercpl.dll" /f
reg add "hkcr\desktopbackground\shell\6powerplanconfig\shell\02balanced" /v "muiverb" /t reg_sz /d "Idle Enabled (power saving)" /f
reg add "hkcr\desktopbackground\shell\6powerplanconfig\shell\02balanced\command" /ve /t reg_sz /d "powercfg.exe /setactive 77777777-7777-7777-7777-777777777777" /f
reg add "hkcr\desktopbackground\shell\6powerplanconfig\shell\03openpoweroptions" /v "icon" /t reg_sz /d "powercpl.dll" /f
reg add "hkcr\desktopbackground\shell\6powerplanconfig\shell\03openpoweroptions" /v "muiverb" /t reg_sz /d "Power Options" /f
reg add "hkcr\desktopbackground\shell\6powerplanconfig\shell\03openpoweroptions\command" /ve /t reg_sz /d "control.exe powercfg.cpl" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio" /v "commandflags" /t reg_sz /d "32" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio" /v "icon" /t reg_sz /d "imageres.dll,102" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio" /v "muiverb" /t reg_sz /d "Win32PrioritySeparation" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio" /v "position" /t reg_sz /d "top" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio" /v "subcommands" /t reg_sz /d "" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\01w32p" /v "icon" /t reg_sz /d "main.cpl" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\01w32p" /ve /t reg_sz /d "  42 dec / 2a hex = short, fixed, 3:1 boost" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\01w32p\command" /ve /t reg_sz /d "reg add "hklm\system\currentcontrolset\control\prioritycontrol" /v win32priorityseparation /t reg_dword /d 00000042 /f" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\02w32p" /v "icon" /t reg_sz /d "main.cpl" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\02w32p" /ve /t reg_sz /d "  40 dec / 28 hex = short, fixed, 1:1 boost" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\02w32p\command" /ve /t reg_sz /d "reg add "hklm\system\currentcontrolset\control\prioritycontrol" /v win32priorityseparation /t reg_dword /d 00000040 /f" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\03w32p" /v "icon" /t reg_sz /d "main.cpl" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\03w32p" /ve /t reg_sz /d "  26 dec / 1a hex = long, fixed, 3:1 boost" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\03w32p\command" /ve /t reg_sz /d "reg add "hklm\system\currentcontrolset\control\prioritycontrol" /v win32priorityseparation /t reg_dword /d 00000026 /f" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\04w32p" /v "icon" /t reg_sz /d "main.cpl" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\04w32p" /ve /t reg_sz /d "  38 dec / 26 hex = short, variable, 3:1 boost" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\04w32p\command" /ve /t reg_sz /d "reg add "hklm\system\currentcontrolset\control\prioritycontrol" /v win32priorityseparation /t reg_dword /d 00000038 /f" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\05w32p" /v "icon" /t reg_sz /d "main.cpl" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\05w32p" /ve /t reg_sz /d "  37 dec / 25 hex = short, variable, 2:1 boost" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\05w32p\command" /ve /t reg_sz /d "reg add "hklm\system\currentcontrolset\control\prioritycontrol" /v win32priorityseparation /t reg_dword /d 00000037 /f" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\06w32p" /v "icon" /t reg_sz /d "main.cpl" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\06w32p" /ve /t reg_sz /d "  36 dec / 24 hex = short, variable, 1:1 boost" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\06w32p\command" /ve /t reg_sz /d "reg add "hklm\system\currentcontrolset\control\prioritycontrol" /v win32priorityseparation /t reg_dword /d 00000036 /f" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\07w32p" /v "icon" /t reg_sz /d "main.cpl" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\07w32p" /ve /t reg_sz /d "  22 dec / 16 hex = long, variable, 3:1 boost" /f
reg add "hkcr\desktopbackground\shell\7changewin32prio\shell\07w32p\command" /ve /t reg_sz /d "reg add "hklm\system\currentcontrolset\control\prioritycontrol" /v win32priorityseparation /t reg_dword /d 00000022 /f" /f
reg add "hkcr\desktopbackground\shell\9gameboost" /v "icon" /t reg_sz /d "joy.cpl" /f
reg add "hkcr\desktopbackground\shell\9gameboost" /v "muiverb" /t reg_sz /d "Game Boost" /f
reg add "hkcr\desktopbackground\shell\9gameboost" /v "position" /t reg_sz /d "top" /f
reg add "hkcr\desktopbackground\shell\9gameboost" /v "subcommands" /t reg_sz /d "" /f
reg add "hkcr\desktopbackground\shell\9gameboost\shell\01boost" /v "icon" /t reg_sz /d "cmmon32.exe" /f
reg add "hkcr\desktopbackground\shell\9gameboost\shell\01boost" /ve /t reg_sz /d "  on" /f
reg add "hkcr\desktopbackground\shell\9gameboost\shell\01boost\command" /ve /t reg_sz /d "powerrun boost.bat" /f
reg add "hkcr\desktopbackground\shell\9gameboost\shell\02unboost" /v "icon" /t reg_sz /d "cmstp.exe" /f
reg add "hkcr\desktopbackground\shell\9gameboost\shell\02unboost" /ve /t reg_sz /d "  off" /f
reg add "hkcr\desktopbackground\shell\9gameboost\shell\02unboost\command" /ve /t reg_sz /d "powerrun unboost.bat" /f