@Echo Off
Title Collection of LessImportantTweaks & Color 1A
cd %systemroot%\system32
call :IsAdmin

goto start
:start
reg add "hklm\system\controlset001\control\prioritycontrol" /v win32priorityseparation /t reg_dword /d 00000022 /f
reg add "hklm\system\currentcontrolset\control\prioritycontrol" /v win32priorityseparation /t reg_dword /d 00000022 /f
takeown /f "c:\windows\system32\mcupdate_genuineintel.dll" /r /d y
takeown /f "c:\windows\system32\mcupdate_authenticamd.dll" /r /d y
del "c:\windows\system32\mcupdate_genuineintel.dll" /s /f /q
del "c:\windows\system32\mcupdate_authenticamd.dll" /s /f /q
diskperf -N
setx devmgr_show_nonpresent_devices 1
reg add "hkey_local_machine\system\currentcontrolset\control\session manager\kernel" /v disabletsx /t reg_dword /d 1 /f
reg add "hklm\system\currentcontrolset\services\audiosrv" /v dependonservice /t reg_multi_sz /d audioendpointbuilder\0rpcss /f
reg add "hklm\system\currentcontrolset\services\dhcp" /v dependonservice /t reg_multi_sz /d nsi\0afd /f
reg add "hklm\software\microsoft\windows nt\currentversion\multimedia\systemprofile\tasks\games" /v "affinity" /t reg_dword /d "0" /f
reg add "hklm\software\microsoft\windows nt\currentversion\multimedia\systemprofile\tasks\games" /v "background only" /t reg_sz /d "false" /f
reg add "hklm\software\microsoft\windows nt\currentversion\multimedia\systemprofile\tasks\games" /v "clock rate" /t reg_dword /d "10000" /f
reg add "hklm\software\microsoft\windows nt\currentversion\multimedia\systemprofile\tasks\games" /v "gpu priority" /t reg_dword /d "8" /f
reg add "hklm\software\microsoft\windows nt\currentversion\multimedia\systemprofile\tasks\games" /v "priority" /t reg_dword /d "6" /f
reg add "hklm\software\microsoft\windows nt\currentversion\multimedia\systemprofile\tasks\games" /v "scheduling category" /t reg_sz /d "high" /f
reg add "hklm\software\microsoft\windows nt\currentversion\multimedia\systemprofile\tasks\games" /v "sfio priority" /t reg_sz /d "high" /f
reg add "hkcu\control panel\keyboard" /v "keyboardspeed" /t reg_sz /d "100" /f
reg add "hkcu\control panel\keyboard" /v "initialkeyboardindicators" /t reg_sz /d "0" /f
reg add "hkcu\control panel\keyboard" /v "keyboarddelay" /t reg_sz /d "0" /f
reg add "hkcu\control panel\accessibility\keyboard response" /v "autorepeatdelay" /t reg_sz /d "100" /f
reg add "hkcu\control panel\accessibility\keyboard response" /v "autorepeatrate" /t reg_sz /d "2" /f
reg add "hkcu\control panel\accessibility\keyboard response" /v "bouncetime" /t reg_sz /d "0" /f
reg add "hkcu\control panel\accessibility\keyboard response" /v "delaybeforeacceptance" /t reg_sz /d "0" /f
reg add "hkcu\control panel\accessibility\keyboard response" /v "flags" /t reg_sz /d "126" /f
reg add "hkcu\control panel\accessibility\keyboard response" /v "last bouncekey setting" /t reg_dword /d "0" /f
reg add "hkcu\control panel\accessibility\keyboard response" /v "last valid delay" /t reg_dword /d "0" /f
reg add "hkcu\control panel\accessibility\keyboard response" /v "last valid repeat" /t reg_dword /d "0" /f
reg add "hkcu\control panel\accessibility\keyboard response" /v "last valid wait" /t reg_dword /d "0" /f
reg add "hkcu\control panel\mouse" /v "mousesensitivity" /t reg_sz /d "10" /f
reg add "hku\.default\control panel\mouse" /v "mousespeed" /t reg_sz /d "0" /f
reg add "hku\.default\control panel\mouse" /v "mousethreshold1" /t reg_sz /d "0" /f
reg add "hku\.default\control panel\mouse" /v "mousethreshold2" /t reg_sz /d "0" /f
goto internet
:internet
ipconfig /release 
ipconfig /renew 
ipconfig /flushdns 
netsh winsock reset catalog 
netsh winsock reset 
netsh winsock set autotuning off 
netsh int ip reset 
netsh int tcp reset 
netsh int ip delete arpcache 
netsh int ipv4 reset reset.log 
netsh int ipv6 reset reset.log 
netsh branchcache reset 
netsh branchcache flush 
ipconfig /flushdns 
regsvr32 /s actxprxy.dll 
netsh int teredo set state disabled 
netsh int 6to4 set state disabled 
netsh int isatap set state disable 
netsh int ip set global taskoffload=disabled 
netsh int ip set global neighborcachelimit=4096 
netsh int tcp set heuristics disabled 
netsh int tcp set global congestionprovider=ctcp 
netsh int tcp set supplemental Internet congestionprovider=CTCP 
netsh int tcp set supplemental custom congestionprovider=CTCP 
netsh int tcp set supplemental InternetCustom congestionprovider=CTCP 
netsh int tcp set global rss=enabled 
netsh int tcp set global rsc=disabled 
netsh int tcp set global chimney=disabled 
netsh int tcp set global timestamps=disabled 
netsh int tcp set global nonsackrttresiliency=disabled 
netsh int tcp set global maxsynretransmissions=2 
netsh int tcp set global autotuninglevel=disabled 
netsh int tcp set global ecncapability=enabled
netsh int tcp set global fastopen=enabled 
netsh int ipv4 set interface "Ethernet" mtu=1492 
netsh int ipv4 set interface "Wi-Fi" mtu=1492 
netsh int ipv4 set interface "Ethernet" mtu=1492 store=persistent 
netsh int ipv4 set interface "Wi-Fi" mtu=1492 store=persistent 
netsh int ipv4 set interface "Local Area Connection" mtu=1492 
netsh int ipv4 set interface "Local Area Connection" mtu=1492 store=persistent 
netsh int ipv6 set interface "Ethernet" mtu=1492 store=persistent 
netsh int ipv6 set interface "Wi-Fi" mtu=1492 store=persistent 
netsh int ipv6 set interface "Local Area Connection" mtu=1492 store=persistent
for /F %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do set guid1=%%i
reg add "hkey_local_machine\system\currentcontrolset\services\lanmanworkstation\parameters" /v "disablebandwidththrottling" /t reg_dword /d "00000001" /f
reg add "hkey_local_machine\system\currentcontrolset\services\lanmanworkstation\parameters" /v "disablelargemtu" /t reg_dword /d "00000000" /f
reg add "hkey_local_machine\system\currentcontrolset\services\lanmanworkstation\parameters" /v "keepconn" /t reg_dword /d "00015180" /f
reg add "hkey_local_machine\system\currentcontrolset\services\lanmanworkstation\parameters" /v "maxcmds" /t reg_dword /d "00000001" /f
reg add "hkey_local_machine\system\currentcontrolset\services\lanmanworkstation\parameters" /v "maxcollectioncount" /t reg_dword /d "00000020" /f
reg add "hkey_local_machine\system\currentcontrolset\services\lanmanworkstation\parameters" /v "maxthreads" /t reg_dword /d "00000064" /f
reg add "hklm\software\microsoft\msmq\parameters" /v "tcpnodelay" /t reg_dword /d "1" /f
reg add "hklm\software\microsoft\windows nt\currentversion\multimedia\systemprofile" /v "alwayson" reg_dword /d "00000001" /f
reg add "hklm\software\microsoft\windows nt\currentversion\multimedia\systemprofile" /v "networkthrottlingindex" /t reg_dword /d "4294967295" /f
reg add "hklm\software\microsoft\windows nt\currentversion\multimedia\systemprofile" /v "nolazymode" reg_dword /d "00000001" /f
reg add "hklm\software\microsoft\windows nt\currentversion\multimedia\systemprofile" /v "systemresponsiveness" reg_dword /d "00000000" /f
reg add "hklm\software\policies\microsoft\windows nt\dnsclient" /v "enablemulticast" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\services\netbt\parameters" /v "namesrvquery" /t reg_dword /d "3000" /f
reg add "hklm\system\currentcontrolset\services\dns\parameters" /v "maximumudppacketsize" /t reg_dword /d "512" /f
reg add "hklm\system\currentcontrolset\services\dnscache\parameters" /v "cachehashtablebucketsize" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\services\dnscache\parameters" /v "cachehashtablesize" /t reg_dword /d "384" /f
reg add "hklm\system\currentcontrolset\services\dnscache\parameters" /v "cachehashtablesize" /t reg_dword /d "384" /f
reg add "hklm\system\currentcontrolset\services\dnscache\parameters" /v "maxcacheentryttllimit" /t reg_dword /d "86400" /f
reg add "hklm\system\currentcontrolset\services\dnscache\parameters" /v "maxnegativecachettl" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\dnscache\parameters" /v "maxsoacacheentryttllimit" /t reg_dword /d "300" /f
reg add "hklm\system\currentcontrolset\services\dnscache\parameters" /v "negativecachetime" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\dnscache\parameters" /v "negativesoacachetime" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\dnscache\parameters" /v "netfailurecachetime" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\dnscache\parameters" /v "servicedllunloadonstop" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\services\dnscache\parameters" /v "maxcachettl" /t reg_dword /d "13824" /f
reg add "hklm\system\currentcontrolset\services\dnscache\parameters" /v "maxnegativecachettl" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\lanmanserver\parameters" /v disablebandwidththrottling /t reg_dword /d 00000001 /f
reg add "hklm\system\currentcontrolset\services\lanmanserver\parameters" /v keepalivetime /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\lanmanserver\parameters" /v maxmpxct /t reg_dword /d "2048" /f
reg add "hklm\system\currentcontrolset\services\lanmanserver\parameters" /v maxworkitems /t reg_dword /d "8192" /f
reg add "hklm\system\currentcontrolset\services\lanmanserver\parameters" /v sizreqbuf /t reg_dword /d 00006300 /f
reg add "hklm\system\currentcontrolset\services\lanmanserver\parameters" /v size /t reg_dword /d "3" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "defaultttl" /t reg_dword /d "64" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "disabletaskoffload" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "enabledeadgwdetect" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "enableicmpredirect" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "enablepmtubhdetect" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "enablepmtudiscovery" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "enablepmtudiscovery" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "enabletcpa" /t reg_dword /d 00000001 /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "enablewsd" /t reg_dword /d 00000000 /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "forwardbroadcasts" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "globalmaxtcpwindowsize" /t reg_dword /d "65340" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "igmplevel" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "ipenablerouter" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "keepaliveinterval" /t reg_dword /d "100" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "keepalivetime" /t reg_dword /d "500000" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "maxconnectionsperserver" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "maxfreetcbs" /t reg_dword /d "65536" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "maxhashtablesize" /t reg_dword /d "65535" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "maxuserport" /t reg_dword /d "65534" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "maxuserport" /t reg_dword /d "65534" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "numtcbtablepartitions" /t reg_dword /d "4" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "sackopts" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "synattackprotect" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "tcp1323opts" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "tcpmaxdupacks" /t reg_dword /d "2" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v "tcptimedwaitdelay" /t reg_dword /d "30" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v disablelargemtu /t reg_dword /d "00000000" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v enableconnectionratelimiting /t reg_dword /d "00000000" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v enabledca /t reg_dword /d "00000001" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v qualifyingdestinationthreshold /t reg_dword /d "00000003" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v tcpmaxdataretransmissions /t reg_dword /d "00000005" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v tcpcreateandconnecttcbratelimitdepth /t reg_dword /d "00000000" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters" /v tcpnumconnections /t reg_dword /d "00000500" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\%guid1%" /v "ipautoconfigurationenabled" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\%guid1%" /v "mtu" /t reg_dword /d "1492" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\%guid1%" /v "performrouterdiscovery" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\%guid1%" /v "tcpnodelay" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\%guid1%" /v "tcpackfrequency" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\%guid1%" /v "tcpdelackticks" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\%guid1%" /v "tcpwindowsize" /t reg_dword /d "65340" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\winsock" /v "maxsockaddrlength" /t reg_dword /d "16" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\winsock" /v "minsockaddrlength" /t reg_dword /d "16" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\winsock" /v "usedelayedacceptance" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\serviceprovider" /v "class" /t reg_dword /d "8" /f
reg add "hklm\system\currentcontrolset\services\tcpip\serviceprovider" /v "dnspriority" /t reg_dword /d "6" /f
reg add "hklm\system\currentcontrolset\services\tcpip\serviceprovider" /v "hostspriority" /t reg_dword /d "5" /f
reg add "hklm\system\currentcontrolset\services\tcpip\serviceprovider" /v "localpriority" /t reg_dword /d "4" /f
reg add "hklm\system\currentcontrolset\services\tcpip\serviceprovider" /v "netbtpriority" /t reg_dword /d "7" /f
reg add "hkcu\software\microsoft\windows\currentversion\internet settings" /v "dnscachetimeout" /t reg_dword /d "7200" /f
reg add "hkcu\software\microsoft\windows\currentversion\internet settings" /v "keepalivetimeout" /t reg_dword /d "300000" /f
reg add "hkcu\software\microsoft\windows\currentversion\internet settings" /v "maxconnectionsper1_0server" /t reg_dword /d "10" /f
reg add "hkcu\software\microsoft\windows\currentversion\internet settings" /v "maxconnectionsperserver" /t reg_dword /d "10" /f
reg add "hkcu\software\microsoft\windows\currentversion\internet settings" /v "receivetimeout" /t reg_dword /d "60000" /f
reg add "hkcu\software\microsoft\windows\currentversion\internet settings" /v "serverinfotimeout" /t reg_dword /d "300000" /f
reg add "hkcu\software\microsoft\windows\currentversion\internet settings" /v "socketreceivebufferlength" /t reg_dword /d "65536" /f
reg add "hkcu\software\microsoft\windows\currentversion\internet settings" /v "socketsendbufferlength" /t reg_dword /d "65536" /f
reg add "hkcu\software\microsoft\windows\currentversion\internet settings" /v "tcpautotuning" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "defaultreceivewindow" /t reg_dword /d "66550" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "defaultsendwindow" /t reg_dword /d "66550" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "dynamicbackloggrowthdelta" /t reg_dword /d "10" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "enabledynamicbacklog" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "fastcopyreceivethreshold" /t reg_dword /d "000005dc" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "fastcopyreceivethreshold" /t reg_dword /d "1500" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "fastsenddatagramthreshold" /t reg_dword /d "000005dc" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "fastsenddatagramthreshold" /t reg_dword /d "1500" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "irpstacksize" /t reg_dword /d "50" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "largebuffersize" /t reg_dword /d "32768" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "maximumdynamicbacklog" /t reg_dword /d "20000" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "mediumbuffersize" /t reg_dword /d "12032" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "minimumdynamicbacklog" /t reg_dword /d "20" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "nonblockingsendspecialbuffering" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "priorityboost" /t reg_dword /d "8" /f
reg add "hklm\system\currentcontrolset\services\afd\parameters" /v "smallbuffersize" /t reg_dword /d "1024" /f
reg add "hklm\software\microsoft\internet explorer\main\featurecontrol\feature_maxconnectionsper1_0server" /v "explorer.exe" /t reg_dword /d "10" /f
reg add "hklm\software\microsoft\internet explorer\main\featurecontrol\feature_maxconnectionsper1_0server" /v "iexplore.exe" /t reg_dword /d "10" /f
reg add "hklm\software\microsoft\internet explorer\main\featurecontrol\feature_maxconnectionsperserver" /v "explorer.exe" /t reg_dword /d "10" /f
reg add "hklm\software\microsoft\internet explorer\main\featurecontrol\feature_maxconnectionsperserver" /v "iexplore.exe" /t reg_dword /d "10" /f
reg add "hku\.default\software\microsoft\windows\currentversion\internet settings" /v "maxconnectionsper1_0server" /t reg_dword /d "10" /f
reg add "hku\.default\software\microsoft\windows\currentversion\internet settings" /v "maxconnectionsperserver" /t reg_dword /d "10" /f
reg delete "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\%guid1%" /v "tcpinitialrtt" /f
goto adapter
:adapter
for /f "usebackq tokens=6 delims=\" %%a in (`reg query hklm\system\controlset001\control\class /s /f "Network adapters"`) do set guid2=%%a
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*alternatesemaphoredelay" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*eee" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*enablemsi" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*flowcontrol" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*interruptmoderation" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*intmode" /t reg_sz /d "2" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*ipchecksumoffloadipv4" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*jumbopacket" /t reg_sz /d "1514" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*llipush" /t reg_sz /d "1472" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*llisize" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*lsov2ipv4" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*lsov2ipv6" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*numrssqueues" /t reg_sz /d "2" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*pmarpoffload" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*pmnsoffload" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*priorityvlantag" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*receivebuffers" /t reg_sz /d "2048" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*rss" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*rssprofile" /t reg_sz /d "4" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*rxabsintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*rxintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*speedduplex" /t reg_sz /d "6" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*tcpchecksumoffloadipv4" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*transmitbuffers" /t reg_sz /d "2048" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*txabsintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*udpchecksumoffloadipv4" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*wakeonmagicpacket" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "*wakeonpattern" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "alternatesemaphoredelay" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "eee" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "eeelinkadvertisement" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "enable9kjftpt" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "enablemsi" /t reg_sz /d "00000001" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "enablepme" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "intmode" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "itr" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "llipush" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "llisize" /t reg_sz /d "1472" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "loglinkstateevent" /t reg_sz /d "14" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "masterslave" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "node" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "numrssqueues" /t reg_sz /d "4" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "receivescalingmode" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "reducespeedonpowerdown" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "rxabsintdelay" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "sipsenabled" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "txabsintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "txintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "ulpmode" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "waitautonegcomplete" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "wakeonlink" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000" /v "wakeonslot" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000\ndi\params\numrssqueues\enum" /v "3" /t reg_sz /d "3 queues" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0000\ndi\params\numrssqueues\enum" /v "4" /t reg_sz /d "4 queues" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*alternatesemaphoredelay" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*eee" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*enablemsi" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*flowcontrol" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*interruptmoderation" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*intmode" /t reg_sz /d "2" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*ipchecksumoffloadipv4" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*jumbopacket" /t reg_sz /d "1514" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*llipush" /t reg_sz /d "1472" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*llisize" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*lsov2ipv4" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*lsov2ipv6" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*numrssqueues" /t reg_sz /d "2" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*pmarpoffload" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*pmnsoffload" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*priorityvlantag" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*receivebuffers" /t reg_sz /d "2048" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*rss" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*rssprofile" /t reg_sz /d "4" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*rxabsintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*rxintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*speedduplex" /t reg_sz /d "6" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*tcpchecksumoffloadipv4" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*transmitbuffers" /t reg_sz /d "2048" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*txabsintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*udpchecksumoffloadipv4" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*wakeonmagicpacket" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "*wakeonpattern" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "alternatesemaphoredelay" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "eee" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "eeelinkadvertisement" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "enable9kjftpt" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "enablemsi" /t reg_sz /d "00000001" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "enablepme" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "intmode" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "itr" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "llipush" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "llisize" /t reg_sz /d "1472" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "loglinkstateevent" /t reg_sz /d "14" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "masterslave" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "node" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "numrssqueues" /t reg_sz /d "4" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "receivescalingmode" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "reducespeedonpowerdown" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "rxabsintdelay" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "sipsenabled" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "txabsintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "txintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "ulpmode" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "waitautonegcomplete" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "wakeonlink" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007" /v "wakeonslot" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007\ndi\params\numrssqueues\enum" /v "3" /t reg_sz /d "3 queues" /f
reg add "hklm\system\controlset001\control\class\%guid2%\0007\ndi\params\numrssqueues\enum" /v "4" /t reg_sz /d "4 queues" /f
reg add "hklm\system\currentcontrolset\services\ndis\parameters" /v "maxnumrsscpus" /t reg_dword /d "4" /f
reg add "hklm\system\currentcontrolset\services\ndis\parameters" /v "rssbasecpu" /t reg_dword /d "0" /f
goto memory
:memory
for /f %%a in ('wmic cpu get L2CacheSize ^| findstr /r "[0-9][0-9]"') do (
    set /a l2c=%%a
    set /a sum1=%%a
) 
for /f %%a in ('wmic cpu get L3CacheSize ^| findstr /r "[0-9][0-9]"') do (
    set /a l3c=%%a
    set /a sum2=%%a
) 
reg add "hklm\system\controlset001\control\session manager\memory management" /v "secondleveldatacache" /t reg_dword /d "%sum1%" /f
reg add "hklm\system\controlset001\control\session manager\memory management" /v "thirdleveldatacache" /t reg_dword /d "%sum2%" /f
reg add "hklm\system\controlset001\control\session manager\memory management" /v "pagingfiles" /t reg_multi_sz /d "c:\pagefile.sys 0 0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "contigfileallocsize" /t reg_dword /d "1536" /f
reg add "hklm\system\controlset001\control\filesystem" /v "disabledeletenotification" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "dontverifyrandomdrivers" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\filesystem" /v "filenamecache" /t reg_dword /d "1024" /f
reg add "hklm\system\controlset001\control\filesystem" /v "longpathsenabled" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsallowextendedcharacter8dot3rename" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsbugcheckoncorrupt" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsdisable8dot3namecreation" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsdisablecompression" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsdisableencryption" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsencryptpagingfile" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsmemoryusage" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "ntfsmftzonereservation" /t reg_dword /d "4" /f
reg add "hklm\system\controlset001\control\filesystem" /v "pathcache" /t reg_dword /d "128" /f
reg add "hklm\system\controlset001\control\filesystem" /v "refsdisablelastaccessupdate" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\filesystem" /v "udfssoftwaredefectmanagement" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\filesystem" /v "win31filesystem" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "contigfileallocsize" /t reg_dword /d "1536" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "disabledeletenotification" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "dontverifyrandomdrivers" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "filenamecache" /t reg_dword /d "1024" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "longpathsenabled" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsallowextendedcharacter8dot3rename" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsbugcheckoncorrupt" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsdisable8dot3namecreation" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsdisablecompression" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsdisableencryption" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsencryptpagingfile" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsmemoryusage" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "ntfsmftzonereservation" /t reg_dword /d "3" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "pathcache" /t reg_dword /d "128" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "refsdisablelastaccessupdate" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "udfssoftwaredefectmanagement" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\filesystem" /v "win31filesystem" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\session manager\executive" /v "additionalcriticalworkerthreads" /t reg_dword /d "00000016" /f
reg add "hklm\system\currentcontrolset\control\session manager\executive" /v "additionaldelayedworkerthreads" /t reg_dword /d "00000016" /f
reg add "hklm\system\currentcontrolset\control\session manager\i/o system" /v "countoperations" /t reg_dword /d "00000000" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "clearpagefileatshutdown" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "featuresettingsoverride" reg_dword /d "00000003" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "featuresettingsoverridemask" reg_dword /d "00000003" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "iopagelocklimit" /t reg_dword /d "08000000" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "largesystemcache" /t reg_dword /d "00000000" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "systempages" /t reg_dword /d "4294967295" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "disablepagingexecutive" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "iopagelocklimit" /t reg_dword /d "16710656" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management" /v "largesystemcache" /t reg_dword /d "00000000" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management\prefetchparameters" /v "enableboottrace" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management\prefetchparameters" /v "enableprefetcher" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\control\session manager\memory management\prefetchparameters" /v "enablesuperfetch" /t reg_dword /d "0" /f
for /f "tokens=2 delims==" %%a in ('wmic os get TotalVisibleMemorySize /format:value') do set mem=%%a
set /a ram=%mem% + 1024000
reg add "hklm\system\currentcontrolset\control" /v "svchostsplitthresholdinkb" /t reg_dword /d "%ram%" /f
reg add "hklm\system\currentcontrolset\control\class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "perflevelsrc" /t reg_dword /d "0x00002222" /f
reg add "hklm\system\currentcontrolset\control\class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "powermizerenable" /t reg_dword /d "00000001" /f
reg add "hklm\system\currentcontrolset\control\class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "powermizerlevel" /t reg_dword /d "00000001" /f
reg add "hklm\system\currentcontrolset\control\class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "powermizerlevelac" /t reg_dword /d "00000001" /f
reg add "hklm\system\currentcontrolset\control\class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "enablecoreslowdown" /t reg_dword /d "00000000" /f
reg add "hklm\system\currentcontrolset\control\class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "enablemclkslowdown" /t reg_dword /d "00000000" /f
reg add "hklm\system\currentcontrolset\control\class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "enablenvclkslowdown" /t reg_dword /d "00000000" /f
goto regs
:regs
echo >> mfix.reg Windows Registry Editor Version 5.00
echo >> mfix.reg [HKEY_CURRENT_USER\Control Panel\Mouse]
echo >> mfix.reg "MouseSensitivity"="10"
echo >> mfix.reg "SmoothMouseXCurve"=hex:\
echo >> mfix.reg 00,00,00,00,00,00,00,00,\
echo >> mfix.reg C0,CC,0C,00,00,00,00,00,\
echo >> mfix.reg 80,99,19,00,00,00,00,00,\
echo >> mfix.reg 40,66,26,00,00,00,00,00,\
echo >> mfix.reg 00,33,33,00,00,00,00,00
echo >> mfix.reg "SmoothMouseYCurve"=hex:\
echo >> mfix.reg 00,00,00,00,00,00,00,00,\
echo >> mfix.reg 00,00,38,00,00,00,00,00,\
echo >> mfix.reg 00,00,70,00,00,00,00,00,\
echo >> mfix.reg 00,00,A8,00,00,00,00,00,\
echo >> mfix.reg 00,00,E0,00,00,00,00,00
regedit.exe /s mfix.reg
del mfix.reg
echo >> ctcp.reg Windows Registry Editor Version 5.00 
echo >> ctcp.reg [HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0] 
echo >> ctcp.reg "0200"=hex:00,00,00,00,01,00,00,07,00,00,00,00,00,00,00,00,1e,00,00,00,00,00,\ 
echo >> ctcp.reg 00,00,00,00,00,00,02,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,ff,\ 
echo >> ctcp.reg 00,ff,00,ff,ff,00,00,00,00,00,00,00,00,ff,ff,ff,ff,00,00,00,00,00,00,00,00,\ 
echo >> ctcp.reg ff,ff,00,00,ff,ff,ff,ff,00,00,00,00,00,00,00,00 
echo >> ctcp.reg "1700"=hex:00,00,00,00,01,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\ 
echo >> ctcp.reg 00,00,00,00,00,00,02,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\ 
echo >> ctcp.reg 00,ff,00,ff,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\ 
echo >> ctcp.reg ff,00,00,00,ff,ff,ff,ff,00,00,00,00,00,00,00,00  
regedit.exe /s ctcp.reg 
del ctcp.reg
goto powersettings
:powersettings
powercfg -devicedisablewake "HID-compliant mouse"
powercfg -devicedisablewake "HID keyboard Device"
powercfg -devicedisablewake "Intel(R) Ethernet Connection (2) I218-V"
reg add "hklm\system\controlset001\control\power\user\powerschemes" /v "activepowerscheme" /t reg_sz /d "66666666-6666-6666-6666-666666666666" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666" /v "description" /t reg_expand_sz /d "full speed cpu" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666" /v "friendlyname" /t reg_expand_sz /d "highest performance disable idle" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\238c9fa8-0aad-41ed-83f4-97be242c8f20\94ac6d29-73ce-41a6-809f-6363ba21b47e" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\238c9fa8-0aad-41ed-83f4-97be242c8f20\bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\245d8541-3943-4422-b025-13a784f679b7" /v "acsettingindex" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "acsettingindex" /t reg_dword /d "100000" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "acsettingindex" /t reg_dword /d "100" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad" /v "acsettingindex" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "acsettingindex" /t reg_dword /d "100" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "acsettingindex" /t reg_dword /d "100" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb" /v "acsettingindex" /t reg_dword /d "100" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777" /v "description" /t reg_expand_sz /d "power saving cpu" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777" /v "friendlyname" /t reg_expand_sz /d "highest performance enable idle" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\238c9fa8-0aad-41ed-83f4-97be242c8f20\94ac6d29-73ce-41a6-809f-6363ba21b47e" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\238c9fa8-0aad-41ed-83f4-97be242c8f20\bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\245d8541-3943-4422-b025-13a784f679b7" /v "acsettingindex" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "acsettingindex" /t reg_dword /d "100000" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "acsettingindex" /t reg_dword /d "100" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "acsettingindex" /t reg_dword /d "100" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "acsettingindex" /t reg_dword /d "100" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "acsettingindex" /t reg_dword /d "0" /f
reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb" /v "acsettingindex" /t reg_dword /d "100" /f
powercfg -attributes SUB_PROCESSOR 5d76a2ca-e8c0-402f-a133-2158492d58ad -ATTRIB_HIDE
powercfg -setactive "77777777-7777-7777-7777-777777777777"
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a
powercfg -h off
goto hosts
:hosts
del /F /Q "%WINDIR%\SYSTEM32\drivers\etc\hosts"
echo 127.0.0.1 localhost>>%windir%\SYSTEM32\drivers\etc\hosts
echo 127.0.0.1 localhost.localdomain>>%windir%\SYSTEM32\drivers\etc\hosts
echo 255.255.255.255 broadcasthost>>%windir%\SYSTEM32\drivers\etc\hosts
echo ::1 localhost>>%windir%\SYSTEM32\drivers\etc\hosts
echo 127.0.0.1 local>>%windir%\SYSTEM32\drivers\etc\hosts
echo ::1 ip6-localhost ip6-loopback>>%windir%\SYSTEM32\drivers\etc\hosts
echo fe00::0 ip6-localnet>>%windir%\SYSTEM32\drivers\etc\hosts
echo ff00::0 ip6-mcastprefix>>%windir%\SYSTEM32\drivers\etc\hosts
echo ff02::1 ip6-allnodes>>%windir%\SYSTEM32\drivers\etc\hosts
echo ff02::2 ip6-allrouters>>%windir%\SYSTEM32\drivers\etc\hosts
echo ff02::3 ip6-allhosts>>%windir%\SYSTEM32\drivers\etc\hosts
echo. >>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.21.16.151>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.21.236.193>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.22.70.61>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.22.71.158>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.22.75.120>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.22.77.127>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.22.87.71>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.22.245.247>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 4.27.253.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 4.27.253.253>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 4.27.254.254>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.12.223.125>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.12.223.254>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.26.206.252>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.26.207.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.26.209.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.26.210.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.254.56.254>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.254.233.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.254.240.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.254.248.254>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 13.107.4.50>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.2.16.8>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.2.16.10>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.3.59.68>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.3.59.213>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.33.25.34>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.33.31.59>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.33.106.110>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.46.18.40>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.46.19.158>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.73.138.65>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.96.212.225>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.98.49.14>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.202.16.64>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.202.21.236>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.202.58.89>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.202.61.139>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 31.13.65.2>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 31.13.69.193>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 40.114.54.223>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 40.117.88.112>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 46.33.76.33>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 46.33.76.57>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 54.243.135.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.148.207.70>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.148.207.80>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.148.207.88>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.148.207.95>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.148.207.97>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.148.207.151>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.241.108.111>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.241.108.124>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.243.243.34>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.243.243.35>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.243.243.48>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.243.243.49>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.243.243.58>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.243.243.67>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.4.6.100>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.4.54.18>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.4.54.22>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.4.54.32>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.4.54.98>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.4.54.153>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.4.54.165>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.233.185.148>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.233.185.149>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.100.7>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.100.9>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.100.11>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.100.91>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.100.92>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.100.93>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.100.94>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.2>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.11>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.27>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.33>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.52>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.56>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.59>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.90>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.92>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.153>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.154>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.163>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.251>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.254>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.161.64>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.54.192.248>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.54.225.167>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.54.226.187>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.2.2>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.29.238>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.39.10>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.44.82>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.44.85>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.44.108>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.44.109>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.52.23>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.113.11>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.113.12>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.113.13>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.128.80>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.128.81>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.138.110>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.138.111>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.149.120>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.227.188>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.252.43>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.252.63>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.252.71>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.252.93>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.252.190>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.119.144.189>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.119.147.131>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.119.152.205>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.138.193>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.138.194>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.138.195>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.139.17>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.139.18>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.139.19>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.139.205>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.139.206>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.139.207>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.56>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.58>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.61>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.92>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.94>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.97>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.103>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.109>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.110>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.111>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.112>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.113>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.120>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.129>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.131>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.132>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.172>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.173>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.174>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.215>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.218>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.235>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.236>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.254>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.37>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.39>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.40>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.41>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.44>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.56>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.87>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.89>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.148>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.173>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.180>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.183>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.188>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.208>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.209>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.244>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.248>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.251>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.253>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.16>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.47>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.50>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.51>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.63>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.68>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.129>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.132>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.145>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.152>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.9>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.10>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.16>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.25>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.26>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.33>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.34>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.40>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.48>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.56>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.128>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 74.125.21.148>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 74.125.21.149>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 93.184.215.200>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 94.245.121.176>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 94.245.121.177>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 94.245.121.178>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 94.245.121.179>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 95.101.128.137>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 95.101.128.195>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 96.17.204.25>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 96.17.204.167>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.45.136.42>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.69.113.196>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.69.140.179>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.69.140.181>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.70.210.203>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.73.211.105>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.73.211.159>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.73.215.154>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.73.217.91>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.73.220.170>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.107.13.214>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 107.20.234.199>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 107.21.246.114>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.107.113.238>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.14.76>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.14.121>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.14.194>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.34.230>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.40.47>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.40.53>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.40.64>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.40.109>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.30.221>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.51.248>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.52.151>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.53.29>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.53.30>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.58.121>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.58.123>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.58.125>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.58.189>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.107.176>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.109.200>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.119.140>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.184.133>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.185.125>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.188.139>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.188.248>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 137.117.100.176>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.55.129.21>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.56.23.91>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.56.77.139>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.56.96.54>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.56.96.80>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.56.96.208>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.56.100.83>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.56.106.189>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 165.254.114.10>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 165.254.114.34>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 168.61.24.141>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 168.62.11.145>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 168.62.21.207>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 174.129.244.227>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 184.28.167.143>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 184.29.134.49>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 184.29.137.155>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 184.30.37.150>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 184.31.242.141>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 191.232.139.210>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 191.232.140.76>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 191.236.16.12>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 191.238.241.80>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 192.229.163.249>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 192.243.250.72>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 192.243.250.88>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 198.78.206.253>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 207.46.7.252>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 207.46.202.114>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 207.46.223.94>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 207.68.166.254>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 216.38.170.128>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 0.r.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 a.ads1.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 a.ads2.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 a.rad.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ac3.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 act-3-blu.mesh.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 activesync.glbdns2.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ad.doubleclick.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ads.eu.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ads.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ads.msn.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ads1.msads.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ads1.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ads2.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ads2.msn.com.c.footprint.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 adsmockarc.azurewebsites.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 adsyndication.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 aidps.atdmt.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 aidps.msn.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 aka-cdn-ns.adtech.de>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 analytics.live.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 analytics.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 analytics.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 analytics.msnbc.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 analytics.r.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 appexmapsappupdate.blob.core.windows.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 arc2.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 arc3.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 arc9.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 atlas.c10r.facebook.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 b.ads1.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 b.rad.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 bat.bing.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 bingads.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 bl3302.storage.skyprod.akadns.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 blu.mobileads.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 bn1-2cd.wns.windows.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 bn1cd.wns.windows.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 bn1wns2011508.wns.windows.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 bn2wns1.wns.windows.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 bn2wns1b.wns.windows.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 bs.eyeblaster.akadns.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 bs.serving-sys.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 c.atdmt.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 c.atdmt.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 c.bing.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 c.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 c.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 c.msn.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 c.ninemsn.com.au>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 c.no.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 c1.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 cdn.atdmt.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 cdn.content.prod.cms.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 cds26.ams9.msecn.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 choice.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 choice.microsoft.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 cmsresources.windowsphone.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 col.mobileads.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 compatexchange.cloudapp.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 content.windows.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 corp.sts.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 corpext.msitadfs.glbdns2.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 cs1.wpc.v0cdn.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 dart.l.doubleclick.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 db3aqu.atdmt.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 dc.services.visualstudio.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 dev.virtualearth.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 df.telemetry.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 diagnostics.support.microsoft.akadns.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 diagnostics.support.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 digg.analytics.live.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 directory.services.live.com.akadns.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 displaycatalog.md.mp.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 dl.delivery.mp.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 dmd.metaservices.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 download-ssl.msgamestudios.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ecn.dev.virtualearth.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 en-us.appex-rf.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 fe2.update.microsoft.com.akadns.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 fe3.delivery.dsp.mp.microsoft.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 fe3.delivery.mp.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 feedback.microsoft-hohm.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 feedback.search.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 feedback.windows.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 fesweb1.ch1d.binginternal.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ff4a487e56259f4bd5831e9e30470e83.azr.msnetworkanalytics.testanalytics.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 flex.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 flex.msn.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 g.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 g.msn.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 geo-prod.do.dsp.mp.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 global.msads.net.c.footprint.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 h1.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 h2.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 help.bingads.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 i1.services.social.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 i1.services.social.microsoft.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 inference.location.live.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 js.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 lb1.www.ms.akadns.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 licensing.md.mp.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 live.rads.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 livetileedge.dsx.mp.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 logging.windows.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 m.adnxs.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 m.anycast.adnxs.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 mediadiscovery.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 microsoft-hohm.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 msnportal.112.2o7.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 msntest.serving-sys.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 oca.telemetry.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 oca.telemetry.microsoft.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 onesettings-bn2.metron.live.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 onesettings-cy2.metron.live.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 onesettings-db5.metron.live.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 onesettings-hk2.metron.live.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 otf.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 popup.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 pre.footprintpredict.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 rad.live.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 rad.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 rad.msn.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 redir.metaservices.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 reports.wes.df.telemetry.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 rmads.eu.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 rmads.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 rpt.rad.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 sb.scorecardresearch.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 schemas.microsoft.akadns.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 secure.adnxs.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 secure.anycast.adnxs.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 secure.flashtalking.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 services.wes.df.telemetry.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 settings.data.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 settings-sandbox.data.glbdns2.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 settings-sandbox.data.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 settings-ssl.xboxlive.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 settings-win.data.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 sgmetrics.cloudapp.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 shell.windows.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 siweb.microsoft.akadns.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 skyapi.skyprod.akadns.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 sls.update.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 sls.update.microsoft.com.akadns.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 sls.update.microsoft.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 sO.2mdn.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 spynet.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 spynet2.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 spynetalt.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 sqm.df.telemetry.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 sqm.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 sqm.telemetry.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 sqm.telemetry.microsoft.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ssw.live.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE2JgkA>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ssw.live.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 static.2mdn.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 static-2mdn-net.l.google.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 statsfe1.ws.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 statsfe1.ws.microsoft.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 statsfe2.update.microsoft.com.akadns.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 statsfe2.ws.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 statsfe2.ws.microsoft.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 storeedgefd.dsx.mp.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 support.msn.microsoft.akadns.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 survey.watson.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 t.urs.microsoft.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 t0.ssl.ak.dynamic.tiles.virtualearth.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 t0.ssl.ak.tiles.virtualearth.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 telecommand.telemetry.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 telecommand.telemetry.microsoft.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 telemetry.appex.bing.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 telemetry.appex.search.prod.ms.akadns.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 telemetry.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 telemetry.urs.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 tile-service.weather.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 tlu.dl.delivery.mp.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 udc.msn.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 urs.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 version.hybrid.api.here.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 view.atdmt.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 vortex.data.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 vortex-bn2.metron.live.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 vortex-cy2.metron.live.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 vortex-hk2.metron.live.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 vortex-sandbox.data.glbdns2.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 vortex-sandbox.data.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 vortex-win.data.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 w3.b.cap-mii.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 watson.live.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 watson.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 watson.microsoft.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 watson.ppe.telemetry.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 watson.telemetry.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 watson.telemetry.microsoft.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 wes.df.telemetry.microsoft.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 win10.ipv6.microsoft.com.nsatc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 www.modern.ie>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.30.202>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 137.116.81.24>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 204.79.197.200>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.218.212.69>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.39.117.230>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.108.23>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 a-0001.a-msedge.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 telemetry.appex.bing.net:443>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 p1-play.edge4k.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 t1.daumcdn.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 play.kakao.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 telemetry.gfe.nvidia.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 gfe.nvidia.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 gfwsl.geforce.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 services.gfe.nvidia.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 accounts.nvgs.nvidia.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 events.gfe.nvidia.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 img.nvidiagrid.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 images.nvidiagrid.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 images.nvidia.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ls.dtrace.nvidia.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 ota.nvidia.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 rds-assets.nvidia.com>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 assets.nvidiagrid.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 nvidia.tt.omtrdc.net>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 api.commune.ly>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 login.nvgs.nvidia.cn>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 activate.bitsum.com>>%windir%\SYSTEM32\drivers\etc\hosts
ipconfig /flushdns
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof