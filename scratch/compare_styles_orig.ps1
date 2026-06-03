$eng = Get-Content 'diabetes/index.html' -Raw
$nor = Get-Content 'diabetesnoruegues/index.html' -Raw

$engStyle = [regex]::Match($eng, '(?s)<style>(.*?)</style>').Groups[1].Value.Trim()
$norStyle = [regex]::Match($nor, '(?s)<style>(.*?)</style>').Groups[1].Value.Trim()

if ($engStyle -eq $norStyle) {
    Write-Host "Styles are identical!"
} else {
    Write-Host "Styles differ!"
    $engFile = "scratch/eng_style.css"
    $norFile = "scratch/nor_style_orig.css"
    Set-Content -Path $engFile -Value $engStyle -Encoding utf8
    Set-Content -Path $norFile -Value $norStyle -Encoding utf8
    
    # Show difference using Compare-Object
    Compare-Object (Get-Content $engFile) (Get-Content $norFile) | Select-Object -First 30
}
