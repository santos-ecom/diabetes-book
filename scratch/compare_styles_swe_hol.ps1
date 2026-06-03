$swe = Get-Content 'diabetessuecoshopify/index.html' -Raw
$hol = Get-Content 'diabetesholandesshopify/index.html' -Raw

$sweStyle = [regex]::Match($swe, '(?s)<style>(.*?)</style>').Groups[1].Value.Trim()
$holStyle = [regex]::Match($hol, '(?s)<style>(.*?)</style>').Groups[1].Value.Trim()

if ($sweStyle -eq $holStyle) {
    Write-Host "Styles are identical!"
} else {
    Write-Host "Styles differ!"
    $sweFile = "scratch/swe_style.css"
    $holFile = "scratch/hol_style.css"
    Set-Content -Path $sweFile -Value $sweStyle -Encoding utf8
    Set-Content -Path $holFile -Value $holStyle -Encoding utf8
    
    # Let's count lines
    $sweLines = Get-Content $sweFile
    $holLines = Get-Content $holFile
    Write-Host "Swedish style lines: $($sweLines.Length)"
    Write-Host "Dutch style lines: $($holLines.Length)"
    
    # Show diff
    $diff = Compare-Object $sweLines $holLines -ErrorAction SilentlyContinue
    if ($diff) {
        $diff | Select-Object -First 40 | Format-Table
    } else {
        Write-Host "Line-by-line comparison shows no differences (might be encoding or line-ending differences)."
    }
}
