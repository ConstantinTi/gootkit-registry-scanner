# Gootkit Registry Scanner
This script helps to detect the malware Gootkit and allows you to remove the infection from the registry.

This script should help you to detect the malware Gootkit.
Please bear in mind, that the key names or even the location may change as this virus is evolving.
This particular scanner was able to detect various attacks of Gootkit in December 2020.
However, GootKit is known to be changed.

For more information on the current attacks in Germany go the the [blog of malwarebytes](https://blog.malwarebytes.com/threat-analysis/2020/11/german-users-targeted-with-gootkit-banker-or-revil-ransomware/)

# Usage
## Basic commands
Obviously, run it on Windows - duh.

To simply check the registry paths known to be affected run:
```
.\gootkit_registry_scanner.ps1 -mode investigate
```

If you did actually find a key, which seems to be worth looking into, you can look for the contents in the registry paths:
```
.\gootkit_registry_scanner.ps1 -mode inspect -key the_key_to_look_for
```

In case there actually is a Gootkit on your system, you can simply delete the malicious keys with:
```
.\gootkit_registry_scanner.ps1 -mode eradicate -key the_key_to_delete
```

## Help
To get the full help on this script:
```
.\gootkit_registry_scanner.ps1 -mode help
```

Or just use the built-in function of Powershell to get all the information you need. You can use all the supported parameters of `Get-Help` on this:
```
Get-Help .\gootkit-registry-scanner.ps1
Get-Help .\gootkit-registry-scanner.ps1 -Full
Get-Help .\gootkit-registry-scanner.ps1 -Detailed
```

```
PS C:\gootkit-registry-scanner> Get-Help .\gootkit-registry-scanner.ps1      

NAME
    C:\gootkit-registry-scanner\gootkit-registry-scanner.ps1

ÜBERSICHT
    gootkit-registry-scanner v1.0 - Gootkit detection and removal tool
    2020 by Constantin Tillmann (https://github.com/ConstantinTi)
    This script helps to detect the malware Gootkit and allows you to remove the infection from the registry.


SYNTAX
    C:\gootkit-registry-scanner\gootkit-registry-scanner.ps1 [[-mode] <String>] [[-key] <String>] [<CommonParameters>]


BESCHREIBUNG
    This script should help you to detect the malware Gootkit.
    Please bear in mind, that the key names or even the location may change as this virus is evolving.
    This particular scanner was able to detect various attacks of Gootkit in December 2020.
    However, GootKit is known to be changed.


VERWANDTE LINKS
    https://github.com/ConstantinTi/gootkit-registry-scanner
    https://blog.malwarebytes.com/threat-analysis/2020/11/german-users-targeted-with-gootkit-banker-or-revil-ransomware/

HINWEISE
    Zum Aufrufen der Beispiele geben Sie Folgendes ein: "get-help C:\gootkit-registry-scanner\gootkit-registry-scanner.ps1 -examples".
    Weitere Informationen erhalten Sie mit folgendem Befehl: "get-help C:\gootkit-registry-scanner\gootkit-registry-scanner.ps1 -detailed".
    Technische Informationen erhalten Sie mit folgendem Befehl: "get-help C:\gootkit-registry-scanner\gootkit-registry-scanner.ps1 -full".
    Geben Sie zum Abrufen der Onlinehilfe Folgendes ein: "get-help C:\gootkit-registry-scanner\gootkit-registry-scanner.ps1 -online"
```

# License
Have a look at my [License](LICENSE)!