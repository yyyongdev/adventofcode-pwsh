$lines = Get-Content -Path "$PSScriptRoot/Day1.txt"

$totals = @()
$temp = 0
$lines | Foreach-Object {
	if ($PSItem.Length -gt 0) {
		$temp += [int]$PSItem
	}
	else {
		$totals += @($temp)
		$temp = 0
	}
}
$measure = $totals | Measure-Object -Maximum

Write-Host $measure.Maximum