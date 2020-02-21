# Felipe#8581 at discord [![GamingTweaks](https://img.shields.io/badge/support-me-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=53DKRDTP43ZAG&source=url)
Uma coleção de tweaks para windows<br/>
O guia eh totalmente inspirado nas comunidades de discord RevisionOS e no guia do Calypto.<br/>

*Link para compartilhar: [`https://git.io/JvfJ6`](https://git.io/JvfJ6)*

*Leia em outras linguas: [English](README.md), Portuguese.*

**Nota:** Alguma poucas coisas sao protegidas pelo administrador e pelo windows, como por exemplo desativar o servico de Scheduler, o melhor e mais facil metodo de fazer tudo funcionar seria usar o Safe Mode.

## Conteudo da Pagina

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
 - [Compilacao de Bat Tweaks](#bat-tweaks)
 - [Configuracao NVIDIA](#nvidia-settings)
 - [Desativador DWM](#dwm-disabler-currently-only-for-windows-81)
 - [Links Uteis](#useful-links)

## Custom ISOs
Eh um passo muito importante, vai fazer metade do servico para voce, escolha seu ISO bem. Removendo e stripando demais o sistema pode causar mais problemas e incompatibilidades do que aumentando a performance e velocidade. Eu confio cegamente nas duas comunidades de isos customs que recomendo, porque eles tem muita experiencia.

[Windows 7 by Evolve 4.0.iso](https://drive.google.com/file/d/1ufV_hS9_KhgBsK78K2p9Vwc-zedVi53Z/view?usp=sharing) <br/>
[*Learn more about them in Evolve discord*](https://discordapp.com/invite/bkXwSNJ)<br/>

[Windows 8.1 by UnifyOS 0.9.1 BETA.iso](https://e312ee1-my.sharepoint.com/personal/ms11_365-tl_club/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fms11%5F365%2Dtl%5Fclub%2FDocuments%2FRevision%2FISO%2FUnifyOS%5FBeta%2FUnifyOS%5F0%2E9%2E1%5FBeta%5Fx64%2Eiso&parent=%2Fpersonal%2Fms11%5F365%2Dtl%5Fclub%2FDocuments%2FRevision%2FISO%2FUnifyOS%5FBeta&originalPath=aHR0cHM6Ly9lMzEyZWUxLW15LnNoYXJlcG9pbnQuY29tLzp1Oi9nL3BlcnNvbmFsL21zMTFfMzY1LXRsX2NsdWIvRVF5VTRIbDd2cEZCbDZQZHdYSFJxRWdCNVowYmE4X2gwdlVTcUhMUEJVdjYwdz9ydGltZT1LOUZJN1ZPMjEwZw) <br/>

[Windows 10 by Revision 1809 S1.8.iso](https://drive.google.com/file/d/1Q_Rzwbdx5qCPnQqDARtn41j7c8Y2AQPy/view?usp=sharing) <br/>
[*Learn more about them in Revision discord*](https://discordapp.com/invite/CCxWegZ)

**Nota:** Instalando o windows em MBR ou GPT pode trazer um feeling diferente nos jogos. Experimente entre essas duas opcoes.<br/>
DWM (Desktop Window Manager) foi provado ser ruim in todos os cenarios, voce deve remove-lo em qualquer versao de windows que for usar.<br/>
Windows 7 eh o melhor em performance, mas voce pode inteligentemente escolher, experimentar e melhorar as novas versoes tambem.<br/>

## Windows Timers

Timers do windows sao um topico muito complexo. Existem diversos tipos e os resultados variam.
Para desfazer um comando em BCDEdit, escreva bcdedit /deletevalue X (onde X estaria o nome do comando, como useplatformclock por exemplo)

bcdedit /set disabledynamictick yes (Windows 8+) <br/>
Este comando forca o timer de kernel para ser chamado constantemente ao invez de esperar por chamadas; dynamic tick foi implementado como uma opcao de salvar forca para laptops mas prejudica a performance.

bcdedit /set useplatformtick yes (Windows 8+) <br/>
Diminui a resolucao do timer para .488 ao invez de .5ms<br/>
Potencialmente melhorando a performance

**Time Stamp Counter** (TSC) (default) (bcdedit /set useplatformclock false) <br/>

TSC eh confiavel e bem usavel, colocaria mais informacoes depois.

**ACPI Power Management Timer** (PMT) (bcdedit /set useplatformclock true + HPET BIOS OFF) <br/>

PMT eh bem estavel, e possue uma frequencia de clock alta, ele nao precisa estar sincronizado. Como ele eh baseado em frequencia, isso quer dizer que ele nunca espera um delay para o seu tick de timer acontecer.

**High Precision Event Timer** (HPET) (bcdedit /set useplatformclock true + HPET BIOS ON) <br/>

HPET tambem eh altamente estavel, mas ele eh programado para sincronizar em timing exatos e curtos, e como ele eh chamado a cada x periodo de tempo, nem sempre ele consegue sincronizar corretamente, que eh o motivo do porque ele eh tao ruim para tanta gente.

Diferentes versoes de windows (7/8/8.1/10) tem suas formas diferentes de utilizar o TSC<br/>
Alguma placa maes nao tem opcao de desativar HPET, se vc eh um usuario avancado podera procurar uma bios custom.

**Install SetTimerResolutionService**

Esse servico aumenta a resolucao do timer kernel do windows, que ira melhorar sua latencia.<br/>
Arraste este arquivo para a pasta C:/, o arquivo deve ficar la para o servico funcionar
Abra o command promt e cole:

`cd C:/` <br/>
`SetTimerResolutionService -install` <br/>

[Download SetTimerResolutionService](files/SetTimerResolutionService.exe)

**Voce pode tambem utilizar minhas configuracoes atuais, mas eu adoraria que voce entendesse antes e escolhesse voce mesmo.**

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

Essas sao minhas configuracoes atuais com HPET na bios OFF.<br/>
Se vc esta sofrendo com stuttering(travadas), vc tem que escolher configuracoes melhores.

## MSI-Mode

MSI (Message Signaled-Based Interrupts), um metodo mais facil e melhor que o default do windows Line-Based interrupt mode.<br/>

**Apenas coloque seu sata em MSI se vc tem certeza que ele eh compativel, porque se estiver errado podera levar BSOD.** <br/>

![MSI](/img/msi1.png)<br/>

[Download MSI-mode utility v2](http://www.mediafire.com/file/2kkkvko7e75opce/MSI_util_v2.zip/file) <br/>
[*Leia mais sobre Windows Line Based vs MSI Based.*](https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044/)

## Affinity Policy Tool

Este programa define afinidades para os interrupts de drivers,<br/>
Utilizar apenas um CPU afinidade para o USB e outro para a GPU, ira te trazer melhoria em performance e responsividade.

**Mouse device e correspondente USB controler/hub para apenas um CPU (Eu uso CPU1)** <br/>
**GPU e correspondente PCI para outro apenas um CPU (Eu uso CPU3)**

![AFF](/img/affy.png)<br/>

![AFF](/img/affy2.png)<br/>

[Download Affinity Policy Tool](https://download.microsoft.com/download/9/2/0/9200a84d-6c21-4226-9922-57ef1dae939e/interrupt_affinity_policy_tool.msi)

##  Process Scheduling

Novas informações de Nimble:
O guia do Calypto é escrito com base nas interrupções do mouse, sendo um processo em segundo plano
Portanto, nenhum impulso em primeiro plano, mas pelo que eu entendo é o contrário. Esse mouse ou teclado determina qual é o primeiro plano e, em seguida, o valor de aumento determina quanto mais prioridade esse segmento recebe
Que, se for um jogo que usa entrada bruta, o jogo é aprimorado, evitando processos de segundo plano, enquanto pesquisa entradas brutas com maior prioridade, levando assim mais entrada do mouse sobre outros processos de segundo plano
Portanto, o de suavidade (como ele escreve) também seria o melhor para a entrada, com a condição de que o programa esteja em tela cheia exclusiva e use a entrada bruta (não a entrada direta)

O que eh Win32Priority:

é a quantidade de tempo que o agendador de processos do Windows aloca para um programa. O quantum curto melhorará a capacidade de resposta às custas de mais alternância de contexto ou alternância de tarefas, o que é computacionalmente caro. O quantum longo melhorará o desempenho dos programas em detrimento da menor capacidade de resposta. Por que você quer quantum longo, então? Bem, minimiza a alternância de contexto e tornará o jogo mais suave, resultando em melhor consistência ao apontar. No entanto, quantum curto poderia potencialmente diminuir o atraso de entrada, o que também melhoraria a consistência. Quanto maior o impulso, melhor será o FPS e a suavidade, mas você poderá enfrentar uma resposta de entrada degradada com alto impulso. Geralmente, o quantum longo resulta em melhor suavidade, mas a resposta do mouse é ligeiramente degradada, enquanto o oposto é verdadeiro para o quantum curto.<br/>

**42 decimal** = Curto, fixo, 3:1 Boost. 2A Hex <br/>
**41 decimal** = Curto, fixo, 2:1 Boost. 29 Hex <br/>
**40 decimal** = Curto, Fixo, 1:1 Boost. 28 Hex <br/>
**38 decimal** = Curto, variável, 3:1 Boost. 26 Hex <br/>
**37 decimal** = Curto, variável, 2:1 Boost. 25 Hex <br/>
**36 decimal** = Curto, Variável, 1:1 Boost. 24 Hex <br/>
**26 decimal** = Longo, fixo, 3:1 Boost. 1A Hex <br/>
**25 decimal** = Longo, fixo, 2:1 Boost. 19 Hex <br/>
**24 decimal** = Longo, fixo, 1:1 Boost. 18 Hex <br/>
**22 decimal** = Longo, variável, 3:1 Boost. 16 Hex <br/>
**21 decimal** = Longo, variável, 2:1 Boost. 15 Hex <br/>
**20 decimal** = Longo, variável, 1:1 Boost. 14 Hex <br/>

![w](/img/w32.png)

** Tente entender os valores, tente testar os valores, escolha o valor desejado. ** <br/>
Não vou mais recomendar um único valor, mal consigo sentir diferença, testes de latência quase não provam nada. <br/>
Mas parece que esses valores são os que as pessoas mais gostam: 42, 37, 26, 22, 16 <br/>

** Para definir Win32PrioritySeparation como 22 decimal (16 hex), cole-o no prompt de comando: **

`reg add "hklm\system\controlset001\control\prioritycontrol" /v win32priorityseparation /t reg_dword /d 00000022 /f`

[*Leia mais sobre Process Scheduling e Win32PrioritySeparation*](http://recoverymonkey.org/2007/08/17/processor-scheduling-and-quanta-in-windows-and-a-bit-about-unixlinux/)

##  Power Options

Editei o Balanced and Performance normal e adicionei o Bitsum como opção opcional: <br/>
Desative os despertadores, a configuração USB Suspend, controla a ociosidade da CPU, desative a economia de energia e muito mais. <br/>

![p](/img/pplans.png)

[Download Power Plans](files/power.bat)

###  Device Clean Up Tool

Este é um utilitário útil para remover dispositivos desconectados / fantasmas, muito seguro de fazer.

![wake](/img/devicecleanup.png)

[Download Device Clean Up Tool](https://www.uwe-sieber.de/files/devicecleanup.zip)

##   Services

[Download Services Tweak for Windows 7](files/7services.bat) <br/>
[Download Services Tweak for Windows 8.1](files/8services.bat) <br/>
[Download Services Tweak for Windows 10](files/services10.bat)

##   BIOS

Isso é muito importante para o seu sistema, verifique todas as configurações <br/>

**Remova todas as proteções e economia de energia, permita desempenho / potência máximos** <br/>

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

Overclocks estáveis aumentam o desempenho do sistema e diminuem a latência, <br/>
BIOS para CPU e RAM oc, Afterburner / Inspector para GPU oc <br/>
Teste a estabilidade com: <br/>
[Download OCCT 5.4.2](https://www.ocbase.com/download.php) <br/>
[Download MEMTest64](https://drive.google.com/file/d/12ga7LsEogbp8yQIUhPKRHTmxNh8fFS5s/view?usp=sharing)

##   Unpark Cores

O unparking de cores permite que um sistema operacional desligue completamente um núcleo, <br/>
para que ele não desempenhe mais nenhuma função e consuma pouco ou nenhum poder. <br/>
Esse é um recurso de economia de energia e deve ser unparked.

[Download Unpark CPU App](https://mega.nz/#!zsJhhT6K!qukmF8hU7IMogt5Gm2IFV8XT0ZBLAHogjgyBqV4DKvQ)

##   Bat Tweaks

**Nota:** Eu adoraria que você lesse o arquivo antes de usá-lo, é de código aberto e fácil de verificar o que ele fará. <br/>
Ele contém: ajustes de rede e adaptador, ajustes de memória, ajustes de GPU, alguns hosts bloqueiam e coisas variadas <br/>
**Funciona para todas as versões do Windows:**

[Download Bat Tweaks.bat](files/compilation.bat)

##   Configurações NVIDIA

**Desinstale o driver atual com o DisplayDriverUninstaller (DDU)** <br/>
**Você deve usar o NVSlimmer com qualquer um desses drivers: 391,35 419,35 425,31 441,41 441,87 442,19**

[Download Windows 7/8.1 NVSlimmed 442.19](https://drive.google.com/file/d/18WbJKdcva93n0yN4i4EFET93amdfRYBS/view?usp=sharing) <br/>
[Download Windows 10 NVSlimmed 442.19](https://drive.google.com/file/d/1DZL94aXoFoOYlQmzb4HWn9yhAkn6LFwH/view?usp=sharing)

![MSI](/img/nvid.png)

![MSI](/img/scaling.png)

Além disso, você pode usar o Nvidia Inspector com este perfil: <br/>
[Download Inspector Base Profile.nip](files/DatoBaseProfile.nip) 

##   Desativador DWM (Apenas para Windows 8.1)

Este .bat excluirá os arquivos do sistema e desabilitará o Desktop Window Manager, <br/>
É opcional e só é realmente necessário se você jogar no modo de janela. <br/>
[Download DWMdisablerBYdreamjow.bat](files/DWMdisablerBYdreamjow.bat)

**Para corrigir a janela do Chrome, adicione esses parâmetros ao atalho do Chrome:** <br/>
--disable-dwm-composition --disable-gpu-compositing

##   Links Uteis

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
