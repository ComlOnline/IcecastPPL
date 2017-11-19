$pattern=@'
(Jan|Feb|Mar)\/2017.*\/HullfireRadio\.mp3\s.*\s200\s.*\s".*"\s".*"\s[^0]\d*
'@

$target = @()

$results=Select-String -Path "access.log*" -Pattern $pattern
# $results.Matches.Value.Split()[-1]
$results.Matches.Value | foreach {
	$target += $_.Split(' ')[-1]
}
($target | Measure-Object -Sum).sum/60/60