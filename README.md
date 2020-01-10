# Felipe 8581 at discord [![GamingTweaks](https://img.shields.io/badge/support-me-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=53DKRDTP43ZAG&source=url)
A collection of cool hidden and not so hidden tweaks for OS and programs. This is heavily inspired by Revision Os and Fr33thy discords. Also i have to mention some places and guys that helped me through this process, which is n1kobg,dreamjow,ailurus and more.

*Shortlink: [`https://git.io/Jvvxe`](https://git.io/Jvvxe)*

*Read this in other languages: [English](README.md), [Portuguese](README.pt.md).*

## Table of Contents

 - [Custom ISOs](#custom-isos)
 - [Windows Timers](#windows-timers)
 - [MSI-Mode](#msi-mode)
 - [Affinity Policy Tool](#affinity-policy-tool)
 - [Process Scheduling](#process-scheduling)
 - [Power Options](#power-options)
 - [Device Remover](#device-remover)
 - [Services](#services)
 - [BIOS](#bios)
 - [Overclocks](#overclocks)
 - [Unpark Cores](#unpark-cores)
 - [ContextMenu](#contextmenu)
 - [Network tweaks](#network-tweaks)
 - [Ethernet Adapter tweaks](#ethernet-adapter-tweaks)
 - [Hosts file](#hosts-file)
 - [Schtasks's tasks removal](#schtasks's-tasks-removal)
 - [Memory tweaks](#memory-tweaks)
 - [NVIDIA settings](#nvidia-settings)
 - [GPU tweaks](#gpu-tweaks)
 - [Boost and Unboost.bat](#boost-and-unboost.bat)

### Custom ISOs
This is such a important move, TL;DR this will make `50%` of work done. This is also hard to do professionally, so choose your ISO wisely. Removing/stripping too much cause more issues and incompatibility and doesnt help with performance or speed.

[ISO for Windows 7 by unlimitedOSgang](link)

[ISO for Windows 8.1 by me](link)

[ISOs for Windows 10 by Revision](https://sites.google.com/view/meetrevision/revios/download?authuser=0) <br/>
[*Learn more about them in Revision discord/community.*](https://discordapp.com/invite/CCxWegZ)

Installing them in either MBR or GPT doesnt make a difference, or shouldnt make it. Dont worry about this. <br/>
If you play games at fullscreen windowed mode, use Windows 7 or you will have to deal with problems in performance. <br/>
Windows 7 is by far the best for performance even in 2020, but theres much more to care about, also user preference. <br/>

### Windows Timers
After Windows 10 1809+, we have a forced synthetic QPC timer of 10mhz, thats why its recommended to use something older, <br/>
if you dont have compatibility issues or the needs of DX12/RTX for example. <br/> 
Previous versions are true TSC timer between 2-4mhz and gives the best performance and lowest latency. <br/>
If you still see stuttering/problems, you can try HPET disabled on BIOS.

**For best common configuration, paste this in Command Promt:**

`bcdedit /set disabledynamictick true` <br/>
`bcdedit /set useplatformclock false` <br/>
`bcdedit /set useplatformtick false` <br/>

**You can optionally paste those commands for system improvement,**

`bcdedit /set bootmenupolicy standard` <br/>
`bcdedit /set bootux disabled` <br/>
`bcdedit /set hypervisorlaunchtype off` <br/>
`bcdedit /set nx optout` <br/>
`bcdedit /set quietboot yes` <br/>
`bcdedit /set tpmbootentropy forcedisable` <br/>
`bcdedit /set {globalsettings} custom:16000067 true` <br/>
`bcdedit /set {globalsettings} custom:16000068 true` <br/>
`bcdedit /set {globalsettings} custom:16000069 true` <br/>
`bcdedit /timeout 0` <br/>
`bcdedit /set uselegacyapicmode no` <br/>
`bcdedit /set usefirmwarepcisettings no` <br/>
`bcdedit /set tscsyncpolicy Legacy` <br/>
`bcdedit /set x2apicpolicy enable` <br/>

### MSI-Mode

MSI is Message Signaled-Based Interrupts, a faster and better method that replaces Windows Line-Based interrupt mode. <br/>
TL;DR it makes your devices "faster" and improve latencys, better explanation soon.

**Set everything that is not a "problematic" Sata into MSI-Mode**

![MSI](/img/msi1.png)<br/>

Old Sata drivers usually doesnt support MSI, check if your Sata and sata driver is compatible. If you do this wrong you BSOD. <br/>
You need to Affinity tool in PCI ISA Bridge and PCI CPU Host to make they appear in the list if you want.

[*Read more Windows Line Based vs MSI Based.*](https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044/) <br/>
[*Download MSI-mode utility v2.*](http://www.mediafire.com/file/2kkkvko7e75opce/MSI_util_v2.zip/file)

### Affinity Policy Tool

This is extremely important for input devices, 

**Set Mouse device and correspondent USB controler/hub to one single CPU (I use CPU1)** <br/>
**GPU and correspondent PCI to another single CPU (I use CPU3)**

![AFF](/img/aff1.png)<br/>

[*Download Affinity Policy Tool.*](https://download.microsoft.com/download/9/2/0/9200a84d-6c21-4226-9922-57ef1dae939e/interrupt_affinity_policy_tool.msi)

###  Process Scheduling
There is different opinions about what is the best value and IF THERE IS a best value, <br/>
TL;DR of what is Win32Priority:

is the amount of time the Windows process scheduler allocates to a program. Short quantum will improve responsiveness at the expense of more context switching, or switching between tasks, which is computationally expensive. Long quantum will improve performance of programs at the expense of lower responsiveness. Why would you want long quantum, then? Well, it minimizes context switching and will make the game run smoother, resulting in better consistency when aiming. However, short quantum could potentially decrease input lag which would improve consistency as well. The higher the boost, the better the FPS and smoothness will be, but you may experience degraded input response with high boost. Generally, long quantum results in better smoothness but slightly degraded mouse response, whereas the opposite is true for short quantum. <br/>

2A Hex = Short, Fixed , High foreground boost. <br/>
29 Hex = Short, Fixed , Medium foreground boost. <br/>
28 Hex = Short, Fixed , No foreground boost. <br/>
26 Hex = Short, Variable , High foreground boost. <br/>
25 Hex = Short, Variable , Medium foreground boost. <br/>
24 Hex = Short, Variable , No foreground boost. <br/>
1A Hex = Long, Fixed, High foreground boost. <br/>
19 Hex = Long, Fixed, Medium foreground boost. <br/>
18 Hex = Long, Fixed, No foreground boost. <br/>
**16 Hex = Long, Variable, High foreground boost.** <br/>
15 Hex = Long, Variable, Medium foreground boost. <br/>
14 Hex = Long, Variable, No foreground boost. <br/>

![w](/img/w32p.png)

**To set Win32PrioritySeparation to 16 Hex, paste this to Command Promt:** <br/>
`reg add "hklm\system\controlset001\control\prioritycontrol" /v win32priorityseparation /t reg_dword /d 00000022 /f`

[*Read more about Process Scheduling and Win32PS.*](http://recoverymonkey.org/2007/08/17/processor-scheduling-and-quanta-in-windows-and-a-bit-about-unixlinux/)

###  Power Options

You basically want to disable power saving features and the ability to control CPU Idle On and Off. <br/>
I have a script that installs everything you need and this On/Off is based on what you choose, Power Saving or Performance. <br/>

**To import my profiles, paste this to Command Promt:**

`powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a` <br/>
`powercfg -h off` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes" /v "activepowerscheme" /t reg_sz /d "66666666-6666-6666-6666-666666666666" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666" /v "description" /t reg_expand_sz /d "full speed cpu" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666" /v "friendlyname" /t reg_expand_sz /d "highest performance disable idle" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\238c9fa8-0aad-41ed-83f4-97be242c8f20\94ac6d29-73ce-41a6-809f-6363ba21b47e" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\238c9fa8-0aad-41ed-83f4-97be242c8f20\bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\245d8541-3943-4422-b025-13a784f679b7" /v "acsettingindex" /t reg_dword /d "1" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "acsettingindex" /t reg_dword /d "100000" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "acsettingindex" /t reg_dword /d "100" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\54533251-82be-4824-96c1-47b60b740d00\5d76a2ca-e8c0-402f-a133-2158492d58ad" /v "acsettingindex" /t reg_dword /d "1" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "acsettingindex" /t reg_dword /d "100" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "acsettingindex" /t reg_dword /d "100" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\66666666-6666-6666-6666-666666666666\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb" /v "acsettingindex" /t reg_dword /d "100" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777" /v "description" /t reg_expand_sz /d "power saving cpu" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777" /v "friendlyname" /t reg_expand_sz /d "highest performance enable idle" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\238c9fa8-0aad-41ed-83f4-97be242c8f20\94ac6d29-73ce-41a6-809f-6363ba21b47e" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\238c9fa8-0aad-41ed-83f4-97be242c8f20\bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\245d8541-3943-4422-b025-13a784f679b7" /v "acsettingindex" /t reg_dword /d "1" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\2a737441-1930-4402-8d77-b2bebba308a3\0853a681-27c8-4100-a2fd-82013e970683" /v "acsettingindex" /t reg_dword /d "100000" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\2a737441-1930-4402-8d77-b2bebba308a3\48e6b7a6-50f5-4782-a5d4-53bb8f07e226" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\4f971e89-eebd-4455-a8de-9e59040e7347\96996bc0-ad50-47ec-923b-6f41874dd9eb" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "acsettingindex" /t reg_dword /d "100" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\54533251-82be-4824-96c1-47b60b740d00\893dee8e-2bef-41e0-89c6-b55d0929964c" /v "acsettingindex" /t reg_dword /d "100" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\54533251-82be-4824-96c1-47b60b740d00\bc5038f7-23e0-4960-96da-33abaf5935ec" /v "acsettingindex" /t reg_dword /d "100" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\7516b95f-f776-4464-8c53-06167f40cc99\3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e" /v "acsettingindex" /t reg_dword /d "0" /f` <br/>
`reg add "hklm\system\controlset001\control\power\user\powerschemes\77777777-7777-7777-7777-777777777777\7516b95f-f776-4464-8c53-06167f40cc99\aded5e82-b909-4619-9949-f5d71dac0bcb" /v "acsettingindex" /t reg_dword /d "100" /f` <br/>

![p](/img/power1.png)

###  Device Remover

This is a super powerfull tool that can enable/disable/stop/delete Devices and Drivers

![wake](/img/device1.png)<br/>
![wake](/img/device2.png)<br/>
![wake](/img/device3.png)<br/>

**Remove hidden/detached devices**<br/>

**Delete sermouse, Print Spooler, i8024prt**<br/>

**Disable:**
HID-compliant consumer control device<br/>
HID-compliant device<br/>
Generic PnP Monitor<br/>
WAN Miniport (IKEv2)<br/>
WAN Miniport (IP)<br/>
WAN Miniport (IPv6)<br/>
WAN Miniport (L2TP)<br/>
WAN Miniport (Network Monitor)<br/>
WAN Miniport (PPPOE)<br/>
WAN Miniport (PPTP)<br/>
WAN Miniport (SSTP)<br/>
Composite Bus Enumerator<br/>
High Defenition Audio Controler(NVIDIA)<br/>
Intel(R) Management Engine Interface<br/>
Microsoft System Management BIOS Driver<br/>
Microsoft Virtual Drive Enumerator Driver<br/>
System timer<br/>
Terminal Server Keyboard Driver<br/>
Terminal Server Mouse Driver<br/>
UMBus Root Bus Enumerator

###   Services

For Windows 7 i usually follow the famous BlackViper tweaked list <br/>
[*Download Services Tweak for Windows 7*](link)

For Windows 8.1 i just made my own list <br/>
[*Download Services Tweak for Windows 8.1*](link)

For Windows 10 there is n1ko extreme list or a safer list <br/>
[*Download Safer Services Tweak for Windows 10*](link) <br/>
[*Download Extreme Services Tweak for Windows 10*](link)

###   BIOS

This is very important for your system, make sure to check every setting <br/>

**Remove all protections and power savings, enable max performance/power** <br/>

Internal PLL Overvoltage Disabled<br/>
Spread Sprectum Disabled<br/>
BCLK Recovery Disabled<br/>
Intel Rapid Start Disabled<br/>
Intel Smart Connect Disabled<br/>
EPU Power Saving mode Disabled<br/>
CPU Load-line Calibration(LLC) Auto **(Need more test)**<br/>
CPU Power Phase Control Extreme<br/>
CPU Power Duty Control Extreme<br/>
CPU Current Capability 140%<br/>
CPU Frequency Tuning Mode +6%<br/>
CPU Frequency Switch 1000<br/>
DRAM Frequency Switch 1000<br/>
DRAM Current Capability 130%<br/>
DRAM Power Phase Control Extreme<br/>
Termination Anti-Aliasing Enabled<br/>
Enhanced Intel SpeedStep Technology Disabled<br/>
Long Duration Package Power Limit 9999<br/>
Short Duration Package Power Limit 9999<br/>
CPU Integrated VR Current Limit 9999<br/>
Package Power Time Window 9999<br/>
Idle Power-in Response Auto **(Need more test)** (Could try using the recommended Regular)<br/>
Idle Power-out Responde Auto **(Need more test)** (Recommended is Fast but could try Regular)<br/>
Power Current Slope Level-4<br/>
Power Current Offset -100%<br/>
Power Fast Ramp Response 1.5 **(Need more test)**<br/>
CPU C-States Disabled<br/>
CFG Lock Enabled<br/>
High Precision Timer Disabled<br/>
Intel Adaptive Thermal Monitor Disabled<br/>
Hyper-threading Disabled<br/>
Execute Disable Bit Disabled<br/>
Intel Virtualization Technology Disabled<br/>
Disable USB xHCI **(My preference/own choice)**<br/>
Disable USB EHCI Hand-Off **(My preference/own choice)**<br/>
Disable Legacy USB **(My preference/own choice)**<br/>

###   Overclocks

Overclocks increase system performance and decreases latency,<br/>
At least CPU overclock is mandatory in 2020
Space

###   Unpark Cores

Space

###   ContextMenu

Space

###   Network tweaks

Space

###   Ethernet Adapter tweaks

Space

###   Hosts file

Space

###   Schtasks's tasks removal

Space

###   Memory tweaks

Space

###   NVIDIA settings

Space

###   GPU tweaks

Space

###  Boost and Unboost.bat

Space
