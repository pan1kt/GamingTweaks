wmic process where name="steam.exe" call setpriority "normal"
wmic process where name="steamwebhelper.exe" call setpriority "normal"
wmic process where name="steamservice.exe" call setpriority "normal"
wmic process where name="gameoverlayui.exe" call setpriority "normal"
sc start NVDisplay.ContainerLocalSystem
sc start sppsvc
powercfg.exe /setactive 77777777-7777-7777-7777-777777777777