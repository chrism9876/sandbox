$tag=($(curl.exe -s https://api.github.com/repos/mitmproxy/mitmproxy/releases/latest | select-string tag_name) -split "`"")[3]
$version=$tag -replace "[a-zA-Z]",""

curl.exe -O  "https://downloads.mitmproxy.org/$version/mitmproxy-$version-windows-x86_64-installer.exe"
