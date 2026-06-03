$swe = Get-Content 'diabetessuecoshopify/index.html' -Raw
$nor = Get-Content 'diabetesnorueguesshopify/index.html' -Raw

# Extract main content container
$sweMain = [regex]::Match($swe, '(?s)<main.*?</main>').Value
$norMain = [regex]::Match($nor, '(?s)<main.*?</main>').Value

# Strip text and leave only tags, attributes, and classes for structural comparison
# We'll replace all text between tags with empty space, and keep tags/attributes/classes
function Get-Structure($html) {
    # Replace all script blocks
    $html = [regex]::Replace($html, '(?s)<script.*?>.*?</script>', '')
    # Replace all text content between > and <
    $html = [regex]::Replace($html, '(?s)>[^<]+<', '><')
    # Standardize image URLs and cart paths for structural match
    $html = [regex]::Replace($html, 'src="\{\{[^}]+|file_url\s*\}\}"', 'src="image_placeholder"')
    $html = [regex]::Replace($html, 'href="[^"]+"', 'href="link_placeholder"')
    return $html.Trim()
}

$sweStruct = Get-Structure($sweMain)
$norStruct = Get-Structure($norMain)

if ($sweStruct -eq $norStruct) {
    Write-Host "HTML structures are identical!"
} else {
    Write-Host "HTML structures differ!"
    $sweFile = "scratch/swe_struct.html"
    $norFile = "scratch/nor_struct.html"
    Set-Content -Path $sweFile -Value $sweStruct -Encoding utf8
    Set-Content -Path $norFile -Value $norStruct -Encoding utf8
    
    # Compare
    Compare-Object (Get-Content $sweFile) (Get-Content $norFile) | Select-Object -First 50
}
