C:

REM PhpStorm:

FOR /F "tokens=*" %%i IN (' dir /b /A %HOMEPATH%\.PhpStorm* ') DO SET PHPSTORM_DIR=%HOMEPATH%\%%i
cd %PHPSTORM_DIR%
del config\options\other.xml
del config\eval\*.evaluation.key
reg delete "HKEY_CURRENT_USER\SOFTWARE\JavaSoft\Prefs\jetbrains\phpstorm" /f

FOR /F "tokens=*" %%i IN (' dir /b /A %APPDATA%\JetBrains\PhpStorm* ') DO SET PHPSTORM_DIR=%APPDATA%\JetBrains\%%i
cd %PHPSTORM_DIR%
del options\other.xml
del eval\*.evaluation.key

REM PyCharm:

FOR /F "tokens=*" %%i IN (' dir /b /A %HOMEPATH%\.PyCharm* ') DO SET PYCHARM_DIR=%HOMEPATH%\%%i
cd %PYCHARM_DIR%
del config\options\other.xml
del config\eval\*.evaluation.key
reg delete "HKEY_CURRENT_USER\SOFTWARE\JavaSoft\Prefs\jetbrains\pycharm" /f

FOR /F "tokens=*" %%i IN (' dir /b /A %APPDATA%\JetBrains\PyCharm* ') DO SET PYCHARM_DIR=%APPDATA%\JetBrains\%%i
cd %PYCHARM_DIR%
del options\other.xml
del eval\*.evaluation.key

REM CLion:

FOR /F "tokens=*" %%i IN (' dir /b /A %HOMEPATH%\.CLion* ') DO SET CLION_DIR=%HOMEPATH%\%%i
cd %CLION_DIR%
del config\options\other.xml
del config\eval\*.evaluation.key
reg delete "HKEY_CURRENT_USER\SOFTWARE\JavaSoft\Prefs\jetbrains\clion" /f

FOR /F "tokens=*" %%i IN (' dir /b /A %APPDATA%\JetBrains\CLion* ') DO SET CLION_DIR=%APPDATA%\JetBrains\%%i
cd %CLION_DIR%
del options\other.xml
del eval\*.evaluation.key

REM IntelliJ:

FOR /F "tokens=*" %%i IN (' dir /b /A %HOMEPATH%\.IntelliJIdea* ') DO SET INTELLIJ_DIR=%HOMEPATH%\%%i
cd %INTELLIJ_DIR%
del config\options\other.xml
del config\eval\*.evaluation.key
reg delete "HKEY_CURRENT_USER\SOFTWARE\JavaSoft\Prefs\jetbrains\idea" /f

FOR /F "tokens=*" %%i IN (' dir /b /A %APPDATA%\JetBrains\IntelliJIdea* ') DO SET INTELLIJ_DIR=%APPDATA%\JetBrains\%%i
cd %INTELLIJ_DIR%
del options\other.xml
del eval\*.evaluation.key

pause
