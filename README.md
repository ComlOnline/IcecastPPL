# Icecast log reader for PPL reports

## *nix systems with grep and awk
'grep -E '(Jul|Aug|Sep)\/2016.*\/HullfireRadio\.mp3' ./access.log* | awk '{ SUM += $NF} END { print SUM/60/60 }''

Correct function is ./pplreport.sh <year> <quarter> <mount>


## Windows Systems using powershell
May need to run Set-ExecutionPolicy Unrestricted from an elevated prompt to enable powershell scripts
Also I cheated so you will need to install gawk https://sourceforge.net/projects/gnuwin32/files/gawk/