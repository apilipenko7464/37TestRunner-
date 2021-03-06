@ECHO OFF
::========================================
SET GITHUB_ACCOUNT=apilipenko7464
SET WS_DIR=git_forTestRunner
SET REPO_NAME=36Title_Validation_CSV
SET APP_VERSION=1.2
SET MAIN_CLASS=core.Selenium_csv
SET ARGS_01=
::========================================
 
::========================================
::SET GITHUB_ACCOUNT=%1
::SET WS_DIR=%2
::SET REPO_NAME=%3
::SET APP_VERSION=%4
::SET MAIN_CLASS=%5
::SET ARGS_01=%6
::========================================
 
IF "%JAVA_HOME%" == "" GOTO EXIT_JAVA
ECHO Java installed
IF "%M2%" == "" GOTO EXIT_MVN
ECHO Maven installed
CALL git --version > nul 2>&1
IF NOT %ERRORLEVEL% == 0 GOTO EXIT_GIT
ECHO Git installed
 
GOTO NEXT
 
:NEXT
IF NOT EXIST C:\%WS_DIR% GOTO NO_WORKSPACE
IF EXIST C:\%WS_DIR%\%REPO_NAME% RMDIR /S /Q C:\%WS_DIR%\%REPO_NAME%
CD C:\%WS_DIR%
git clone https://github.com/%GITHUB_ACCOUNT%/%REPO_NAME%.git
CD %REPO_NAME%
SLEEP 2
CALL mvn package -Dbuild.version="%APP_VERSION%" -DmainClass="%MAIN_CLASS%"
::CALL mvn package -Dbuild.version="1.1" -DmainClass="core.Selenium_csv"
::  mvn package -Dbuild.version="1.1" -DmainClass="core.Selenium_csv"
ECHO.
ECHO Executing Java programm ...
java -jar C:\%WS_DIR%\%REPO_NAME%\target\%REPO_NAME%-%APP_VERSION%-jar-with-dependencies.jar %ARG_01%
::java -cp C:\%WS_DIR%\%REPO_NAME%\target\%REPO_NAME%-%APP_VERSION%.-jar-with-dependencies.jar %MAIN_CLASS% %ARG_01%
::java -cp C:\%WS_DIR%\%REPO_NAME%\target\%REPO_NAME%-%APP_VERSION%.jar %MAIN_CLASS% %ARG_01%
::C:\git\36Title_Validation_CSV>java -jar ./target/36Title_Validation_CSV-1.1-jar-with-dependencies.jar
GOTO END
 
:EXIT_JAVA
ECHO No Java installed
GOTO END
:EXIT_MVN
ECHO No Maven installed
GOTO END
:EXIT_GIT
ECHO No Git installed
GOTO END
:NO_WORKSPACE
ECHO %WS_DIR% is not exists
GOTO END
:END
CD\


::[with arguments] C:\>run.bat smith Workspace Sinlge_Title_Validation 1.1 core.App
::C:\>run.bat
::Java installed
::Maven installed
::Git installed
::Cloning into 'Sinlge_Title_Validation'...
------------------
::Executing Java programm ...
::Hello World!