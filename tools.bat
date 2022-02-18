::
::@author: Mathieu MARI <contact@mathieumari.com>
::@date:   18-02-2022 11:47:10
::@lastModifiedBy:   Mathieu MARI <contact@mathieumari.com>
::@lastModifiedTime: 2022-02-18 12:14:58
::

:: Voir les couleurs ici: https://fr.wikipedia.org/wiki/Color_(commande)
color 0A

setlocal ENABLEDELAYEDEXPANSION
set dateYear=%date:~-4%

@echo off

echo Developpe par MARI Mathieu 
echo Copyright %dateYear%
PING 0 -n 2 > NUL
CLS

:: ------------------------------------------------------------------------------------------------------------ Identification
	:: -------------------------------------------------------------------- Directe
		GOTO MASTER_INSTA

:: ------------------------------------------------------------------------------------------------------------ Menu et sélection
	:: -------------------------------------------------------------------- Menu
		:MENU
			CLS
			echo // --------------------------------------------------------------------------------- Menu
			echo v  . VScode      s  . Sublime Text 3
			echo.
			goto :eof
		
	:: -------------------------------------------------------------------- Sélection
		:MENU_SELECTION
			set /p choice= _ Enter your choice:
				CLS

				if /I "%choice%"=="v" (CALL:ADD_REG "Open with VScode" "C:\Users\%username%\AppData\Local\Programs\Microsoft VS Code\code.exe")
				if /I "%choice%"=="s" (CALL:ADD_REG "Open with Sublime Text 3" "C:\Program Files\Sublime Text 3\sublime_text.exe")

			goto :eof

:: ------------------------------------------------------------------------------------------------------------ Appel des fx
	:: --------------------------------------------------------------------
		:MASTER_INSTA
			:: ------------------------------------ Appel des fx
				CALL:MENU
				CALL:MENU_SELECTION
				
			call tools.bat
			goto :eof

	:: -------------------------------------------------------------------- Ajout de la clé de registre dans la base de registre
		:ADD_REG
			set programTitle=%~1
			set programFullPath=%~2
			::echo %programTitle% && echo %programFullPath% && pause && exit

			:: Add for folders
			@reg add "HKEY_CLASSES_ROOT\Folder\shell\%programTitle%"         /t REG_SZ /v "" /d "%programTitle%" /f
			@reg add "HKEY_CLASSES_ROOT\Folder\shell\%programTitle%"         /t REG_EXPAND_SZ /v "Icon" /d "%programFullPath%,0" /f
			@reg add "HKEY_CLASSES_ROOT\Folder\shell\%programTitle%\command" /t REG_SZ /v "" /d "%programFullPath% \"%%1\"" /f
			pause

			CLS
			goto :eof