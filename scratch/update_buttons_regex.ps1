$rootDir = "c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main"
$origHtml = "$rootDir\diabetesnoruegues\index.html"
$shopHtml = "$rootDir\diabetesnorueguesshopify\index.html"

function Update-FileButtons($filePath) {
    if (Test-Path $filePath) {
        $content = Get-Content -Path $filePath -Raw -Encoding utf8
        
        # Regex search and replace for button style and white text overrides
        $pattern = 'style="border-radius:20px;background-color:#01bc00;box-shadow:var\(--wp--preset--shadow--deep\)">\s*<strong>\s*KJØP NÅ\s*</strong>\s*</a>'
        $replacement = 'style="border-radius:20px;background-color:#01bc00;box-shadow:var(--wp--preset--shadow--deep);color:#ffffff !important;"><strong style="color:#ffffff !important;">KJØP NÅ</strong></a>'
        
        $newContent = [regex]::Replace($content, $pattern, $replacement)
        
        Set-Content -Path $filePath -Value $newContent -Encoding utf8
        Write-Host "Updated buttons in $filePath"
    } else {
        Write-Host "File not found: $filePath"
    }
}

Update-FileButtons $origHtml
Update-FileButtons $shopHtml
