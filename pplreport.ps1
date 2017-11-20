param (
    [Parameter(Mandatory=$true)]
	[int]
	$year
,
    [Parameter(Mandatory=$true)]
	[ValidateRange(1,4)]
	[int]
	$quarter
,
    [Parameter(Mandatory=$true)]
	[string]
	$mount
 )

$mount=[Regex]::Escape($mount)

If ($quarter -eq 1) {set-variable -Name months -value 'Jan|Feb|Mar'}
ElseIf ($quarter -eq 2) {set-variable -Name months -value 'Apr|May|Jun'}
ElseIf ($quarter -eq 3) {set-variable -Name months -value 'Jul|Aug|Sep'}
ElseIf ($quarter -eq 4) {set-variable -Name months -value 'Oct|Nov|Dec'}

$pattern=@"
($months)\/2017.*\/$mount\s.*\s200\s.*\s".*"\s".*"\s[^0]\d*
"@

$target = @()

Write-Progress -Activity "Searching..." `
	-Status "Please wait."
	
$results=Select-String -Path "access.log*" -Pattern $pattern

$items = $results.Matches.Value.Count
If ($items -eq 0) {"Nothing Found for quarter $quarter $year"; BREAK}

$i = 0
$percent = 0

Write-Progress -Activity "Counting..." `
	-Status "Please wait."

$results.Matches.Value | foreach {
	<# $percent = [math]::Round($i/$items*100)
	Write-Progress -Activity "Counting..." `
	-PercentComplete $percent -CurrentOperation `
	"$percent% complete" `
	-Status "Please wait."
	$i++ 
	This is commented out as it makes the script take a lot longer#>
	$target += $_.Split(' ')[-1]
}
$hours=[math]::Round(($target | Measure-Object -Sum).sum/60/60,2)
Write-Output "Total listener hours for quarter $quarter $year`: $hours"