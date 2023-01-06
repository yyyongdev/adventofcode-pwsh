$line = Get-Content "$PSScriptRoot/Day6.txt"

$bit = 1
$bitTable = @{}
foreach($i in 'a'..'z') {
	$bitTable[$i] = $bit
	$bit += $bit
}

$checkRange = 14

$len = $line.Length
$count = 0
for ($i = $checkRange; $i -lt $len; $i++) {
	$count = $i
	$compare = 0
	$isMarker = $true
	for ($j = $i - $checkRange; $j -ne $i; $j++) {
		$key = $line[$j]
		$value = $bitTable[$key]
		$check = $compare -band $value
		if ($check -eq 0) {
			$compare = $compare -bor $value
		}
		else {
			$isMarker = $false
			break;
		}
	}
	if ($isMarker) {
		break;
	}

}
Write-Host "Result:" $count

