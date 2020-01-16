# Felipe#8581 at discord [![GamingTweaks](https://img.shields.io/badge/support-me-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=53DKRDTP43ZAG&source=url)
A collection of cool hidden and not so hidden tweaks <br/>
This is heavily inspired by *RevisionOS* and *Fr33thy* discords. <br/>
Credits to everyone in those communitys

*Shortlink: [`https://git.io/JvfJ6`](https://git.io/JvfJ6)*

*Read this in other languages: [English](README.md), Portuguese.*

## Table of Contents

 - [**Custom ISOs**](#custom-isos)
 - [**Windows Timers**](#windows-timers)
 - [**MSI-Mode**](#msi-mode)
 - [**Affinity Policy Tool**](#affinity-policy-tool)
 - [**Process Scheduling**](#process-scheduling)
 - [**Power Options**](#power-options)
 - [**Device Remover**](#device-remover)
 - [**Services**](#services)
 - [**BIOS**](#bios)
 - [**Unpark Cores**](#unpark-cores)
 - [Overclocks](#overclocks)
 - [ContextMenu](#contextmenu)
 - [Network tweaks](#network-tweaks--intel-ethernet-adapter-tweaks)
 - [Hosts file](#hosts-file)
 - [Schtasks's tasks removal](#schtaskss-tasks-removal)
 - [Memory tweaks](#memory-tweaks)
 - [NVIDIA settings](#nvidia-settings)
 - [GPU tweaks](#gpu-tweaks)
 - [Boost and Unboost.bat](#boost-and-unboostbat-currently-for-windows-7)
 - [Useful links](#useful-links)

## Custom ISOs
This is such a important move, **TL;DR** this will make `50%` of work done. This is also hard to do professionally, so choose your ISO wisely. Removing/stripping too much cause more issues and incompatibility and doesnt help with performance or speed.

[ISO for Windows 7 by unlimitedOS 0.2.0](https://drive.google.com/file/d/1XlaT1gwsdYq5ecTpM3zqOOd668K3yOY_/view?usp=sharing)

[ISO for Windows 8.1 by canardo-TeamOS](https://www.teamos-hkrg.com/index.php?threads/windows-8-1-x64-ultra-lite-october-2019-net-4-8-no-softwares-original-theme.89903/)

[ISO for Windows 10 by Revision](https://sites.google.com/view/meetrevision/revios/download?authuser=0) <br/>
[*Learn more about them in Revision discord/community.*](https://discordapp.com/invite/CCxWegZ)

Installing them in MBR or GPT shouldnt make a difference. Dont worry about this. <br/>
If you play games at any windowed mode, use Windows 7 or you will have to deal with DWM. <br/>
Windows 7 is by far the best for performance, but theres more to care about and user preference. <br/>

## Windows Timers
After Windows 10 1809+, we have a forced synthetic QPC timer of 10mhz, <br/>
If you dont have compatibility issues or the needs of DX12/RTX its recommended to use previous versions. <br/> 

**For best common configuration, paste this in Command Promt:**

`bcdedit /set disabledynamictick yes` <br/>
`bcdedit /set useplatformclock no` <br/>
`bcdedit /set useplatformtick no` <br/>

**Install SetTimerResolutionService**

This service increases the resolution of the Windows kernel timer, which will significantly lower latency <br/>
Drop this file in C:/ folder, the file must be there to service work <br/>
Open command promt and paste: <br/>

`cd C:/` <br/>
`SetTimerResolutionService -install` <br/>

[Download SetTimerResolutionService](files/SetTimerResolutionService.exe)

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

If you still see stuttering/problems, you can try changing HPET (BIOS) to ON/OFF. Default is ON

## MSI-Mode

MSI is Message Signaled-Based Interrupts, a faster and better method that replaces Windows Line-Based interrupt mode. <br/>
Some drivers default to using legacy pin-triggered interrupts, which are now emulated and are slower than using MSI.

**Only set sata if you have sure its compatible, if you set it wrong you will BSOD** <br/>
**KILLER Ethernet cards are reported to be bad with MSI-mode**

![MSI](/img/msi1.png)<br/>

You need to Affinity tool in PCI ISA Bridge and PCI CPU Host to make they appear in the list if you want.

[Download MSI-mode utility v2](http://www.mediafire.com/file/2kkkvko7e75opce/MSI_util_v2.zip/file) <br/>
[*Read more Windows Line Based vs MSI Based.*](https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044/)

## Affinity Policy Tool

This tool sets affinity for a driver’s interrupts, <br/>
Using only one CPU affinity for usb and gpu make improvement in performance and responsiveness

**Mouse device and correspondent USB controler/hub to one single CPU (I use CPU1)** <br/>
**GPU and correspondent PCI to a different one single CPU (I use CPU3)**

![AFF](/img/affy.png)<br/>

![AFF](/img/affy2.png)<br/>

[Download Affinity Policy Tool](https://download.microsoft.com/download/9/2/0/9200a84d-6c21-4226-9922-57ef1dae939e/interrupt_affinity_policy_tool.msi)

##  Process Scheduling
**TL;DR** of what is Win32Priority:

is the amount of time the Windows process scheduler allocates to a program. Short quantum will improve responsiveness at the expense of more context switching, or switching between tasks, which is computationally expensive. Long quantum will improve performance of programs at the expense of lower responsiveness. Why would you want long quantum, then? Well, it minimizes context switching and will make the game run smoother, resulting in better consistency when aiming. However, short quantum could potentially decrease input lag which would improve consistency as well. The higher the boost, the better the FPS and smoothness will be, but you may experience degraded input response with high boost. Generally, long quantum results in better smoothness but slightly degraded mouse response, whereas the opposite is true for short quantum. <br/>

**42 Decimal** = Short, Fixed, High foreground boost. 2A Hex<br/>
**41 Decimal** = Short, Fixed, Medium foreground boost. 29 Hex<br/>
**40 Decimal** = Short, Fixed, No foreground boost. 28 Hex<br/>
**38 Decimal** = Short, Variable, High foreground boost. 26 Hex<br/>
**37 Decimal** = Short, Variable, Medium foreground boost. 25 Hex<br/>
**36 Decimal** = Short, Variable, No foreground boost. 24 Hex<br/>
**26 Decimal** = Long, Fixed, High foreground boost. 1A Hex<br/>
**25 Decimal** = Long, Fixed, Medium foreground boost. 19 Hex<br/>
**24 Decimal** = Long, Fixed, No foreground boost. 18 Hex<br/>
**22 Decimal** = Long, Variable, High foreground boost. 16 Hex<br/>
**21 Decimal** = Long, Variable, Medium foreground boost. 15 Hex<br/>
**20 Decimal** = Long, Variable, No foreground boost. 14 Hex<br/>

![w](/img/w32.png)

**Try to understand the values, try to test the values, choose your desired value.<br/>
I will no more recommend a single value, i can barely feel difference, tests in latency barely prove anything.<br/>
But seems like those values are the ones people like more: 42, 37, 26, 22 <br/>
To set Win32PrioritySeparation to 42 Decimal (2A Hex), paste this to Command Promt:**

`reg add "hklm\system\controlset001\control\prioritycontrol" /v win32priorityseparation /t reg_dword /d 00000042 /f`

[*Read more about Process Scheduling and Win32PrioritySeparation*](http://recoverymonkey.org/2007/08/17/processor-scheduling-and-quanta-in-windows-and-a-bit-about-unixlinux/)

##  Power Options

Custom Power Plans: <br/>
Disable wake timers, USB Suspend setting, Controls CPU Idle, Disable Power Savings and more. <br/>

![p](/img/power1.png)

[Download Power Plans](files/power.reg)

###  Device Remover

This is a super powerfull tool that can enable/disable/stop/delete Devices and Drivers

**Set to show only hidden/detached devices**

![wake](/img/device1.png)

**Remove all**<br/>

![wake](/img/device2.png)

**Delete devices that dont cause problems**

![AFF](/img/devices.png)

##   Services

[Download Services Tweak for Windows 7](files/7services.bat) <br/>
[Download Services Tweak for Windows 8.1](files/8services.bat) <br/>
[Download Services Tweak for Windows 10](files/10services.bat)

##   BIOS

This is very important for your system, make sure to check every setting <br/>

**Remove all protections and power savings, enable max performance/power** <br/>

Internal PLL Overvoltage Disabled<br/>
Spread Sprectum Disabled<br/>
BCLK Recovery Disabled<br/>
Intel Rapid Start Disabled<br/>
Intel Smart Connect Disabled<br/>
EPU Power Saving mode Disabled<br/>
CPU Load-line Calibration(LLC) 7<br/>
CPU Power Phase Control Extreme<br/>
CPU Power Duty Control Extreme<br/>
CPU Current Capability 140%<br/>
CPU Frequency Tuning Mode +6%<br/>
CPU Frequency Switch Max<br/>
DRAM Frequency Switch Max<br/>
DRAM Current Capability 130%<br/>
DRAM Power Phase Control Extreme<br/>
Termination Anti-Aliasing Enabled<br/>
Enhanced Intel SpeedStep Technology Disabled<br/>
Long Duration Package Power Limit 9999<br/>
Short Duration Package Power Limit 9999<br/>
CPU Integrated VR Current Limit 9999<br/>
Package Power Time Window 9999<br/>
Idle Power-in Response Fast<br/>
Idle Power-out Responde Regular<br/>
Power Current Slope Level-4<br/>
Power Current Offset -100%<br/>
Power Fast Ramp Response 1.5<br/>
CPU C-States Disabled<br/>
CFG Lock Enabled<br/>
High Precision Timer Disabled<br/>
Intel Adaptive Thermal Monitor Disabled<br/>
Hyper-threading Disabled<br/>
Execute Disable Bit Disabled<br/>
Intel Virtualization Technology Disabled<br/>
Disable USB xHCI<br/>
Disable USB EHCI Hand-Off<br/>
Disable Legacy USB

##   Overclocks

Overclocks increase system performance and decreases latency,<br/>
No secret right? BIOS for CPU and RAM oc, Afterburner/Inspector for GPU oc <br/>
Test stability with: <br/>
[Download OCCT 5.4.2](https://www.ocbase.com/download.php) <br/>
[Download MEMTest64](https://drive.google.com/file/d/12ga7LsEogbp8yQIUhPKRHTmxNh8fFS5s/view?usp=sharing)

##   Unpark Cores

Core parking allows an operating system to completely shut off a core, <br/>
so that it no longer performs any function, and draws little to no power. <br/>
This is a power saving feature and should be disabled
[Download Unpark CPU App](https://mega.nz/#!zsJhhT6K!qukmF8hU7IMogt5Gm2IFV8XT0ZBLAHogjgyBqV4DKvQ)

##   ContextMenu

My own right click to desktop,<br/>
Features: Easy switch of Power Plans and Game Booster<br/>
![p](/img/contextmenu.png)
[Download ContextMenu.bat](files/contextmenu.bat)

##   Network tweaks + Intel Ethernet Adapter tweaks

**Paste netsh stuff in Command Promt:**

`netsh winsock set autotuning off` <br/>
`netsh int teredo set state disabled` <br/>
`netsh int 6to4 set state disabled` <br/>
`netsh int isatap set state disabled` <br/>
`netsh int ip set global taskoffload=disabled` <br/>
`netsh int ip set global neighborcachelimit=4096` <br/>
`netsh int tcp set heuristics disabled` <br/>
`netsh int tcp set global congestionprovider=ctcp` <br/>
`netsh int tcp set supplemental Internet congestionprovider=ctcp` <br/>
`netsh int tcp set supplemental custom congestionprovider=ctcp` <br/>
`netsh int tcp set supplemental InternetCustom congestionprovider=ctcp` <br/>
`netsh int tcp set global rss=enabled` <br/>
`netsh int tcp set global rsc=disabled` <br/>
`netsh int tcp set global dca=enabled` <br/>
`netsh int tcp set global netdma=enabled` <br/>
`netsh int tcp set global chimney=disabled` <br/>
`netsh int tcp set global timestamps=disabled` <br/>
`netsh int tcp set global nonsackrttresiliency=disabled` <br/>
`netsh int tcp set global maxsynretransmissions=2` <br/>
`netsh int tcp set global autotuninglevel=disabled` <br/>
`netsh int tcp set global ecncapability=enabled` <br/>
`netsh int tcp set global fastopen=enabled` <br/>

**Use the file for referent your Windows version:**

[Download Windows 7 Network+Adapter.bat](files/net7.bat) <br/>
[Download Windows 8.1 Network.reg](files/net8.reg) + 
[Windows 8.1 Adapter.reg](files/adapter8.reg) <br/>
[Download Windows 10 Network+Adapter.bat](files/net10.bat)

##   Hosts file

You can block internet adresses from windows hosts file, <br/>
Here i try to block some minimal telemetry without hurt any connection <br/>
[Download Hosts.bat](files/hosts.bat)

##   Schtasks's tasks removal

[Download Windows 7 Schtasks Removal.bat](files/7tasks.bat) <br/>
[Download Windows 8.1 Schtasks Removal.bat](files/8tasks.bat) <br/>
[Download Windows 10 Schtasks Removal.bat](files/10tasks.bat)

##   Memory tweaks

[Download Memory.bat](files/memory.bat)

##   NVIDIA settings

**Uninstall current driver with DisplayDriverUninstaller(DDU)** <br/>
**You should use NVSlimmer with any of those drivers: 391.35 419.35 425.31 441.41**

[Download Windows 7/8.1 NVSlimmed 441.41](https://drive.google.com/file/d/1nI0hmfm0Z0v6gAyt60qL1kKZ3dfwoaWo/view?usp=sharing) <br/>
[Download Windows 10 NVSlimmed 441.41](https://drive.google.com/file/d/1hPNdFPPbt42qEXsZs7F-uSMndc5P_EmP/view?usp=sharing)

![MSI](/img/nvid.png)

![MSI](/img/scaling.png)

##   GPU tweaks

This .bat sets your card to P0 State and enable K-boost, <br/>
[Download GPU.bat](files/gpu.bat) <br/>
Optionally you can also install a custom GPU Bios to improve stability/performance

##  Boost and Unboost.bat (Currently only for Windows 7)

This is something i have been working on, **AND STILL NEED MUCH WORK, VERY ALPHA VERSION**<br/>
Here i try to stop maximum of services, terminate some services, set prioritys when i gonna game <br/>
[Download Boost7.bat](files/Boost.bat)<br/>
[Download UnBoost7.bat](files/UnBoost.bat)

## Useful links

**PC/Windows Stuff** </br>
[*RevisionOS discord*](https://discord.gg/CCxWegZ) </br>
[*Revision BIOS Tweaking Guide*](https://docs.google.com/document/d/1-izZaWrXaKIncYXDwmdY32YwdGCU5mDLJE6TW1Opnv8/edit) </br>
[*Hydro Device Manager Guide*](https://docs.google.com/document/d/1y9PG71osCksYZSZ2I-z4WpqMOVUu5Q4fFH0TOC29MCs/edit) </br>
[*Hydro Affinity Guide*](https://docs.google.com/document/d/1Xf7gqGE7m7aXjT1ncdoQBY1EFYroelqoKIY3UY8jVfE/edit) </br>
[*Hydro NVIDIA Panel Guide*](https://docs.google.com/document/d/1ME6wVOyB3ZIDlQFzMLNu3IrKYw8heX2rz5lA7hHmRkw/edit) </br>
[*Calypto discord*](https://discord.gg/PfsdHaP) </br>
[*Calypto Tweak Guide*](https://docs.google.com/document/d/1c2-lUJq74wuYK1WrA_bIvgb89dUN0sj8-hO3vqmrau4/edit?usp=sharing) </br>
[*Fr33thy discord*](https://discord.gg/pTc37y7) </br>
[*Fr33thy Youtube*](https://www.youtube.com/user/chrisfreeth/videos) </br>
[*n1kobg discord*](https://discord.gg/8KSHTZ3) </br>
[*n1kobg.blogspot.com*](http://n1kobg.blogspot.com/) </br>
[*The-Eye.eu*](https://the-eye.eu/public/MSDN/) </br>
[*PrivacyTools.io*](https://www.privacytools.io) </br>
[*CHEF-KOCH github*](https://github.com/CHEF-KOCH) </br>
[*KMS_VL_ALL github*](https://github.com/kkkgo/KMS_VL_ALL)

**Peripherals/Aiming/Gaming Stuff** </br>
[*Sparky Aim discord*](https://discord.gg/sparky) </br>
[*Setup tips page*](https://docs.google.com/document/d/1MkLeg229GXdOju2iEsKlKjYIvOUnTmHhwJ6MqR44ye0/edit) </br>
[*Sensitivity calculator*](https://aiming.pro/mouse-sensitivity-calculator) </br>
[*Overclock.net/mices*](http://www.overclock.net/f/375/mice) </br>
[*Reddit/MouseReview*](https://www.reddit.com/r/MouseReview/) </br>
[*Reddit/MousepadReview*](https://www.reddit.com/r/MousepadReview/) </br>
[*TFT Central Monitor Reviews*](https://www.tftcentral.co.uk/) </br>
[*RTings Monitor Reviews*](https://www.rtings.com/monitor) </br>
[*Blurbusters Monitor Stuff*](https://blurbusters.com/)

**Files/Tools** </br>
[*MouseTester*](files/MouseTester.7z) </br>
[*LatencyMonitor*](files/LatencyMon.7z) </br>
[*DeviceRemover*](files/DeviceRemover.7z) </br>
[*NVIDIA Inspector Pack*](files/InspectorPack.7z) </br>
[*IO Bit Unlocker*](files/IO%20Bit%20Unlocker.7z) </br>
[*Power Run*](files/PowerRun.7z) </br>
[*DNSBenchmark*](files/DNSBench.7z) <br/>
[*Autoruns*](files/Autoruns.7z) <br/>
[*CPU-Z + GPU-Z + HWINFO*](files/Tools.7z) </br>
[*MSI-Mode v2 + Affinity Policy Tool*](files/Tweaks.7z)

**Game Configs** </br>
[*Quake Live Config*](files/fe.7z)
