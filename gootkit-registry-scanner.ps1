<#

.SYNOPSIS
gootkit-registry-scanner v1.0 - Gootkit detection and removal tool
2020 by Constantin Tillmann (https://github.com/ConstantinTi)
This script helps to detect the malware Gootkit and allows you to remove the infection from the registry.

.DESCRIPTION
This script should help you to detect the malware Gootkit.
Please bear in mind, that the key names or even the location may change as this virus is evolving.
This particular scanner was able to detect various attacks of Gootkit in December 2020.
However, GootKit is known to be changed.

.EXAMPLE
./gootkit_registry_scanner.ps1 -mode investigate
This command will show all the keys in registry locations known to be affected

.EXAMPLE
./gootkit_registry_scanner.ps1 -mode inspect -key the_key_to_look_for
This command will look for a specific key in registry locations known to be affected

.EXAMPLE
./gootkit_registry_scanner.ps1 -mode eradicate -key the_key_to_delete
This command will delete a specific key in registry locations known to be affected

.LINK
https://github.com/ConstantinTi/gootkit-registry-scanner
https://blog.malwarebytes.com/threat-analysis/2020/11/german-users-targeted-with-gootkit-banker-or-revil-ransomware/

#>

Param (
    [Parameter(Mandatory=$False)]
    [string]$mode="help",

    [Parameter(Mandatory=$False)]
    [string]$key
)

New-Item -Path "output" -Name "error.log" -ItemType "file" > $null 2> $null
New-Item -Path "output" -Name "inspection.log" -ItemType "file" > $null 2> $null

Write-Host "gootkit-registry-scanner v1.0 - Gootkit detection and removal tool"
Write-Host "2020 by Constantin Tillmann (https://github.com/ConstantinTi)"

if ($mode -eq "help")
{
    Get-Help ./gootkit-registry-scanner.ps1 -Full
}

if ($mode -eq "investigate")
{
    Write-Host -NoNewline "[+] Reading HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ ... "
    reg query HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ > output/run.log
    Write-Host "done"

    Write-Host -NoNewline "[+] Reading HKEY_CURRENT_USER\SOFTWARE\ ... "
    reg query HKEY_CURRENT_USER\SOFTWARE\ > output/software.log
    Write-Host "done"

    Write-Host -NoNewline "[+] Reading HKEY_CURRENT_USER\Environment\ ... "
    reg query HKEY_CURRENT_USER\Environment\ > output/environment.log
    Write-Host "done"
    Write-Host ""
    Write-Host "[*] Check the output folder an look for keys like 'afaebbaecd' or 'aecfffcbaca'"
}

if ($mode -eq "inspect")
{
    reg query HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ /v $key >> output/inspection.log 2>> output/error.log
    if ($LASTEXITCODE -eq 0)
    {
        Write-Host -NoNewline "[*] Found key HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\"
        Write-Host $key
        Write-Host "[+] Check the output/inspection.log for contents"
    }
    else
    {
        Write-Host -NoNewline "[-] Did not find the key HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\"
        Write-Host $key
    }

    reg query HKEY_CURRENT_USER\SOFTWARE\ /v $key >> output/inspection.log 2>> output/error.log
    if ($LASTEXITCODE -eq 0)
    {
        Write-Host -NoNewline "[*] Found key HKEY_CURRENT_USER\SOFTWARE\"
        Write-Host $key
        Write-Host "[+] Check the output/inspection.log for contents"
    }
    else
    {
        Write-Host -NoNewline "[-] Did not find the key HKEY_CURRENT_USER\SOFTWARE\"
        Write-Host $key
    }

    reg query HKEY_CURRENT_USER\Environment\ /v $key >> output/inspection.log 2>> output/error.log
    if ($LASTEXITCODE -eq 0)
    {
        Write-Host -NoNewline "[*] Found key HKEY_CURRENT_USER\Environment\"
        Write-Host $key
        Write-Host "[+] Check the output/inspection.log for contents"
    }
    else
    {
        Write-Host -NoNewline "[-] Did not find the key HKEY_CURRENT_USER\Environment\"
        Write-Host $key
    }
}

if ($mode -eq "eradicate")
{
    reg delete HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ /v $key /f > $null 2>> output/error.log
    if ($LASTEXITCODE -eq 0)
    {
        Write-Host -NoNewline "[*] Deleted key HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\"
        Write-Host $key
    }
    else
    {
        Write-Host -NoNewline "[-] Did not delete the key HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\"
        Write-Host $key
    }

    reg delete HKEY_CURRENT_USER\SOFTWARE\ /v $key /f > $null 2>> output/error.log
    if ($LASTEXITCODE -eq 0)
    {
        Write-Host -NoNewline "[*] Deleted key HKEY_CURRENT_USER\SOFTWARE\"
        Write-Host $key
    }
    else
    {
        Write-Host -NoNewline "[-] Did not delete the key HKEY_CURRENT_USER\SOFTWARE\"
        Write-Host $key
    }

    reg delete HKEY_CURRENT_USER\Environment\ /v $key /f > $null 2>> output/error.log
    if ($LASTEXITCODE -eq 0)
    {
        Write-Host -NoNewline "[*] Deleted key HKEY_CURRENT_USER\Environment\"
        Write-Host $key
    }
    else
    {
        Write-Host -NoNewline "[-] Did not delete the key HKEY_CURRENT_USER\Environment\"
        Write-Host $key
    }
}