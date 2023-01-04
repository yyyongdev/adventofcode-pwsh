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

Write-Host ($totals | Sort-Object -Descending | Select-Object -First 3 | Measure-Object -Sum).Sum