$line = [char[]](Get-Content "$PSScriptRoot/Day6.txt")

$checkRange = 14
$len = $line.Length
$count = 0
for ($i = $checkRange; $i -lt $len; $i++) {
	$count = $i
	$check = $line[($i-$checkRange)..($i-1)]
	$sorted = $check | Sort-Object
	$diff = Compare-Object -ReferenceObject $sorted -DifferenceObject ($sorted | Get-Unique)
	if ($diff.Count -eq 0) {
		break;
	}
}
Write-Host "Result:" $count

