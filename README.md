# Icecast log reader for PPL reports

## *nix systems with grep and awk


Correct function is ```./pplreport.sh <year> <quarter> <mount>```


## Windows Systems using powershell
You may need to run Set-ExecutionPolicy Unrestricted from an elevated prompt to enable powershell scripts

Correct function is ```pplreport.ps1 -year <year> -quarter <quarter> -mount <mount>```
Where:
- Year is a Year. Example: 2017
- Quarter is a number 1, 2, 3 or 4. Example: For April, May and June this would be 2.
- Mount is your mount without the slash. Example: MyMount.ogg