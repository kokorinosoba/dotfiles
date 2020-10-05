@echo off

for /f "usebackq tokens=*" %%A in (`curl -siL -d mac=E4:54:E8:71:B6:66 -d task=send http://192.168.101.22/index.php`) do (
  set HEAD=%%A
  goto :exit_for
)

:exit_for
echo %HEAD%

pause
