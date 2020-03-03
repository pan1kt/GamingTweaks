# Felipe#8581 at discord [![GamingTweaks](https://img.shields.io/badge/support-me-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=53DKRDTP43ZAG&source=url)
A collection of cool hidden and not so hidden tweaks <br/>
This is heavily inspired by *RevisionOS* discord and Calypto's Guide.<br/>

*Shortlink: [`https://git.io/JvfJ6`](https://git.io/JvfJ6)*

*Read this in other languages: [English](README.md)![p](/img/US.png), [Portuguese](READMEpt.md)![p](/img/BR.png)*

**Note:** Some minimal stuff is Administrator protected/Windows protected, like disabling Scheduler service for example, best and easy method to make everything work in tweaking in Safe Mode.

## Table of Contents

 - [**Custom ISOs**](#custom-isos)
 - [**Windows Timers**](#windows-timers)
 - [**MSI-Mode**](#msi-mode)
 - [**Affinity Policy Tool**](#affinity-policy-tool)
 - [**Process Scheduling**](#process-scheduling)
 - [**Power Options**](#power-options)
 - [**Device Clean Up Tool**](#device-clean-up-tool)
 - [**Services**](#services)
 - [**BIOS**](#bios)
 - [**Unpark Cores**](#unpark-cores)
 - [Overclocks](#overclocks)
 - [Compilation of Bat Tweaks](#bat-tweaks)
 - [NVIDIA settings](#nvidia-settings)
 - [DWM disabler](#dwm-disabler)
 - [KMS activator](#kms-activator)
 - [Useful links](#useful-links)

## Custom ISOs
This is such a important move, will make `50%` of work done. Choose your ISO wisely. Removing/stripping too much cause more issues and incompatibility and doesnt help with performance or speed, i blindly trust those two ISO community creators because they have much experience.

[Windows 7 by Evolve 4.0.iso](https://drive.google.com/file/d/1ufV_hS9_KhgBsK78K2p9Vwc-zedVi53Z/view?usp=sharing) <br/>
[*Learn more about them in Evolve discord*](https://discordapp.com/invite/bkXwSNJ)<br/>

[Windows 8.1 by UnifyOS [SOON, ALMOST FINISHED AND RELEASED].iso](https://) <br/>

[Windows 10 by Revision 1809 S2.0.iso](https://drive.google.com/file/d/1LzG5vw9_d_FKqujt1P-gqrzKlzbpsLrN/view?usp=sharing) <br/>
[*Learn more about them in Revision discord*](https://discordapp.com/invite/CCxWegZ)

**Note:** Installing them in MBR or GPT might give you different feels ingame. Experiment between those two options<br/>
DWM (Desktop Window Manager) is prooved to be bad in every scenario, you should remove it in any win version. <br/>
Windows 7 is by far the best for performance, but you can wisely pick, experiment and tweak newer versions as well.<br/>

## Windows Timers

Windows timers are a complex topic. There are different types and results may vary. <br/>
To undo a command in BCDEdit, do bcdedit /deletevalue X (where X is useplatformclock, x2apicpolicy, etc.)

bcdedit /set disabledynamictick yes (Windows 8+) <br/>
This command forces the kernel timer to constantly poll for interrupts instead of wait for them; dynamic tick was implemented as a power saving feature for laptops but hurts desktop performance

bcdedit /set useplatformtick yes (Windows 8+) <br/>
Forces the clock to be backed by a platform source, no synthetic timers are allowed <br/>
Potentially better performance, lowers timer resolution to .488 instead of .5ms

**Time Stamp Counter** (TSC) (default) (bcdedit /set useplatformclock false) <br/>

TSC is reliable and will give you the lowest latency and highest fps<br/>
The HPET option in bios does not matter if this is set in cmd<br/>
The HPET option in bios should be ON to make the timer resolution more accurate 

**ACPI Power Management Timer** (PMT) (bcdedit /set useplatformclock true + HPET BIOS OFF) <br/>

PMT is a highly stable high frequency clock, it doesn't sync, because it is not set to a fixed heartbeat. It is frequency based, which means that it will never delay another tick from happening. This can eliminate the chance of having stutters.

**High Precision Event Timer** (HPET) (bcdedit /set useplatformclock true + HPET BIOS ON) <br/>

HPET is highly stable high frequency clock, but it is programmed to be synced tightly, since it is set to tick every x amount of time, regardless of hardware configuration. HPET would be good if all cores ticked at the exact same speed and were naturally synced, but that is something that rarely ever happens which is why it is bad for so many people. HPET is a hardware based, synthetic timer, windows made it for debugging purposes and most of the time almost everytime it shouldnt be used.
High frequency clocks like HPET may potentially allow for smoother gameplay and better sync at the expense of latency. <br/>

Different Windows versions (7/8/8.1/10) all have different ways of using the TSC <br/>
Some motherboards have no option to disable HPET, if you are advanced there is custom bios.

**Install SetTimerResolutionService**

This service increases the resolution of the Windows kernel timer, which will significantly lower latency.<br/>
Drop this file in C:/ folder, the file must be there to service work <br/>
Open command promt and paste: <br/>

`cd C:/` <br/>
`SetTimerResolutionService -install` <br/>

[Download SetTimerResolutionService](files/SetTimerResolutionService.exe)

**You can optionally use my settings, but i would love you to understand and try out what i just writed.**

`bcdedit /set useplatformclock no` <br/>
`bcdedit /set useplatformtick yes` <br/>
`bcdedit /set disabledynamictick yes` <br/>
`bcdedit /set nointegritychecks yes` <br/>
`bcdedit /set bootmenupolicy legacy` <br/>
`bcdedit /set bootux disabled` <br/>
`bcdedit /set hypervisorlaunchtype off` <br/>
`bcdedit /set nx optout` <br/>
`bcdedit /set quietboot yes` <br/>
`bcdedit /set tpmbootentropy default` <br/>
`bcdedit /set {globalsettings} custom:16000067 true` <br/>
`bcdedit /set {globalsettings} custom:16000068 true` <br/>
`bcdedit /set {globalsettings} custom:16000069 true` <br/>
`bcdedit /timeout 5` <br/>
`bcdedit /set uselegacyapicmode no` <br/>
`bcdedit /set usefirmwarepcisettings yes` <br/>
`bcdedit /set tscsyncpolicy Legacy` <br/>
`bcdedit /set x2apicpolicy enable` <br/>

This is my current settings and with HPET BIOS OFF <br/>
If you see stutterings, you need to figure out better settings.

## MSI-Mode

MSI is Message Signaled-Based Interrupts, a faster and better method that replaces Windows Line-Based interrupt mode. <br/>
Some drivers default to using legacy pin-triggered interrupts, which are now emulated and are slower than using MSI.

**Only set sata if you have sure its compatible, if you set it wrong you will BSOD** <br/>

![MSI](/img/msi1.png)<br/>

Changing the values of PCI ISA Bridge and PCI CPU Host with the Interrupt Affinity Policy tool will make them appear in the list if you want. Simple set and unset affinities, most of the time messing with this should be minimal changes for best results.

[Download MSI-mode utility v2](http://www.mediafire.com/file/2kkkvko7e75opce/MSI_util_v2.zip/file) <br/>
[*Read more Windows Line Based vs MSI Based.*](https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044/)

## Affinity Policy Tool

This tool sets affinity for a driver’s interrupts, <br/>
Using only one CPU affinity for usb and gpu can yield improvements in performance and responsiveness

**Mouse device and correspondent USB controler/hub to one single CPU (I use CPU1)** <br/>
**GPU and correspondent PCI to a different one single CPU (I use CPU3)**

![AFF](/img/affy.png)<br/>

![AFF](/img/affy2.png)<br/>

[Download Affinity Policy Tool](https://download.microsoft.com/download/9/2/0/9200a84d-6c21-4226-9922-57ef1dae939e/interrupt_affinity_policy_tool.msi)

##  Process Scheduling

New info by Nimble:
Calypto's guide is written based on mouse interrupts being a background process
Thus no foreground boost, but from what I gather its the other way around. That mouse or keyboard determines what is the foreground, and then boost value determines how much more priority that thread gets
Which if its a game that uses raw input, the game gets boosted shunning background processes, while polling through raw input with higher priority, thus taking further mouse input over other background processes
So the one for smoothness(as he writes), would also be the best for input, on the condition that program is in exclusive fullscreen and using rawinput (not direct input)

What is Win32Priority:

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

**Try to understand the values, try to test the values, choose your desired value.**<br/>
I will no more recommend a single value, i can barely feel difference, tests in latency barely prove anything.<br/>
But seems like those values are the ones people like more: 42, 37, 26, 22, 16 <br/>
I actually prefer those values: 22dec/26dec

**To set Win32PrioritySeparation to 22 Decimal (16 Hex), paste this to Command Promt:**

`reg add "hklm\system\controlset001\control\prioritycontrol" /v win32priorityseparation /t reg_dword /d 00000022 /f`

[*Read more about Process Scheduling and Win32PrioritySeparation*](http://recoverymonkey.org/2007/08/17/processor-scheduling-and-quanta-in-windows-and-a-bit-about-unixlinux/)

##  Power Options

Credit goes to n1kobg who writed this program to merge a good power plan: <br/>
What it does: Disable wake timers, USB Suspend setting, Controls CPU Idle, Disable Power Savings and more. <br/>

![p](/img/pplans.png)

[Download Import Xtreme Performance.exe](files/Import%20Xtreme%20Performance.exe)

###  Device Clean Up Tool

This is a usefull utility to remove detached/ghost devices, very safe to do.

![wake](/img/devicecleanup.png)

[Download Device Clean Up Tool](https://www.uwe-sieber.de/files/devicecleanup.zip)

##   Services

[Download Services Tweak for Windows 7 REWORKED SOON]() <br/>
[Download Services Tweak for Windows 8.1 REWORKED SOON]() <br/>
[Download Services Tweak for Windows 10 REWORKED SOON]()

##   BIOS

This is very important for your system, make sure to check every setting <br/>

**Must do:**

Disable C-State (CPU Enhanced Halt (C1E), C3, C6, C7, C8)<br/>
Disable Intel (R) Speed Shift Technology<br/>
Disable CPU Enhanced Intel Speedstep Technology (EIST) Function<br/>
Disable any Active State Power Management (ASPM)/Aggressive Link Power Management (ALPM) settings<br/>
Disable OnBoard Video, Audio or Lan Controller if you have a PCI/USB one that is or will be installed.<br/>
Disable Platform Power Management<br/>
Disable Legacy USB Support, Port 60/64 Emulation<br/>
Disable any onboard LED traces/lightsEnable Turbo Boost<br/>
Enable XMP<br/>
Set any Fast Boot Settings to OFF<br/>
Set your PCI Express Max Link Speed to Gen3<br/>

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

Stable overclocks increase system performance and decrease latency,<br/>
BIOS for CPU and RAM oc, Afterburner/Inspector for GPU oc <br/>
Test stability with: <br/>
[Download OCCT 5.4.2](https://www.ocbase.com/download.php) <br/>
[Download MEMTest64](https://drive.google.com/file/d/12ga7LsEogbp8yQIUhPKRHTmxNh8fFS5s/view?usp=sharing)

##   Unpark Cores

Core parking allows an operating system to completely shut off a core,<br/>
so that it no longer performs any function, and draws little to no power.<br/>
This is a power saving feature and should be disabled

[Download Unpark CPU App](https://mega.nz/#!zsJhhT6K!qukmF8hU7IMogt5Gm2IFV8XT0ZBLAHogjgyBqV4DKvQ)

##   Bat Tweaks

**Note:** I would love you to read the file first before using it, its open-source and easy to check what he will do.<br/>
It contains: Network and adapter tweaks, memory tweaks, gpu tweaks, some hosts block and misc stuff <br/>
**Works for all Windows Versions:**

[Download Bat Tweaks.bat](files/compilation.bat)

##   NVIDIA settings

**Uninstall current driver with DisplayDriverUninstaller(DDU)** <br/>
**You should use NVSlimmer with any of those drivers: 391.35 419.35 425.31 441.41 441.87 442.19**

![MSI](/img/nvid.png)

![MSI](/img/scaling.png)

Adittionally you can use Nvidia Inspector with this profile:<br/>
[Download Inspector Base Profile.nip](files/DatoBaseProfile.nip) 

##   DWM disabler

Soon <br/>

**To fix chrome window add this parameters to chrome shortcut:** <br/>
--disable-dwm-composition --disable-gpu-compositing

##   KMS activator

[KMS_VL_ALL_AIO.cmd](files/KMS_VL_ALL_AIO.cmd) 

##   Useful links

**PC/Windows Stuff** </br>
[*RevisionOS discord*](https://discord.gg/CCxWegZ) </br>
[*Calypto discord*](https://discord.gg/PfsdHaP) </br>
[*Fr33thy discord*](https://discord.gg/pTc37y7) </br>
[*n1kobg discord*](https://discord.gg/8KSHTZ3) </br>
[*UnlimitedOS discord*](https://discord.gg/KXYyq4B) </br>
[*The-Eye.eu*](https://the-eye.eu/public/MSDN/) </br>
[*PrivacyTools.io*](https://www.privacytools.io) </br>
[*CHEF-KOCH github*](https://github.com/CHEF-KOCH) </br>
[*KMS_VL_ALL github*](https://github.com/kkkgo/KMS_VL_ALL)

**Guides** </br>
[*Revision BIOS Tweaking Guide*](https://docs.google.com/document/d/1-izZaWrXaKIncYXDwmdY32YwdGCU5mDLJE6TW1Opnv8/edit) </br>
[*Hydro Device Manager Guide*](https://docs.google.com/document/d/1y9PG71osCksYZSZ2I-z4WpqMOVUu5Q4fFH0TOC29MCs/edit) </br>
[*Hydro Affinity Guide*](https://docs.google.com/document/d/1Xf7gqGE7m7aXjT1ncdoQBY1EFYroelqoKIY3UY8jVfE/edit) </br>
[*Hydro NVIDIA Panel Guide*](https://docs.google.com/document/d/1ME6wVOyB3ZIDlQFzMLNu3IrKYw8heX2rz5lA7hHmRkw/edit) </br>
[*Hydro Stripping NVIDIA Driver Guide*](https://docs.google.com/document/d/1Wm2EbUdG_qFODvS6kArCajBSzDZEvcVqSRu9bzr4KDw/edit) </br>
[*Calypto Tweak Guide*](https://docs.google.com/document/d/1c2-lUJq74wuYK1WrA_bIvgb89dUN0sj8-hO3vqmrau4/edit?usp=sharing) </br>
[*Fr33thy Youtube*](https://www.youtube.com/user/chrisfreeth/videos) </br>
[*n1kobg.blogspot.com*](http://n1kobg.blogspot.com/) </br>
[*Bunny Guides*](https://sites.google.com/view/winshit/overview)

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
[*MouseTester*](https://www.overclock.net/forum/attachment.php?attachmentid=38838&d=1455148519) </br>
[*LatencyMonitor*](https://www.resplendence.com/latencymon) </br>
[*DeviceRemover*](https://www.majorgeeks.com/files/details/device_remover_543c.html) </br>
[*NVIDIA Inspector*](https://github.com/Orbmu2k/nvidiaProfileInspector/releases) </br>
[*IO Bit Unlocker*](https://www.iobit.com/pt/iobit-unlocker.php) </br>
[*Power Run*](https://www.sordum.org/downloads/?power-run) </br>
[*DNSBenchmark*](https://www.grc.com/dns/benchmark.htm) <br/>
[*Autoruns*](https://docs.microsoft.com/en-us/sysinternals/downloads/autoruns) <br/>
[*CPU-Z + GPU-Z + HWINFO*](files/Tools.7z) </br>
[*MSI-Mode v2 + Affinity Policy Tool*](files/Tweaks.7z)

**Game Configs** </br>
[*Quake Live Config*](files/fe.7z) </br>
[*CSGO Config*](files/autoexec.cfg)
