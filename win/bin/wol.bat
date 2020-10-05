@echo off
curl -s -d dev=P20003 -d mac=E4:54:E8:71:B6:66 -d task=send http://192.168.101.22/index.php -o NUL -w %%{http_code}\n
pause
