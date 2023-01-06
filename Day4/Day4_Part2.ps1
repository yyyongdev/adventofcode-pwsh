﻿$lines = Get-Content "$PSScriptRoot/Day4.txt"

function IsOverlap {
	Param(
		[string]
		$rangeA,
		[string]
		$rangeB
	)
	Process {
		$startA, $endA = $rangeA -Split '-'
		$startB, $endB = $rangeB -Split '-'
		$result = (($startA)..($endA) | Where-Object { ($startB)..($endB) -contains $PSItem })
		return ($result.Count -gt 0)
	}
}

$overlapCount = 0
$lines | ForEach-Object {
	$first, $second = $PSItem -Split ','

	if (IsOverlap $first $second) {
		$overlapCount++
	}
}

Write-Host "Result:" $overlapCount