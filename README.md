# Felipe#8581 at discord [![GamingTweaks](https://img.shields.io/badge/support-me-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=53DKRDTP43ZAG&source=url)
A collection of cool hidden and not so hidden tweaks for OS and programs. <br/>
This is heavily inspired by Revision Os and Fr33thy discords. Credits to those communitys and n1kobg,dreamjow,ailurus

*Shortlink: [`https://git.io/JvfJ6`](https://git.io/JvfJ6)*

*Read this in other languages: [English](README.md), [Portuguese](README.pt.md).*

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
 - [Network tweaks](#network-tweaks)
 - [Ethernet Adapter tweaks](#ethernet-adapter-tweaks)
 - [Hosts file](#hosts-file)
 - [Schtasks's tasks removal](#schtasks's-tasks-removal)
 - [Memory tweaks](#memory-tweaks)
 - [NVIDIA settings](#nvidia-settings)
 - [GPU tweaks](#gpu-tweaks)
 - [Boost and Unboost.bat](#boost-and-unboost.bat)
 - [Usefull list of discords/pages/files](#usefull-list)

## Custom ISOs
This is such a important move, **TL;DR** this will make `50%` of work done. This is also hard to do professionally, so choose your ISO wisely. Removing/stripping too much cause more issues and incompatibility and doesnt help with performance or speed.

[ISO for Windows 7 by unlimitedOSgang 0.2.0](https://drive.google.com/file/d/1XlaT1gwsdYq5ecTpM3zqOOd668K3yOY_/view?usp=sharing)

[ISO for Windows 8.1 by me SOON](link)

[ISO for Windows 10 by Revision](https://sites.google.com/view/meetrevision/revios/download?authuser=0) <br/>
[*Learn more about them in Revision discord/community.*](https://discordapp.com/invite/CCxWegZ)

Installing them in either MBR or GPT doesnt make a difference, or shouldnt make it. Dont worry about this. <br/>
If you play games at fullscreen windowed mode, use Windows 7 or you will have to deal with problems in performance. <br/>
Windows 7 is by far the best for performance even in 2020, but theres much more to care about, also user preference. <br/>

## Windows Timers
After Windows 10 1809+, we have a forced synthetic QPC timer of 10mhz, why its recommended to use something older, <br/>
if you dont have compatibility issues or the needs of DX12/RTX for example. <br/> 
Previous versions are true TSC timer between 2-4mhz and gives the best performance and lowest latency. <br/>
If you still see stuttering/problems, you can try changing HPET in bios

**For best common configuration, paste this in Command Promt:**

`bcdedit /set disabledynamictick true` <br/>
`bcdedit /set useplatformclock false` <br/>
`bcdedit /set useplatformtick false` <br/>

**Install SetTimerResolutionService, IMPORTANT!!**

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

## MSI-Mode

MSI is Message Signaled-Based Interrupts, a faster and better method that replaces Windows Line-Based interrupt mode. <br/>
**TL;DR** it makes your devices "faster" and improve latencys, better explanation soon.

**Set everything that is not a "problematic" Sata into MSI-Mode**

![MSI](/img/msi1.png)<br/>

Old Sata drivers usually doesnt support MSI, check if your Sata is compatible. If you do this wrong you BSOD till format. <br/>
You need to Affinity tool in PCI ISA Bridge and PCI CPU Host to make they appear in the list if you want.

[Download MSI-mode utility v2](http://www.mediafire.com/file/2kkkvko7e75opce/MSI_util_v2.zip/file) <br/>
[*Read more Windows Line Based vs MSI Based.*](https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044/)

## Affinity Policy Tool

This is extremely important for input devices, 

**Mouse device and correspondent USB controler/hub to one single CPU (I use CPU1)** <br/>
**GPU and correspondent PCI to a different one single CPU (I use CPU3)**

![AFF](/img/affy.png)<br/>

![AFF](/img/affy2.png)<br/>

[Download Affinity Policy Tool](https://download.microsoft.com/download/9/2/0/9200a84d-6c21-4226-9922-57ef1dae939e/interrupt_affinity_policy_tool.msi)

##  Process Scheduling
There is different opinions about what is the best value and IF THERE IS a best value, <br/>
**TL;DR** of what is Win32Priority:

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

**To set Win32PrioritySeparation to 16 Hex, paste this to Command Promt:**

`reg add "hklm\system\controlset001\control\prioritycontrol" /v win32priorityseparation /t reg_dword /d 00000022 /f`

[*Read more about Process Scheduling and Win32PS*](http://recoverymonkey.org/2007/08/17/processor-scheduling-and-quanta-in-windows-and-a-bit-about-unixlinux/)

##  Power Options

You basically want to disable power saving features and the ability to control CPU Idle On and Off. <br/>
I have a script that installs everything you need and this On/Off is based on what you choose, Power Saving or Performance. <br/>
![p](/img/power1.png)
[Download Power Plans](files/powerplan.bat)

###  Device Remover

This is a super powerfull tool that can enable/disable/stop/delete Devices and Drivers

**Set to show only hidden/detached devices**

![wake](/img/device1.png)

**Remove all**<br/>

![wake](/img/device2.png)

**Disable some devices:**

![AFF](/img/devices.png)

##   Services

For Windows 7 i usually follow the famous BlackViper tweaked list <br/>
[Download Services Tweak for Windows 7](files/7services.bat)

For Windows 8.1 i just made my own list <br/>
[Download Services Tweak for Windows 8.1](files/8services.bat)

For Windows 10 there is n1ko extreme list or a safer list <br/>
[Download Safer Services Tweak for Windows 10](files/10safeservices.bat) <br/>
[Download Extreme Services Tweak for Windows 10](files/10extremeservices.bat)

##   BIOS

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
Idle Power-in Response Auto **(Need more test)**<br/>
Idle Power-out Responde Auto **(Need more test)**<br/>
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
Disable USB xHCI **(My preference/own choice)**<br/>
Disable USB EHCI Hand-Off **(My preference/own choice)**<br/>
Disable Legacy USB **(My preference/own choice)**<br/>

##   Overclocks

Overclocks increase system performance and decreases latency,<br/>
At least CPU overclock is mandatory in 2020 <br/>
No secret right? BIOS for CPU and RAM oc, Afterburner/Inspector for GPU oc <br/>
Test stability with: <br/>
[Download OCCT 5.4.2](https://www.ocbase.com/download.php) <br/>
[Download MEMTest64](https://drive.google.com/file/d/12ga7LsEogbp8yQIUhPKRHTmxNh8fFS5s/view?usp=sharing)

##   Unpark Cores

There is many ways to unpark your cores,<br/>
Editing all regedit 0cc5b647-c1df-4637-891a-dec35c318583 found keys to ValueMax and ValueMin to 0<br/>
Installing a custom powerplan like mine<br/>
Using 3rd party program like Unpark CPU App<br/>
[Download Unpark CPU App](https://mega.nz/#!zsJhhT6K!qukmF8hU7IMogt5Gm2IFV8XT0ZBLAHogjgyBqV4DKvQ)

##   ContextMenu

My own right click to desktop,<br/>
![p](/img/contextmenu.png)
[Download ContextMenu.bat](files/contextmenu.bat)

##   Network tweaks

Covers all TCPOptimizer tweaks and aditional ones, made for gaming but wont hurt much your connection. <br/>
[Download Network.bat](files/network.bat)

##   Ethernet Adapter tweaks

This is for Intel Ethernet drivers, <br/>
[Download Adapter.bat](files/adapter.bat)

##   Hosts file

You can block internet adresses from windows hosts file, <br/>
Here i try to block some minimal telemetry without hurt any connection <br/>
[Download Hosts.bat](files/hosts.bat)

##   Schtasks's tasks removal

In windows 7 you can actually force-disable the service without problems. <br/>
[Download Windows 7 Schtasks Removal.bat](files/7tasks.bat)

[Download Windows 8.1 Schtasks Removal.bat](files/8tasks.bat)

[Download Windows 10 Schtasks Removal.bat](files/10tasks.bat)

##   Memory tweaks

[Download Memory.bat](files/memory.bat)

##   NVIDIA settings

**MANDATORY to unninstall current driver with DDU and install Tweaked 441.41!**

[Download Windows 7/8 Tweaked 441.41](https://drive.google.com/file/d/1nI0hmfm0Z0v6gAyt60qL1kKZ3dfwoaWo/view?usp=sharing)

[Download Windows 10 Tweaked 441.41](https://drive.google.com/file/d/1hPNdFPPbt42qEXsZs7F-uSMndc5P_EmP/view?usp=sharing)

![MSI](/img/nvidiaset.png)

##   GPU tweaks

This .bat sets your card to P0 State and enable K-boost, <br/>
[Download GPU.bat](files/gpu.bat) <br/>
Optionally you can also install a custom GPU Bios to improve stability/performance

##  Boost and Unboost.bat

This is something i have been working on, **AND STILL NEED MUCH WORK, VERY ALPHA VERSION**<br/>
Here i try to stop maximum of services, terminate some services, set prioritys when i gonna game <br/>
[Download Boost.bat](files/Boost.bat)<br/>
[Download UnBoost.bat](files/UnBoost.bat)

## Usefull list of discords/pages/files

**PC/Windows Stuff** </br>
[*Revision OS discord*](https://discord.gg/CCxWegZ) </br>
[*Fr33thy discord*](https://discord.gg/pTc37y7) </br>
[*n1kobg discord*](https://discord.gg/8KSHTZ3) </br>
[*The Perfect Input discord*](https://discord.gg/PfsdHaP) </br>
[*PrivacyTools.io*](https://www.privacytools.io)
[*The-Eye.eu Windows ISO Repository*](https://the-eye.eu/public/MSDN/)
[*Revision BIOS Tweaking Guide*](https://docs.google.com/document/d/1-izZaWrXaKIncYXDwmdY32YwdGCU5mDLJE6TW1Opnv8/edit)
[*Hydro Device Manager Guide*](https://docs.google.com/document/d/1y9PG71osCksYZSZ2I-z4WpqMOVUu5Q4fFH0TOC29MCs/edit)
[*Calypto Tweak Guide*](https://docs.google.com/document/d/1c2-lUJq74wuYK1WrA_bIvgb89dUN0sj8-hO3vqmrau4/edit?usp=sharing)
[*Fr33thy Youtube*](https://www.youtube.com/user/chrisfreeth/videos)
[*Fr33thy outdated Guide*](https://drive.google.com/file/d/1iUrqcEY4WyEXsDsgKkEFrNwolXl0Pa0J/view?usp=sharing)
[*n1kobg.blogspot.com*](http://n1kobg.blogspot.com/)

**Peripherals/Aiming/Gaming Stuff** </br>
[*Sparky Aim discord*](https://discord.gg/sparky) </br>
[*Setup tips page*](https://docs.google.com/document/d/1MkLeg229GXdOju2iEsKlKjYIvOUnTmHhwJ6MqR44ye0/edit) </br>
[*Sensitivity calculator*](https://aiming.pro/mouse-sensitivity-calculator) </br>
[*Overclock.net/mices*](http://www.overclock.net/f/375/mice) </br>
[*Reddit/MouseReview*](https://www.reddit.com/r/MouseReview/) </br>
[*Reddit/MousepadReview*](https://www.reddit.com/r/MousepadReview/)
