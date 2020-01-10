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

Extra: Installing them in either MBR or GPT doesnt make a difference, or shouldnt make it. Dont worry about this.

Extra2: If you play games at fullscreen windowed mode, use Windows 7 or you will have to deal with problems in performance.

Extra3: Windows 7 is by far the best for performance even in 2020, but theres much more to care about, also user preference.

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

TL;DR it makes your devices "faster", better explanation soon.

#### Set everything that is not a "problematic" Sata into MSI-Mode

![MSI](/img/msi1.png)<br/>

Extra: Old Sata drivers usually doesnt support MSI, check if your Sata and sata driver is compatible. If you do this wrong you BSOD.
Extra2: You need to Affinity tool in PCI ISA Bridge and PCI CPU Host to make they appear in the list if you want.

![DHH commit history](http://i.imgur.com/S7AE29b.png)

[*Read more Windows Line Based vs MSI Based.*](https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044/)

### Affinity Policy Tool
When cloning a repository the `.git` can be left off the end.

```bash
$ git clone https://github.com/tiimgreen/github-cheat-sheet
```

[*Read more about the Git `clone` command.*](http://git-scm.com/docs/git-clone)

###  Process Scheduling

If you go to the repo's [Branches](https://github.com/tiimgreen/github-cheat-sheet/branches) page, next to the Commits button:

```
https://github.com/{user}/{repo}/branches
```

... you would see a list of all branches which are not merged into the main branch.

From here you can access the compare page or delete a branch with a click of a button.

![Compare branches not merged into master in rails/rails repo - https://github.com/rails/rails/branches](http://i.imgur.com/0FEe30z.png)

####  Power Options

```
https://github.com/{user}/{repo}/compare/{range}
```

where `{range} = master...4-1-stable`

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

####  Device Remover

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
