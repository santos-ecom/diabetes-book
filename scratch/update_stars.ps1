$rootDir = "c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main"
$origHtml = "$rootDir\diabetesnoruegues\index.html"
$shopHtml = "$rootDir\diabetesnorueguesshopify\index.html"

function Update-Stars($filePath) {
    if (Test-Path $filePath) {
        $content = Get-Content -Path $filePath -Raw -Encoding utf8
        
        # Replace the first stars block
        $oldStars1 = 'style="margin-right:var(--wp--preset--spacing--50);margin-left:var(--wp--preset--spacing--50)">⭐⭐⭐⭐⭐'
        $newStars1 = 'style="margin-right:var(--wp--preset--spacing--50);margin-left:var(--wp--preset--spacing--50);color:#ffc000 !important;">⭐⭐⭐⭐⭐'
        $content = $content.Replace($oldStars1, $newStars1)
        
        # Replace the second stars block (with indentation/newlines)
        $oldStars2 = 'style="margin-right:var(--wp--preset--spacing--50);margin-left:var(--wp--preset--spacing--50)">' + "`r`n" + '                        ⭐⭐⭐⭐⭐</p>'
        $newStars2 = 'style="margin-right:var(--wp--preset--spacing--50);margin-left:var(--wp--preset--spacing--50);color:#ffc000 !important;">' + "`r`n" + '                        ⭐⭐⭐⭐⭐</p>'
        $content = $content.Replace($oldStars2, $newStars2)

        # Fallback replacement for the second stars block if it only uses `\n` (Unix line endings)
        $oldStars2Unix = 'style="margin-right:var(--wp--preset--spacing--50);margin-left:var(--wp--preset--spacing--50)">' + "`n" + '                        ⭐⭐⭐⭐⭐</p>'
        $newStars2Unix = 'style="margin-right:var(--wp--preset--spacing--50);margin-left:var(--wp--preset--spacing--50);color:#ffc000 !important;">' + "`n" + '                        ⭐⭐⭐⭐⭐</p>'
        $content = $content.Replace($oldStars2Unix, $newStars2Unix)
        
        Set-Content -Path $filePath -Value $content -Encoding utf8
        Write-Host "Updated star styling in $filePath"
    } else {
        Write-Host "File not found: $filePath"
    }
}

Update-Stars $origHtml
Update-Stars $shopHtml
