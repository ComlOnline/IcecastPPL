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

### ToDo
- [X] Make the Powershell script take options (And its validates what it can)
- [ ] Make them feed to influxDB
- [ ] Pretty Output
- [ ] Optomize powershell (Make it only search relevent log files)
- [ ] Email reports
- [ ] In email remind of PPl details and Link
- [ ] Fix variance in numbers between scripts

### Helpful
https://gist.github.com/sunnyone/4291248
https://stackoverflow.com/questions/9439210/how-can-i-make-this-powershell-script-parse-large-files-faster