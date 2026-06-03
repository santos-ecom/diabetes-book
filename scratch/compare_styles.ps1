$swe = Get-Content 'diabetessuecoshopify/index.html' -Raw
$nor = Get-Content 'diabetesnorueguesshopify/index.html' -Raw

$sweStyle = [regex]::Match($swe, '(?s)<style>(.*?)</style>').Groups[1].Value.Trim()
$norStyle = [regex]::Match($nor, '(?s)<style>(.*?)</style>').Groups[1].Value.Trim()

if ($sweStyle -eq $norStyle) {
    Write-Host "Styles are identical!"
} else {
    Write-Host "Styles differ!"
    $sweFile = "scratch/swe_style.css"
    $norFile = "scratch/nor_style.css"
    Set-Content -Path $sweFile -Value $sweStyle -Encoding utf8
    Set-Content -Path $norFile -Value $norStyle -Encoding utf8
    
    # Show difference using Compare-Object
    Compare-Object (Get-Content $sweFile) (Get-Content $norFile) | Select-Object -First 30
}
