$rootDir = "c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main"

# 1. Sync original Norwegian page assets
$origDir = "$rootDir\diabetesnoruegues"
$origAssets = "$origDir\assets"
$origHtml = "$origDir\index.html"

Write-Host "Renaming assets in original Norwegian directory..."
Rename-Item -Path "$origAssets\IMAGE1pq.png" -NewName "IMAGE1-no.png" -ErrorAction SilentlyContinue
Rename-Item -Path "$origAssets\IMAGE2pq.png" -NewName "IMAGE2-no.png" -ErrorAction SilentlyContinue
Rename-Item -Path "$origAssets\IMAGE3pq.webp" -NewName "IMAGE3-no.webp" -ErrorAction SilentlyContinue
Rename-Item -Path "$origAssets\IMAGE4pq.webp" -NewName "IMAGE4-no.webp" -ErrorAction SilentlyContinue
Rename-Item -Path "$origAssets\IMAGE5pq.png" -NewName "IMAGE5-no.png" -ErrorAction SilentlyContinue
Rename-Item -Path "$origAssets\AVL1.png" -NewName "AVL1-no.png" -ErrorAction SilentlyContinue
Rename-Item -Path "$origAssets\AVL2.png" -NewName "AVL2-no.png" -ErrorAction SilentlyContinue
Rename-Item -Path "$origAssets\AVL3.png" -NewName "AVL3-no.png" -ErrorAction SilentlyContinue
Rename-Item -Path "$origAssets\AVL4.png" -NewName "AVL4-no.png" -ErrorAction SilentlyContinue

Write-Host "Updating index.html references in original Norwegian directory..."
if (Test-Path $origHtml) {
    $content = Get-Content -Path $origHtml -Raw -Encoding utf8
    $content = $content -replace "IMAGE1pq.png", "IMAGE1-no.png"
    $content = $content -replace "IMAGE2pq.png", "IMAGE2-no.png"
    $content = $content -replace "IMAGE3pq.webp", "IMAGE3-no.webp"
    $content = $content -replace "IMAGE4pq.webp", "IMAGE4-no.webp"
    $content = $content -replace "IMAGE5pq.png", "IMAGE5-no.png"
    $content = $content -replace "AVL1.png", "AVL1-no.png"
    $content = $content -replace "AVL2.png", "AVL2-no.png"
    $content = $content -replace "AVL3.png", "AVL3-no.png"
    $content = $content -replace "AVL4.png", "AVL4-no.png"
    
    # Insert heading above reviews gallery
    if ($content -notlike "*Her er hva andre sier om oss:*") {
        $replacement = '<!-- REVIEWS GALLERY -->' + "`r`n" + '                <p class="has-text-align-center has-large-font-size"><strong>Her er hva andre sier om oss:</strong></p>'
        $content = $content -replace '<!-- REVIEWS GALLERY -->', $replacement
    }
    Set-Content -Path $origHtml -Value $content -Encoding utf8
    Write-Host "Original index.html updated successfully."
}

# 2. Update Shopify Norwegian page index.html
$shopHtml = "$rootDir\diabetesnorueguesshopify\index.html"
Write-Host "Updating index.html in Shopify Norwegian directory..."
if (Test-Path $shopHtml) {
    $content = Get-Content -Path $shopHtml -Raw -Encoding utf8
    # Insert heading above reviews gallery
    if ($content -notlike "*Her er hva andre sier om oss:*") {
        $replacement = '<!-- REVIEWS GALLERY -->' + "`r`n" + '                <p class="has-text-align-center has-large-font-size"><strong>Her er hva andre sier om oss:</strong></p>'
        $content = $content -replace '<!-- REVIEWS GALLERY -->', $replacement
    }
    Set-Content -Path $shopHtml -Value $content -Encoding utf8
    Write-Host "Shopify index.html updated successfully."
}
