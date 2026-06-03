$rootDir = "c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main"
$origHtml = "$rootDir\diabetesnoruegues\index.html"
$shopHtml = "$rootDir\diabetesnorueguesshopify\index.html"

# Construct 5 stars: ⭐ = 0x2B50
$stars = [char]0x2B50 + [char]0x2B50 + [char]0x2B50 + [char]0x2B50 + [char]0x2B50

Write-Host "Target stars constructed: $stars"

function Update-FileStars($filePath, $starsStr) {
    if (Test-Path $filePath) {
        $content = Get-Content -Path $filePath -Raw -Encoding utf8
        
        # 1. Update first block
        $old1 = "style=`"margin-right:var(--wp--preset--spacing--50);margin-left:var(--wp--preset--spacing--50)`">$starsStr"
        $new1 = "style=`"margin-right:var(--wp--preset--spacing--50);margin-left:var(--wp--preset--spacing--50);color:#ffc000 !important;`">$starsStr"
        
        # 2. Update second block
        $old2 = "style=`"margin-right:var(--wp--preset--spacing--50);margin-left:var(--wp--preset--spacing--50)`">" + "`r`n" + "                        $starsStr</p>"
        $new2 = "style=`"margin-right:var(--wp--preset--spacing--50);margin-left:var(--wp--preset--spacing--50);color:#ffc000 !important;`">" + "`r`n" + "                        $starsStr</p>"
        
        # 2 Unix fallback
        $old2Unix = "style=`"margin-right:var(--wp--preset--spacing--50);margin-left:var(--wp--preset--spacing--50)`">" + "`n" + "                        $starsStr</p>"
        $new2Unix = "style=`"margin-right:var(--wp--preset--spacing--50);margin-left:var(--wp--preset--spacing--50);color:#ffc000 !important;`">" + "`n" + "                        $starsStr</p>"
        
        # Replace
        $content = $content.Replace($old1, $new1)
        $content = $content.Replace($old2, $new2)
        $content = $content.Replace($old2Unix, $new2Unix)
        
        Set-Content -Path $filePath -Value $content -Encoding utf8
        Write-Host "Updated stars in $filePath"
    } else {
        Write-Host "File not found: $filePath"
    }
}

Update-FileStars $origHtml $stars
Update-FileStars $shopHtml $stars
