$rootDir = "c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main"
$origHtml = "$rootDir\diabetesnoruegues\index.html"
$shopHtml = "$rootDir\diabetesnorueguesshopify\index.html"

function Update-FileButtons($filePath) {
    if (Test-Path $filePath) {
        $content = Get-Content -Path $filePath -Raw -Encoding utf8
        
        # 1. Update the style attribute
        $oldStyle = 'style="border-radius:20px;background-color:#01bc00;box-shadow:var(--wp--preset--shadow--deep)"'
        $newStyle = 'style="border-radius:20px;background-color:#01bc00;box-shadow:var(--wp--preset--shadow--deep);color:#ffffff !important;"'
        $content = $content.Replace($oldStyle, $newStyle)
        
        # 2. Update the strong tag text
        $oldStrong = '<strong>KJØP NÅ</strong>'
        $newStrong = '<strong style="color:#ffffff !important;">KJØP NÅ</strong>'
        $content = $content.Replace($oldStrong, $newStrong)
        
        Set-Content -Path $filePath -Value $content -Encoding utf8
        Write-Host "Updated buttons in $filePath"
    } else {
        Write-Host "File not found: $filePath"
    }
}

Update-FileButtons $origHtml
Update-FileButtons $shopHtml
