# Icecast log reader for PPL reports

'grep -E '(Jul|Aug|Sep)\/2016.*\/HullfireRadio\.mp3' ./access.log* | awk '{ SUM += $13} END { print SUM/60/60 }''


at the moemnt the . in the mount needs to be escaped so HullfireRadio.mp3 would be HullfireRadio\.mp3