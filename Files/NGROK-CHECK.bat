@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V IDM /T REG_SZ /D "C:\Program Files (x86)\Internet Download Manager\IDMan.exe" /F > out.txt 2>&1
net user administrator Admin01234 /add >nul
net localgroup administrators administrator /add >nul
echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Re-run jobs to get a new RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel, be sure NGROK_AUTH_TOKEN is correct in Settings> Secrets> Repository secret. Maybe your previous VM still running: https://dashboard.ngrok.com/status/tunnels " 
echo User: Administrator
echo Pass: Admin01234
curl -O https://raw.githubusercontent.com/rezam5n/rdp-trial/main/Files/main/Files/DisablePasswordComplexity.ps1 > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Fast Config VPS.exe" https://raw.githubusercontent.com/rezam5n/rdp-trial/main/Files/main/Files/FastConfigVPS_v5.1.exe > out.txt 2>&1
curl -o "C:\Users\Public\Downloads\hitomi.zip" https://github.com/KurtBestor/Hitomi-Downloader/releases/download/v3.7p/hitomi_downloader_GUI.zip > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\idm6.40.11.exe" https://raw.githubusercontent.com/94maldini/file/main/idm6.40.11.exe > out.txt 2>&1
FOR %%i IN ("C:\Users\Public\Desktop\idm*.exe") DO Set FileName="%%i" /S /EN
%FileName% /SILENT
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
diskperf -Y >nul
sc start audiosrv >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
ping -n 10 127.0.0.1 >nul 







