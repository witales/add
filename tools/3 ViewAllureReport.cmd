@rem @echo allure.bat must be in the PATH
call allure generate --clean %~dp0..\ServiceBases\allurereport\8310UF
call allure open
