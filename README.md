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
 - [Power Options](#powerplan)
 - [Device Remover](#devices)
 - [Services.msc](#services)
 - [BIOS](#bios)
 - [Overclocks](#overclocks)
 - [Extras](#extras)

### Custom ISOs
This is such a important move, TL;DR this will make `50%` of work done. This is also hard to do professionally, so choose your ISO wisely. Removing/stripping too much cause more issues and incompatibility and doesnt help with performance or speed.

[ISO for Windows 7 by unlimitedOSgang](link)

[ISO for Windows 8.1 by me](link)

[ISOs for Windows 10 by Revision](https://sites.google.com/view/meetrevision/revios/download?authuser=0) <br/>
[*Learn more about them in Revision discord/community.*](https://discordapp.com/invite/CCxWegZ)

Extra: 

Installing them in either MBR or GPT doesnt make a difference, or shouldnt make it. Dont worry about this. <br/>
If you play games at fullscreen windowed mode, use Windows 7 or you will have to deal with problems in performance. <br/>
Windows 7 is by far the best for performance even in 2020, but theres much more to care about, also user preference. <br/>

### Windows Timers
All windows versions `1809+` have a forced synthetic QPC timer of 10mhz. Previous versions are true TSC between `2-4mhz` (give or take) depending on the CPU speed. As far as low latency and high performance, an older version under 1809 is the way to go. It is commonly recommended to either go Windows 7 or 8.1 if you dont have compatibility issues, or using 1709 Windows 10.

Windows 1809 or later "qpc timer" <br/>
![1](https://github.com/Felipe8581/GamingTweaks/blob/master/img/qpc1.png) 

Windows 1803 or earlier "qpc timer" <br/>
![2](https://github.com/Felipe8581/GamingTweaks/blob/master/img/qpc2.png)

Using BCDEDIT commands you can try all those timers: TSC / TSC+LAPIC Backup / TSC+HPET Backup / HPET

But its commonly recommended that you stay on TSC, with HPET enabled on BIOS.

You can try see if your system is different from others and works best on HPET disabled on BIOS, but wont be most likely.

#### For best configuration, use this in Command Promt:

`bcdedit /set disabledynamictick true` <br/>
`bcdedit /set useplatformclock false` <br/>
`bcdedit /set useplatformtick false` <br/>

#### You can optionally add those commands too for system improvement,

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
`bcdedit /set disabledynamictick yes` <br/>
`bcdedit /set uselegacyapicmode no` <br/>
`bcdedit /set usefirmwarepcisettings no` <br/>
`bcdedit /set tscsyncpolicy Legacy` <br/>
`bcdedit /set x2apicpolicy enable` <br/>

### MSI-Mode

MSI is Message Signaled-Based Interrupts, a faster and better method that replaces Windows Line-Based interrupt mode.

TL;DR it makes your devices "faster" and improve latencys, better explanation soon.

#### Set everything that is not a "problematic" Sata into MSI-Mode

![MSI](/img/msi1.png)<br/>

Extra: Old Sata drivers usually doesnt support MSI, check if your Sata and sata driver is compatible. If you do this wrong you BSOD. <br/>
Extra2: You need to Affinity tool in PCI ISA Bridge and PCI CPU Host to make they appear in the list if you want.

[*Read more Windows Line Based vs MSI Based.*](https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044/)

[*Download MSI-mode utility v2.*](http://www.mediafire.com/file/2kkkvko7e75opce/MSI_util_v2.zip/file)

### Affinity Policy Tool

This is extremely important for input devices, 

#### Set Mouse device and correspondent USB controler/hub to one single CPU (I use CPU1)  <br/>
#### GPU and correspondent PCI to another single CPU (I use CPU3) <br/>

![AFF](/img/aff1.png)<br/>

[*Download Affinity Policy Tool.*](https://download.microsoft.com/download/9/2/0/9200a84d-6c21-4226-9922-57ef1dae939e/interrupt_affinity_policy_tool.msi)

###  Process Scheduling

TL;DR of what is Win32Priority:

`is the amount of time the Windows process scheduler allocates to a program. Short quantum will improve responsiveness at the expense of more context switching, or switching between tasks, which is computationally expensive. Long quantum will improve performance of programs at the expense of lower responsiveness. Why would you want long quantum, then? Well, it minimizes context switching and will make the game run smoother, resulting in better consistency when aiming. However, short quantum could potentially decrease input lag which would improve consistency as well. The higher the boost, the better the FPS and smoothness will be, but you may experience degraded input response with high boost. Generally, long quantum results in better smoothness but slightly degraded mouse response, whereas the opposite is true for short quantum.` <br/>

`2A Hex = Short, Fixed , High foreground boost.` <br/>
`29 Hex = Short, Fixed , Medium foreground boost.` <br/>
`28 Hex = Short, Fixed , No foreground boost.` <br/>
`26 Hex = Short, Variable , High foreground boost.` <br/>
`25 Hex = Short, Variable , Medium foreground boost.` <br/>
`24 Hex = Short, Variable , No foreground boost.` <br/>
`1A Hex = Long, Fixed, High foreground boost.` <br/>
`19 Hex = Long, Fixed, Medium foreground boost.` <br/>
`18 Hex = Long, Fixed, No foreground boost.`
#### `16 Hex = Long, Variable, High foreground boost.`
`15 Hex = Long, Variable, Medium foreground boost.` <br/>
`14 Hex = Long, Variable, No foreground boost.` <br/>

![w](/img/win32p.png)

#### I recommend 16 Hex value, but there is a mistery about if there IS a best value and what value is.<br/>

[*Read more about Process Scheduling and Win32PS.*](http://recoverymonkey.org/2007/08/17/processor-scheduling-and-quanta-in-windows-and-a-bit-about-unixlinux/)

[*Download Win32PrioritySeparation=22 Registry File.*](link)

###  Power Options

You basically want to disable power saving features and the ability to control CPU Idle On and Off.

I have a script that installs everything you need and this On/Off is based on what you choose, Power Saving or Performance.

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


For example:

```
https://github.com/rails/rails/compare/master...4-1-stable
```

![Rails branch compare example](http://i.imgur.com/tIRCOsK.png)

`{range}` can be changed to things like:

```
https://github.com/rails/rails/compare/master@{1.day.ago}...master
https://github.com/rails/rails/compare/master@{2014-10-04}...master
```

*Here, dates are in the format `YYYY-MM-DD`*

![Another compare example](http://i.imgur.com/5dtzESz.png)

Branches can also be compared in `diff` and `patch` views:

```
https://github.com/rails/rails/compare/master...4-1-stable.diff
https://github.com/rails/rails/compare/master...4-1-stable.patch
```

[*Read more about comparing commits across time.*](https://help.github.com/articles/comparing-commits-across-time/)

###  Device Remover

```
https://github.com/{user}/{repo}/compare/{foreign-user}:{branch}...{own-branch}
```

For example:

```
https://github.com/rails/rails/compare/byroot:master...master
```

![Forked branch compare](http://i.imgur.com/Q1W6qcB.png)

###   Services.msc


Add `.pibb` to the end of any Gist URL ([like this](https://gist.github.com/tiimgreen/10545817.pibb)) in order to get the *HTML-only* version suitable for embedding in any other site.

Gists can be treated as a repository so they can be cloned like any other:

```bash
$ git clone https://gist.github.com/tiimgreen/10545817
```

![Gists](http://i.imgur.com/BcFzabp.png)

This means you also can modify and push updates to Gists:

```bash
$ git commit
$ git push
Username for 'https://gist.github.com':
Password for 'https://tiimgreen@gist.github.com':
```

However, Gists do not support directories. All files need to be added to the repository root.
[*Read more about creating Gists.*](https://help.github.com/articles/creating-gists/)

###   BIOS


![Git.io](http://i.imgur.com/6JUfbcG.png?1)

You can also use it via pure HTTP using Curl:

```bash
$ curl -i http://git.io -F "url=https://github.com/..."
HTTP/1.1 201 Created
Location: http://git.io/abc123

$ curl -i http://git.io/abc123
HTTP/1.1 302 Found
Location: https://github.com/...
```

[*Read more about Git.io.*](https://github.com/blog/985-git-io-github-url-shortener)

###   Overclocks


 - Pressing `t` will bring up a file explorer.
 - Pressing `w` will bring up the branch selector.
 - Pressing `s` will focus the search field for the current repository. Pressing Backspace to delete the “This repository” pill changes the field to search all of GitHub.
 - Pressing `l` will edit labels on existing Issues.
 - Pressing `y` **when looking at a file** (e.g., `https://github.com/tiimgreen/github-cheat-sheet/blob/master/README.md`) will change your URL to one which, in effect, freezes the page you are looking at. If this code changes, you will still be able to see what you saw at that current time.

To see all of the shortcuts for the current page press `?`:

![Keyboard shortcuts](http://i.imgur.com/y5ZfNEm.png)

[Read more about search syntax you can use.](https://help.github.com/articles/search-syntax/)

###   Extras
It also works with ranges, e.g., `#L53-L60`, to select ranges, hold `shift` and click two lines:

```
https://github.com/rails/rails/blob/master/activemodel/lib/active_model.rb#L53-L60
```

![Line Highlighting](http://i.imgur.com/8AhjrCz.png)

###  TO-DO-LIST
In Issues and Pull requests check boxes can be added with the following syntax (notice the space):

```
- [ ] Be awesome
- [ ] Prepare dinner
  - [ ] Research recipe
  - [ ] Buy ingredients
  - [ ] Cook recipe
- [ ] Sleep
```

![Task List](http://i.imgur.com/jJBXhsY.png)

When they are clicked, they will be updated in the pure Markdown:

```
- [x] Be awesome
- [ ] Prepare dinner
  - [x] Research recipe
  - [x] Buy ingredients
  - [ ] Cook recipe
- [ ] Sleep
```

[*Read more about task lists.*](https://help.github.com/articles/writing-on-github/#task-lists)

#### Task Lists in Markdown Documents
In full Markdown documents **read-only** checklists can now be added using the following syntax:

```
- [ ] Mercury
- [x] Venus
- [x] Earth
  - [x] Moon
- [x] Mars
  - [ ] Deimos
  - [ ] Phobos
```

- [ ] Mercury
- [x] Venus
- [x] Earth
  - [x] Moon
- [x] Mars
  - [ ] Deimos
  - [ ] Phobos

[*Read more about task lists in markdown documents.*](https://github.com/blog/1825-task-lists-in-all-markdown-documents)
