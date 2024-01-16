# shellcheck shell=bash

alias powershell='/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe'
alias fixdns='powershell -Command "Get-DnsClientServerAddress -AddressFamily IPv4 | Select-Object -ExpandProperty ServerAddresses" | tac | sed "s/^/nameserver /" | dos2unix | sudo tee /etc/resolv.conf'
alias ssh_restart='sudo service ssh --full-restart'
alias fixclock='sudo ntpdate time.windows.com'
