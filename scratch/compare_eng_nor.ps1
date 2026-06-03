$eng = Get-Content 'diabetes/index.html' -Raw
$nor = Get-Content 'diabetesnoruegues/index.html' -Raw

$engMain = [regex]::Match($eng, '(?s)<main.*?</main>').Value
$norMain = [regex]::Match($nor, '(?s)<main.*?</main>').Value

function Get-Structure($html) {
    $html = [regex]::Replace($html, '(?s)<script.*?>.*?</script>', '')
    $html = [regex]::Replace($html, '(?s)>[^<]+<', '><')
    $html = [regex]::Replace($html, 'src="[^"]+"', 'src="image_placeholder"')
    $html = [regex]::Replace($html, 'href="[^"]+"', 'href="link_placeholder"')
    return $html.Trim()
}

$engStruct = Get-Structure($engMain)
$norStruct = Get-Structure($norMain)

if ($engStruct -eq $norStruct) {
    Write-Host "Structures are identical!"
} else {
    Write-Host "Structures differ!"
    $engFile = "scratch/eng_struct.html"
    $norFile = "scratch/nor_struct_orig.html"
    Set-Content -Path $engFile -Value $engStruct -Encoding utf8
    Set-Content -Path $norFile -Value $norStruct -Encoding utf8
    
    Compare-Object (Get-Content $engFile) (Get-Content $norFile) | Select-Object -First 30
}
