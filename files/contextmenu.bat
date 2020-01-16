reg delete "hkcr\desktopbackground\shell" /f 
reg add "hkcr\desktopbackground\shell\01powerplans" /v "icon" /t reg_sz /d "powercpl.dll" /f
reg add "hkcr\desktopbackground\shell\01powerplans" /v "muiverb" /t reg_sz /d "Power Plans" /f
reg add "hkcr\desktopbackground\shell\01powerplans" /v "position" /t reg_sz /d "top" /f
reg add "hkcr\desktopbackground\shell\01powerplans" /v "subcommands" /t reg_sz /d "" /f
reg add "hkcr\desktopbackground\shell\01powerplans\shell\01highperformance" /v "icon" /t reg_sz /d "powercpl.dll" /f
reg add "hkcr\desktopbackground\shell\01powerplans\shell\01highperformance" /v "muiverb" /t reg_sz /d "Performance Plan (Idle Disabled)" /f
reg add "hkcr\desktopbackground\shell\01powerplans\shell\01highperformance\command" /ve /t reg_sz /d "powercfg.exe /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" /f
reg add "hkcr\desktopbackground\shell\01powerplans\shell\02balanced" /v "icon" /t reg_sz /d "powercpl.dll" /f
reg add "hkcr\desktopbackground\shell\01powerplans\shell\02balanced" /v "muiverb" /t reg_sz /d "Balanced Plan (Idle Enabled)" /f
reg add "hkcr\desktopbackground\shell\01powerplans\shell\02balanced\command" /ve /t reg_sz /d "powercfg.exe /setactive 381b4222-f694-41f0-9685-ff5bb260df2e" /f
reg add "hkcr\desktopbackground\shell\01powerplans\shell\03openpoweroptions" /v "icon" /t reg_sz /d "powercpl.dll" /f
reg add "hkcr\desktopbackground\shell\01powerplans\shell\03openpoweroptions" /v "muiverb" /t reg_sz /d "Power Options" /f
reg add "hkcr\desktopbackground\shell\01powerplans\shell\03openpoweroptions\command" /ve /t reg_sz /d "control.exe powercfg.cpl" /f
reg add "hkcr\desktopbackground\shell\02gameboost" /v "icon" /t reg_sz /d "joy.cpl" /f
reg add "hkcr\desktopbackground\shell\02gameboost" /v "muiverb" /t reg_sz /d "Game Boost" /f
reg add "hkcr\desktopbackground\shell\02gameboost" /v "position" /t reg_sz /d "top" /f
reg add "hkcr\desktopbackground\shell\02gameboost" /v "subcommands" /t reg_sz /d "" /f
reg add "hkcr\desktopbackground\shell\02gameboost\shell\01boost" /v "icon" /t reg_sz /d "resmon.exe" /f
reg add "hkcr\desktopbackground\shell\02gameboost\shell\01boost" /ve /t reg_sz /d "  on" /f
reg add "hkcr\desktopbackground\shell\02gameboost\shell\01boost\command" /ve /t reg_sz /d "powerrun boost.bat" /f
reg add "hkcr\desktopbackground\shell\02gameboost\shell\02unboost" /v "icon" /t reg_sz /d "sethc.exe" /f
reg add "hkcr\desktopbackground\shell\02gameboost\shell\02unboost" /ve /t reg_sz /d "  off" /f
reg add "hkcr\desktopbackground\shell\02gameboost\shell\02unboost\command" /ve /t reg_sz /d "powerrun unboost.bat" /f
