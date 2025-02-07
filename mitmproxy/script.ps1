$tag=($(curl.exe -s https://api.github.com/repos/mitmproxy/mitmproxy/releases/latest | select-string tag_name) -split "`"")[3]
$version=$tag -replace "[a-zA-Z]",""

curl.exe -O  "https://downloads.mitmproxy.org/$version/mitmproxy-$version-windows-x86_64-installer.exe"

start-process -wait .\mitmproxy-11.1.2-windows-x86_64-installer.exe -ArgumentList "--mode unattended"
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -executionpolicy bypass -File "C:\Program Files/mitmproxy\run.ps1" mitmweb
curl.exe --proxy http://127.0.0.1:8080 -O http://mitm.it/cert/cer

certutil.exe -addstore root cer