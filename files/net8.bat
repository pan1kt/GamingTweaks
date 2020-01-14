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
netsh int tcp set global dca=enabled 
netsh int tcp set global netdma=enabled 
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
goto TCP
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
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\{0A21087F-330E-485C-8E14-994C1F397879}" /v "ipautoconfigurationenabled" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\{0A21087F-330E-485C-8E14-994C1F397879}" /v "mtu" /t reg_dword /d "1492" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\{0A21087F-330E-485C-8E14-994C1F397879}" /v "performrouterdiscovery" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\{0A21087F-330E-485C-8E14-994C1F397879}" /v "tcpnodelay" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\{0A21087F-330E-485C-8E14-994C1F397879}" /v "tcpackfrequency" /t reg_dword /d "1" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\{0A21087F-330E-485C-8E14-994C1F397879}" /v "tcpdelackticks" /t reg_dword /d "0" /f
reg add "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\{0A21087F-330E-485C-8E14-994C1F397879}" /v "tcpwindowsize" /t reg_dword /d "65340" /f
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
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*flowcontrol" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*interruptmoderation" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*ipchecksumoffloadipv4" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*jumbopacket" /t reg_sz /d "1514" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*lsov2ipv4" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*lsov2ipv6" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*pmarpoffload" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*pmnsoffload" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*priorityvlantag" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*receivebuffers" /t reg_sz /d "2048" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*rss" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*speedduplex" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*tcpchecksumoffloadipv4" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*tcpchecksumoffloadipv6" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*transmitbuffers" /t reg_sz /d "2048" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*udpchecksumoffloadipv4" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*udpchecksumoffloadipv6" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*wakeonmagicpacket" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*wakeonpattern" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "eeelinkadvertisement" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "enablemsi" /t reg_sz /d "00000001" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "enablepme" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "itr" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "loglinkstateevent" /t reg_sz /d "16" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "numrssqueues" /t reg_sz /d "8" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "receivescalingmode" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "reducespeedonpowerdown" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "sipsenabled" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "txintdelay" /t reg_sz /d "28" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "ulpmode" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "masterslave" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "wakeonlink" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "wakeonslot" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000\ndi\params\numrssqueues\enum" /v "3" /t reg_sz /d "3 queues" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000\ndi\params\numrssqueues\enum" /v "4" /t reg_sz /d "4 queues" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000\ndi\params\numrssqueues\enum" /v "5" /t reg_sz /d "5 queues" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000\ndi\params\numrssqueues\enum" /v "6" /t reg_sz /d "6 queues" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000\ndi\params\numrssqueues\enum" /v "7" /t reg_sz /d "7 queues" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000\ndi\params\numrssqueues\enum" /v "8" /t reg_sz /d "8 queues" /f
reg add "hklm\system\currentcontrolset\services\ndis\parameters" /v "maxnumrsscpus" /t reg_dword /d "8" /f
reg add "hklm\system\currentcontrolset\services\ndis\parameters" /v "rssbasecpu" /t reg_dword /d "0" /f
::new
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*txabsintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*rxabsintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*rxintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*llipush" /t reg_sz /d "1472" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*llisize" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*intmode" /t reg_sz /d "2" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*enablemsi" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*eee" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*speedduplex" /t reg_sz /d "6" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*rssprofile" /t reg_sz /d "4" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*numrssqueues" /t reg_sz /d "8" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "*alternatesemaphoredelay" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "masterslave" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "waitautonegcomplete" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "txintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "eee" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "loglinkstateevent" /t reg_sz /d "14" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "node" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "llipush" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "llisize" /t reg_sz /d "1472" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "intmode" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "txabsintdelay" /t reg_sz /d "1" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "rxabsintdelay" /t reg_dword /d "1" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "alternatesemaphoredelay" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "enable9kjftpt" /t reg_sz /d "0" /f
reg add "hklm\system\controlset001\control\class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v "numrssqueues" /t reg_sz /d "8" /f
reg add "hklm\system\currentcontrolset\services\ndis\parameters" /v "maxnumrsscpus" /t reg_dword /d "8" /f
reg delete "hklm\system\currentcontrolset\services\tcpip\parameters\interfaces\{0A21087F-330E-485C-8E14-994C1F397879}" /v "tcpinitialrtt" /f
