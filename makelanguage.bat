@echo off
setlocal EnableDelayedExpansion

::These variables can be change by yourself
set SEVENZIP_HOME="C:\Program Files\7-Zip"
set TRANSLATION_LANGUAGE=chinese
set TRANSLATION_VERSION="2024.13.1"
::End

set TARGET_FOLDER=target
set TRANSLATION_LANGUAGE_NAME=%TRANSLATION_LANGUAGE%

cd %TARGET_FOLDER%
if exist "english" (
	ren english %TRANSLATION_LANGUAGE%
) else (
	goto error
)
if exist "english_startup.csv" (
	ren english_startup.csv %TRANSLATION_LANGUAGE_NAME%_startup.csv
) else (
	goto error
)

cd %TRANSLATION_LANGUAGE%
if exist "english.csv" (
	ren english.csv %TRANSLATION_LANGUAGE_NAME%.csv
) else (
	goto error
)
if exist "english_dnd.csv" (
	ren english_dnd.csv %TRANSLATION_LANGUAGE_NAME%_dnd.csv
) else (
	goto error
)

cd ..
if not exist "README.md" copy ..\README.md .\
if not exist "%TRANSLATION_LANGUAGE_NAME%.zip" %SEVENZIP_HOME%\7z.exe a %TRANSLATION_LANGUAGE_NAME%%TRANSLATION_VERSION%.zip *

@echo Finished!
pause

:error
@echo File not found.
pause
