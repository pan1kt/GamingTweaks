@echo off

echo Disabling AllJoyn Router Service...
sc stop AJRouter
sc config AJRouter start= disabled

echo Disabling AppX Deployment Service (AppXSVC)...
sc stop AppXSvc
sc config AppXSvc start= disabled

echo Disabling Application Layer Gateway Service...
sc stop ALG
sc config ALG start= disabled

echo Disabling Application Management...
sc stop AppMgmt
sc config AppMgmt start= disabled

echo Disabling App Readiness...
sc stop AppReadiness
sc config AppReadiness start= disabled

echo Disabling Auto Time Zone Updater...
sc stop tzautoupdate
sc config tzautoupdate start= disabled

echo Disabling AssignedAccessManager Service...
sc stop AssignedAccessManagerSvc
sc config AssignedAccessManagerSvc start= disabled

echo Disabling Background Intelligent Transfer Service...
sc stop BITS
sc config BITS start= disabled

echo Disabling BitLocker Drive Encryption Service...
sc stop BDESVC
sc config BDESVC start= disabled

echo Disabling Block Level Backup Engine Service...
sc stop wbengine
sc config wbengine start= disabled

echo Disabling Bluetooth Audio Gateway Service...
sc stop BTAGService
sc config BTAGService start= disabled

echo Disabling Bluetooth Support Service...
sc stop bthserv
sc config bthserv start= disabled

echo Disabling Bluetooth Handsfree Service...
sc stop BthHFSrv
sc config BthHFSrv start= disabled

echo Disabling BranchCache...
sc stop PeerDistSvc
sc config PeerDistSvc start= disabled

echo Disabling CNG Key Isolation...
sc stop KeyIso
sc config KeyIso start= disabled

echo Disabling Certificate Propagation...
sc stop CertPropSvc
sc config CertPropSvc start= disabled

echo Disabling Client License Service (ClipSVC)...
sc stop ClipSVC
sc config ClipSVC start= disabled

echo Disabling Connected User Experiences and Telemetry...
sc stop DiagTrack
sc config DiagTrack start= disabled

echo Disabling Credential Manager...
sc stop VaultSvc
sc config VaultSvc start= disabled

echo Disabling Connected Devices Platform Service...
sc stop CDPSvc
sc config CDPSvc start= disabled

echo Disabling Data Usage...
sc stop DusmSvc
sc config DusmSvc start= disabled

echo Disabling Delivery Optimization...
sc stop DoSvc
sc config DoSvc start= disabled

echo Disabling Diagnostic Execution Service...
sc stop diagsvc
sc config diagsvc start= disabled

echo Disabling Diagnostic Policy Service...
sc stop DPS
sc config DPS start= disabled

echo Disabling Diagnostic Service Host...
sc stop WdiServiceHost
sc config WdiServiceHost start= disabled

echo Disabling Diagnostic System Host...
sc stop WdiSystemHost
sc config WdiSystemHost start= disabled

echo Disabling Distributed Link Tracking Client...
sc stop TrkWks
sc config TrkWks start= disabled

echo Disabling Distributed Transaction Coordinator...
sc stop MSDTC
sc config MSDTC start= disabled

echo Disabling dmwappushsvc...
sc stop dmwappushservice
sc config dmwappushservice start= disabled

echo Disabling Display Enhancement Service...
sc stop DisplayEnhancementService
sc config DisplayEnhancementService start= disabled

echo Disabling Downloaded Maps Manager...
sc stop MapsBroker
sc config MapsBroker start= disabled

echo Disabling Function Discovery Provider Host...
sc stop fdPHost
sc config fdPHost start= disabled

echo Disabling Function Discovery Resource Publication...
sc stop FDResPub
sc config FDResPub start= disabled

echo Disabling Encrypting File System (EFS)...
sc stop EFS
sc config EFS start= disabled

echo Disabling Enterprise App Management Service...
sc stop EntAppSvc
sc config EntAppSvc start= disabled

echo Disabling File History Service...
sc stop fhsvc
sc config fhsvc start= disabled

echo Disabling Geolocation Service...
sc stop lfsvc
sc config lfsvc start= disabled

echo Disabling GraphicsPerfSvc...
sc stop GraphicsPerfSvc
sc config GraphicsPerfSvc start= disabled

echo Disabling HomeGroup Listener...
sc stop HomeGroupListener
sc config HomeGroupListener start= disabled

echo Disabling HomeGroup Provider...
sc stop HomeGroupProvider
sc config HomeGroupProvider start= disabled

echo Disabling HV Host Service...
sc stop HvHost
sc config HvHost start= disabled

echo Disabling Host Network Service...
sc stop hns
sc config hns start= disabled

echo Disabling Hyper-V Data Exchange Service...
sc stop vmickvpexchange
sc config vmickvpexchange start= disabled

echo Disabling Hyper-V Guest Service Interface...
sc stop vmicguestinterface
sc config vmicguestinterface start= disabled

echo Disabling Hyper-V Guest Shutdown Service...
sc stop vmicshutdown
sc config vmicshutdown start= disabled

echo Disabling Hyper-V Heartbeat Service...
sc stop vmicheartbeat
sc config vmicheartbeat start= disabled

echo Disabling Hyper-V PowerShell Direct Service...
sc stop vmicvmsession
sc config vmicvmsession start= disabled

echo Disabling Hyper-V Remote Desktop Virtualization Service...
sc stop vmicrdv
sc config vmicrdv start= disabled

echo Disabling Hyper-V Time Synchronization Service...
sc stop vmictimesync
sc config vmictimesync start= disabled

echo Disabling Hyper-V Volume Shadow Copy Requestor...
sc stop vmicvss
sc config vmicvss start= disabled

echo Disabling Internet Explorer ETW Collector Service...
sc stop IEEtwCollectorService
sc config IEEtwCollectorService start= disabled

echo Disabling IP Helper...
sc stop iphlpsvc
sc config iphlpsvc start= disabled

echo Disabling IP Translation Configuration Service...
sc stop IpxlatCfgSvc
sc config IpxlatCfgSvc start= disabled

echo Disabling IPsec Policy Agent...
sc stop PolicyAgent
sc config PolicyAgent start= disabled

echo Disabling Infrared monitor service...
sc stop irmon
sc config irmon start= disabled

echo Disabling Internet Connection Sharing (ICS)...
sc stop SharedAccess
sc config SharedAccess start= disabled

echo Disabling Link-Layer Topology Discovery Mapper...
sc stop lltdsvc
sc config lltdsvc start= disabled

echo Disabling Microsoft (R) Diagnostics Hub Standard Collector Service...
sc stop diagnosticshub.standardcollector.service
sc config diagnosticshub.standardcollector.service start= disabled

echo Disabling Microsoft Account Sign-in Assistant...
sc stop wlidsvc
sc config wlidsvc start= disabled

echo Disabling Microsoft App-V Client...
sc stop AppVClient
sc config AppVClient start= disabled

echo Disabling Microsoft Passport...
sc stop NgcSvc
sc config NgcSvc start= disabled

echo Disabling Microsoft Passport Container...
sc stop NgcCtnrSvc
sc config NgcCtnrSvc start= disabled

echo Disabling Microsoft Software Shadow Copy Provider...
sc stop swprv
sc config swprv start= disabled

echo Disabling Microsoft Storage Spaces SMP...
sc stop smphost
sc config smphost start= disabled

echo Disabling Microsoft Store Install Service...
sc stop InstallService
sc config InstallService start= disabled

echo Disabling Microsoft Windows SMS Router Service...
sc stop SmsRouter
sc config SmsRouter start= disabled

echo Disabling Microsoft iSCSI Initiator Service...
sc stop MSiSCSI
sc config MSiSCSI start= disabled

echo Disabling Natural Authentication...
sc stop NaturalAuthentication
sc config NaturalAuthentication start= disabled

echo Disabling Net.Tcp Port Sharing Service ...
sc stop NetTcpPortSharing
sc config NetTcpPortSharing start= disabled

echo Disabling Netlogon...
sc stop Netlogon
sc config Netlogon start= disabled

echo Disabling Network Connected Devices Auto-Setup...
sc stop NcdAutoSetup
sc config NcdAutoSetup start= disabled

echo Disabling Network Connection Broker...
sc stop NcbService
sc config NcbService start= disabled

echo Disabling Network Connectivity Assistant...
sc stop NcaSvc
sc config NcaSvc start= disabled

echo Disabling Offline Files...
sc stop CscService
sc config CscService start= disabled

echo Disabling Optimize drives...
sc stop defragsvc
sc config defragsvc start= disabled

echo Disabling Payments and NFC/SE Manager...
sc stop SEMgrSvc
sc config SEMgrSvc start= disabled

echo Disabling Peer Name Resolution Protocol...
sc stop PNRPsvc
sc config PNRPsvc start= disabled

echo Disabling Peer Networking Grouping...
sc stop p2psvc
sc config p2psvc start= disabled

echo Disabling Peer Networking Identity Manager...
sc stop p2pimsvc
sc config p2pimsvc start= disabled

echo Disabling Performance Logs & Alerts...
sc stop pla
sc config pla start= disabled

echo Disabling Phone Service...
sc stop PhoneSvc
sc config PhoneSvc start= disabled

echo Disabling Portable Device Enumerator Service...
sc stop WPDBusEnum
sc config WPDBusEnum start= disabled

echo Disabling Print Spooler...
sc stop Spooler
sc config Spooler start= disabled

echo Disabling Printer Extensions and Notifications...
sc stop PrintNotify
sc config PrintNotify start= disabled

echo Disabling Program Compatibility Assistant Service...
sc stop PcaSvc
sc config PcaSvc start= disabled

echo Disabling Parental Controls...
sc stop WpcMonSvc
sc config WpcMonSvc start= disabled

echo Disabling Quality Windows Audio Video Experience...
sc stop QWAVE
sc config QWAVE start= disabled

echo Disabling Remote Access Auto Connection Manager...
sc stop RasAuto
sc config RasAuto start= disabled

echo Disabling Remote Access Connection Manager...
sc stop RasMan
sc config RasMan start= disabled

echo Disabling Remote Desktop Configuration...
sc stop SessionEnv
sc config SessionEnv start= disabled

echo Disabling Remote Desktop Services...
sc stop TermService
sc config TermService start= disabled

echo Disabling Remote Desktop Services UserMode Port Redirector...
sc stop UmRdpService
sc config UmRdpService start= disabled

echo Disabling Remote Procedure Call (RPC) Locator...
sc stop RpcLocator
sc config RpcLocator start= disabled

echo Disabling Remote Registry...
sc stop RemoteRegistry
sc config RemoteRegistry start= disabled

echo Disabling Retail Demo Service...
sc stop RetailDemo
sc config RetailDemo start= disabled

echo Disabling Routing and Remote Access...
sc stop RemoteAccess
sc config RemoteAccess start= disabled

echo Disabling Radio Management Service...
sc stop RmSvc
sc config RmSvc start= disabled

echo Disabling SNMP Trap...
sc stop SNMPTRAP
sc config SNMPTRAP start= disabled

echo Disabling Secondary Logon...
sc stop seclogon
sc config seclogon start= disabled

echo Disabling Security Center...
sc stop wscsvc
sc config wscsvc start= disabled

echo Disabling Security Accounts Manager...
sc stop SamSs
sc config SamSs start= disabled

echo Disabling Sensor Data Service...
sc stop SensorDataService
sc config SensorDataService start= disabled

echo Disabling Sensor Monitoring Service...
sc stop SensrSvc
sc config SensrSvc start= disabled

echo Disabling Sensor Service...
sc stop SensorService
sc config SensorService start= disabled

echo Disabling Server...
sc stop LanmanServer
sc config LanmanServer start= disabled

echo Disabling Shared PC Account Manager...
sc stop shpamsvc
sc config shpamsvc start= disabled

echo Disabling Shell Hardware Detection...
sc stop ShellHWDetection
sc config ShellHWDetection start= disabled

echo Disabling Smart Card...
sc stop SCardSvr
sc config SCardSvr start= disabled

echo Disabling Smart Card Device Enumeration Service...
sc stop ScDeviceEnum
sc config ScDeviceEnum start= disabled

echo Disabling Smart Card Removal Policy...
sc stop SCPolicySvc
sc config SCPolicySvc start= disabled

echo Disabling Spatial Data Service...
sc stop SharedRealitySvc
sc config SharedRealitySvc start= disabled

echo Disabling Storage Service...
sc stop StorSvc
sc config StorSvc start= disabled

echo Disabling Storage Tiers Management...
sc stop TieringEngineService
sc config TieringEngineService start= disabled

echo Disabling Superfetch (SysMain)...
sc stop SysMain
sc config SysMain start= disabled

echo Disabling System Guard Runtime Monitor Broker...
sc stop SgrmBroker
sc config SgrmBroker start= disabled

echo Disabling TCP/IP NetBIOS Helper...
sc stop lmhosts
sc config lmhosts start= disabled

echo Disabling Telephony...
sc stop TapiSrv
sc config TapiSrv start= disabled

echo Disabling Themes...
sc stop Themes
sc config Themes start= disabled

echo Disabling Tile Data model server...
sc stop tiledatamodelsvc
sc config tiledatamodelsvc start= disabled

echo Disabling Touch Keyboard and Handwriting Panel Service...
sc stop TabletInputService
sc config TabletInputService start= disabled

echo Disabling Update Orchestrator Service...
sc stop UsoSvc
sc config UsoSvc start= disabled

echo Disabling User Experience Virtualization Service...
sc stop UevAgentService
sc config UevAgentService start= disabled

echo Disabling Volume Shadow Copy...
sc stop VSS
sc config VSS start= disabled

echo Disabling WalletService...
sc stop WalletService
sc config WalletService start= disabled

echo Disabling WMI Performance Adapter...
sc stop wmiApSrv
sc config wmiApSrv start= disabled

echo Disabling WWAN AutoConfig...
sc stop WwanSvc
sc config WwanSvc start= disabled

echo Disabling Web Account Manager...
sc stop TokenBroker
sc config TokenBroker start= disabled

echo Disabling WebClient...
sc stop WebClient
sc config WebClient start= disabled

echo Disabling Wi-Fi Direct Services Connection Manager Service...
sc stop WFDSConMgrSvc
sc config WFDSConMgrSvc start= disabled

echo Disabling Windows Backup...
sc stop SDRSVC
sc config SDRSVC start= disabled

echo Disabling Windows Biometric Service...
sc stop WbioSrvc
sc config WbioSrvc start= disabled

echo Disabling Windows Camera Frame Server...
sc stop FrameServer
sc config FrameServer start= disabled

echo Disabling Windows Connect Now - Config Registrar...
sc stop wcncsvc
sc config wcncsvc start= disabled

echo Disabling Windows Defender Advanced Threat Protection Service...
sc stop Sense
sc config Sense start= disabled

echo Disabling Windows Defender Antivirus Network Inspection Service...
sc stop WdNisSvc
sc config WdNisSvc start= disabled

echo Disabling Windows Defender Antivirus Service...
sc stop WinDefend
sc config WinDefend start= disabled

echo Disabling Windows Defender Security Center Service...
sc stop SecurityHealthService
sc config SecurityHealthService start= disabled

echo Disabling Windows Encryption Provider Host Service...
sc stop WEPHOSTSVC
sc config WEPHOSTSVC start= disabled

echo Disabling Windows Error Reporting Service...
sc stop WerSvc
sc config WerSvc start= disabled

echo Disabling Windows Event Collector...
sc stop Wecsvc
sc config Wecsvc start= disabled

echo Disabling Windows Font Cache Service...
sc stop FontCache
sc config FontCache start= disabled

echo Disabling Windows Image Acquisition (WIA)...
sc stop StiSvc
sc config StiSvc start= disabled

echo Disabling Windows Insider Service...
sc stop wisvc
sc config wisvc start= disabled

echo Disabling Windows License Manager Service...
sc stop LicenseManager
sc config LicenseManager start= disabled

echo Disabling Windows Mobile Hotspot Service...
sc stop icssvc
sc config icssvc start= disabled

echo Disabling Windows Media Player Network Sharing Service...
sc stop WMPNetworkSvc
sc config WMPNetworkSvc start= disabled

echo Disabling Windows Presentation Foundation Font Cache 3.0.0.0...
sc stop FontCache3.0.0.0
sc config FontCache3.0.0.0 start= disabled

echo Disabling Windows Push Notifications System Service...
sc stop WpnService
sc config WpnService start= disabled

echo Disabling Windows Perception Simulation Service...
sc stop perceptionsimulation
sc config perceptionsimulation start= disabled

echo Disabling Windows Perception Service...
sc stop spectrum
sc config spectrum start= disabled

echo Disabling Windows Remote Management (WS-Management)...
sc stop WinRM
sc config WinRM start= disabled

echo Disabling Windows Search...
sc stop WSearch
sc config WSearch start= disabled

echo Disabling Windows Security Service...
sc stop SecurityHealthService
sc config SecurityHealthService start= disabled

echo Disabling Windows Time...
sc stop W32Time
sc config W32Time start= disabled

echo Disabling Windows Update...
sc stop wuauserv
sc config wuauserv start= disabled

echo Disabling Windows Update Medic Service...
sc stop WaaSMedicSvc
sc config WaaSMedicSvc start= disabled

echo Disabling Workstation...
sc stop LanmanWorkstation
sc config LanmanWorkstation start= disabled

echo Disabling Xbox Accessory Management Service...
sc stop XboxGipSvc
sc config XboxGipSvc start= disabled

echo Disabling Xbox Game Monitoring...
sc stop xbgm
sc config xbgm start= disabled

echo Disabling Xbox Live Auth Manager...
sc stop XblAuthManager
sc config XblAuthManager start= disabled

echo Disabling Xbox Live Game Save...
sc stop XblGameSave
sc config XblGameSave start= disabled

echo Disabling Xbox Live Networking Service...
sc stop XboxNetApiSvc
sc config XboxNetApiSvc start= disabled

echo #Disable - Bluetooth User Support Service_XXXXX
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BluetoothUserService" /v Start /t REG_DWORD /d 00000004 /f

echo #Disable - Connected Devices Platform User Service_XXXXX
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CDPUserSvc" /v Start /t REG_DWORD /d 00000004 /f

echo #Disable - CaptureService_XXXXX
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CaptureService" /v Start /t REG_DWORD /d 00000004 /f

echo #Disable - ConsentUX_XXXXX
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ConsentUxUserSvc" /v Start /t REG_DWORD /d 00000004 /f

echo #Disable - Contact Data_XXXXX
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v Start /t REG_DWORD /d 00000004 /f

echo #Disable - DevicePicker_XXXXX
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicePickerUserSvc" /v Start /t REG_DWORD /d 00000004 /f

echo #Disable - DevicesFlow_XXXXX
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicesFlowUserSvc" /v Start /t REG_DWORD /d 00000004 /f

echo #Disable - GameDVR and Broadcast User Service_XXXXX
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v Start /t REG_DWORD /d 00000004 /f

echo #Disable - MessagingService_XXXXX
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MessagingService" /v Start /t REG_DWORD /d 00000004 /f

echo #Disable - PrintWorkflow_XXXXX
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PrintWorkflowUserSvc" /v Start /t REG_DWORD /d 00000004 /f

echo #Disable - Sync Host_XXXXX
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\OneSyncSvc" /v Start /t REG_DWORD /d 00000004 /f

echo #Disable - User Data Access_XXXXX
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UserDataSvc" /v Start /t REG_DWORD /d 00000004 /f

echo #Disable - User Data Storage_XXXXX
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UnistoreSvc" /v Start /t REG_DWORD /d 00000004 /f

echo #Disable - Windows Push Notifications User Service_XXXXX
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WpnUserService" /v Start /t REG_DWORD /d 00000004 /f