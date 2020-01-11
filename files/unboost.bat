wmic process where name="steam.exe" call setpriority "normal"
wmic process where name="steamwebhelper.exe" call setpriority "normal"
wmic process where name="steamservice.exe" call setpriority "normal"
wmic process where name="gameoverlayui.exe" call setpriority "normal"
powercfg.exe /setactive 77777777-7777-7777-7777-777777777777
sc start NVDisplay.ContainerLocalSystem
sc start sppsvc
sc start nsi
sc start NlaSvc
sc start netprofm
sc start Netman
sc start AeLookupSvc
sc start seclogon
