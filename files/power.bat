powercfg -devicedisablewake "HID-compliant mouse"
powercfg -devicedisablewake "HID keyboard Device"
powercfg -devicedisablewake "Intel(R) Ethernet Connection (2) I218-V"
powercfg -attributes SUB_PROCESSOR 5d76a2ca-e8c0-402f-a133-2158492d58ad -ATTRIB_HIDE
powercfg -setactive "77777777-7777-7777-7777-777777777777"
powercfg -h off
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