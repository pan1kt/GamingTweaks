reg add "hklm\system\currentcontrolset\control\class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "perflevelsrc" /t reg_dword /d "0x00002222" /f
reg add "hklm\system\currentcontrolset\control\class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "powermizerenable" /t reg_dword /d "00000001" /f
reg add "hklm\system\currentcontrolset\control\class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "powermizerlevel" /t reg_dword /d "00000001" /f
reg add "hklm\system\currentcontrolset\control\class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "powermizerlevelac" /t reg_dword /d "00000001" /f
reg add "hklm\system\currentcontrolset\control\class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "enablecoreslowdown" /t reg_dword /d "00000000" /f
reg add "hklm\system\currentcontrolset\control\class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "enablemclkslowdown" /t reg_dword /d "00000000" /f
reg add "hklm\system\currentcontrolset\control\class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "enablenvclkslowdown" /t reg_dword /d "00000000" /f