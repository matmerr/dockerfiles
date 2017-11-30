# start VcXsrv if it is not started yet
$prog="$env:ProgramFiles\VcXsrv\vcxsrv.exe"
if (! (ps | ? {$_.path -eq $prog})) {& $prog -multiwindow -ac}

# get the IP address used by Docker for Windows
$ip=Get-NetIPAddress `
    | where {$_.InterfaceAlias -eq 'vEthernet (DockerNAT)' -and $_.AddressFamily -eq 'IPv4'} `
    | select -ExpandProperty IPAddress

# start Visual Studo Code as regular user
$workdir="/home/user/workspace"
$extpath=".vscode/extensions"
$cmd = @" 
export DISPLAY=${ip}:0; \
sudo chown -R user ../.[^.]* && \
sudo chmod +x ../shell_colors.sh &&
../shell_colors.sh && \
/usr/share/code/code -w ${workdir} --extensionHomePath ${extpath}
"@
    
docker run -d --privileged --rm `
    --init `
    --security-opt seccomp=unconfined `
    -v ${PWD}:$workdir `
    --name=code `
    --hostname=code `
    matmerr/vscode-arm-qemu `
    su - user -p -c $cmd