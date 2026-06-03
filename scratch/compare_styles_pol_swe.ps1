$polLines = Get-Content 'scratch/pol_style.css'
$sweLines = Get-Content 'scratch/swe_style.css'

Write-Host "Polish style lines: $($polLines.Length)"
Write-Host "Swedish style lines: $($sweLines.Length)"

$diff = Compare-Object $polLines $sweLines -ErrorAction SilentlyContinue
if ($diff) {
    $diff | Select-Object -First 40 | Format-Table
} else {
    Write-Host "Line-by-line comparison shows no differences (encoding/whitespace issue)."
}
