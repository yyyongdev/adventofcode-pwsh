$lines = Get-Content "$PSScriptRoot/Day4.txt"

function IsFullyContains {
	param (
		[string]
		$sourceRange,
		[string]
		$checkRange
	)
	Process {
		$srcStart, $srcEnd = $sourceRange -Split '-'
		$chkStart, $chkEnd = $checkRange -Split '-'

		if((([int]$srcStart) -le ([int]$chkStart)) -and (([int]$srcEnd) -ge ([int]$chkEnd))) {
			return $true
		}
		return $false
	}
}

$fullyContainsCount = 0
$lines | ForEach-Object {
	$first, $second = ($PSItem -Split ',')

	if((IsFullyContains $first $second) -or (IsFullyContains $second $first)) {
		$fullyContainsCount++
	}
}

Write-Host "Result:" $fullyContainsCount

