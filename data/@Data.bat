@echo off
SetLocal EnableExtensions
SetLocal EnableDelayedExpansion
set str=%date:~0,4%%date:~5,2%00
del /f Android.txt out.txt Version.txt bat.txt hbhosts.txt 1.txt hosts.txt Applenew.txt 1hosts.txt unix.txt out.txt hosts Xunlei.txt
echo title HostsX BatchVersion >bat.txt
echo more +5 %%~fs0^>%%systemroot%%\system32\drivers\etc\hosts >>bat.txt
echo notepad %%windir%%\system32\drivers\etc\hosts >>bat.txt
echo goto :eof >>bat.txt
rem call :smarhosts
echo.>Version.txt
echo ;version=%date:~0,4%%date:~5,2%%date:~8,2%%TIME:~0,2%%TIME:~3,2%>>Version.txt
rem echo ;version=%time% %date%>>Version.txt
echo ;hostsxversion=0.7.1.18>>Version.txt
echo ;author=Hostsx Contributor>>Version.txt
echo ;include=kwoktree.OrzFly.jason_jiang.Felix Hsu.linjimmy.ZephyR.atmouse.Ehosts.zhqjsh.JayXon>>Version.txt
echo ;description=Clean Safe and Useful Hosts file.Thanks EveryOne.>>Version.txt
call :Xunlei
set files=bat.txt Version.txt Rd.txt Mobile.txt Game.txt Active.txt Soft.txt SiteEN.txt SiteJP.txt SiteTW.txt SiteCN.txt Media.txt Xunlei.txt UnionEN.txt UnionRU.txt UnionJP.txt UnionCN.txt Dnt.txt Hijack.txt Hijacking.txt Virus.txt Phishing.txt Porn.txt Mwsl.txt Popups.txt
for %%a in (%files%) do (type "%%a">>HostsX.orzhosts)
ren HostsX.orzhosts Android.txt
start hosts.vbs
ping -n 5 127.0.0.1
copy hosts "%~dp0..\"
echo hosts=%date:~0,4%%date:~5,2%%date:~8,2%%TIME:~0,2%%TIME:~3,2%>"%~dp0..\Version.txt"
echo AcrylicHosts=20130331103038>>"%~dp0..\Version.txt"
echo fixlist=20130401091927>>"%~dp0..\Version.txt"
echo servers=20130331103039>>"%~dp0..\Version.txt"
echo sources=20130422160315>>"%~dp0..\Version.txt"
md "%~dp0..\OS\system\etc"
copy hosts "%~dp0..\OS\system\etc"
del /f new.txt Android.txt out.txt Version.txt bat.txt hbhosts.txt 1.txt hosts.txt Applenew.txt 1hosts.txt unix.txt out.txt hosts Xunlei.txt
echo 7z u HostsX_updates.zip system\etc\hosts >"%~dp0..\OS\7z.bat"
echo rd /s/q system >>"%~dp0..\OS\7z.bat"
echo del hosts >>"%~dp0..\OS\7z.bat"
echo del %%0 >>"%~dp0..\OS\7z.bat"
cd %~dp0..\OS
7z.bat
exit

:Xunlei
set /a str+=1
echo 0.0.0.0 %str%.biz5.sandai.net >>Xunlei.txt
echo 0.0.0.0 %str%.logic.cpm.cm.sandai.net >>Xunlei.txt
if not %str%==%date:~0,4%%date:~5,2%31 (goto Xunlei)
goto :eof

:smarhosts
wget http://smarthosts.googlecode.com/svn/trunk/hosts
ping -n 5 127.0.0.1
ren hosts 1.txt
sed -i "1,7d" 1.txt
sed -i "/Facebook End/,$d" 1.txt
sed -i "/^$/d" 1.txt
sed -i "/^#/d" 1.txt
sed -i "/googlesyndication.com/d" 1.txt
sed -i "/google-analytics.com/d" 1.txt
sed -i "/googleadservices.com/d" 1.txt
ping -n 3 127.0.0.1
sed -i "1i\#Smarthosts-Google" 1.txt
goto :eof

:mac
rem http://sourceforge.net/projects/dos2unix/
mac2unix -ascii -n Apple.txt out.txt
unix2dos -n out.txt Applenew.txt 
set files=Version.txt Rd.txt Applenew.txt Mobile.txt SiteEN.txt SiteCN.txt Media.txt Active.txt Game.txt Soft.txt UnionEN.txt UnionRU.txt UnionJP.txt UnionCN.txt Dnt.txt Hijack.txt IPBlock.txt Virus.txt Popups.txt
sed -e "s/0.0.0.0/127.0.0.1/g" hosts.txt > hosts
move /y hosts "%~dp0..\"
goto :eof

@echo off
(for /f "delims=" %%a in ('dir /s/b/a-d "%cd%"') do (
        set a=%%a
        setlocal enabledelayedexpansion
        set/p=!a! <nul
        for /f "tokens=2 delims==." %%b in ('wmic datafile where name^="!a:\=\\!" get CreationDate/value') do echo %%b
        Endlocal
))>����.txt