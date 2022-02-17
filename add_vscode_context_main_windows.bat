::
::@author: Mathieu MARI <contact@mathieumari.com>
::@date:   17-02-2022 10:42:57
::@lastModifiedBy:   Mathieu MARI <contact@mathieumari.com>
::@lastModifiedTime: 2022-02-17 11:36:44
::

@echo off

:: ---------------------------------------------------------------------------------------------------------------- Touch
SET programTitle=Open with VScode
SET programFullPath=C:\Users\%username%\AppData\Local\Programs\Microsoft VS Code\code.exe

:: ---------------------------------------------------------------------------------------------------------------- Don't touch
:: Add for folders
@reg add "HKEY_CLASSES_ROOT\Folder\shell\%programTitle%"         /t REG_SZ /v "" /d "%programTitle%" /f
@reg add "HKEY_CLASSES_ROOT\Folder\shell\%programTitle%"         /t REG_EXPAND_SZ /v "Icon" /d "%programFullPath%,0" /f
@reg add "HKEY_CLASSES_ROOT\Folder\shell\%programTitle%\command" /t REG_SZ /v "" /d "%programFullPath% \"%%1\"" /f
pause