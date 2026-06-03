$pol = Get-Content 'diabetespolonesshopify/index.html' -Raw
$swe = Get-Content 'diabetessuecoshopify/index.html' -Raw

$polMain = [regex]::Match($pol, '(?s)<main.*?</main>').Value
$sweMain = [regex]::Match($swe, '(?s)<main.*?</main>').Value

function Get-Structure($html) {
    $html = [regex]::Replace($html, '(?s)<script.*?>.*?</script>', '')
    $html = [regex]::Replace($html, '(?s)>[^<]+<', '><')
    $html = [regex]::Replace($html, 'src="[^"]+"', 'src="image_placeholder"')
    $html = [regex]::Replace($html, 'href="[^"]+"', 'href="link_placeholder"')
    return $html.Trim()
}

$polStruct = Get-Structure($polMain)
$sweStruct = Get-Structure($sweMain)

if ($polStruct -eq $sweStruct) {
    Write-Host "HTML structures are identical!"
} else {
    Write-Host "HTML structures differ!"
    $polFile = "scratch/pol_struct.html"
    $sweFile = "scratch/swe_struct.html"
    Set-Content -Path $polFile -Value $polStruct -Encoding utf8
    Set-Content -Path $sweFile -Value $sweStruct -Encoding utf8
    
    Compare-Object (Get-Content $polFile) (Get-Content $sweFile) | Select-Object -First 30
}
