cd %~dp0
if "%JAVA_HOME%"=="" set JAVA_HOME=c:\Program Files\Java\jre1.8.0_144
if "%KEYSTORE%"=="" set KEYSTORE=%JAVA_HOME%\lib\security\cacerts
echo Importing LetsEncrypt root cert into %KEYSTORE% >> run.log
for %%i in (*.der) do "%JAVA_HOME%\bin\keytool" -import -trustcacerts -keystore "%KEYSTORE%" -storepass changeit -noprompt -alias %%~ni -file %%i >> run.log
