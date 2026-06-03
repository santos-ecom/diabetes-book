$shopifyDir = "c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main\diabetesnorueguesshopify"
$assetsPath = "$shopifyDir\assets"
$htmlPath = "$shopifyDir\index.html"

# Rename files in assets folder
Write-Host "Renaming assets..."
Rename-Item -Path "$assetsPath\IMAGE1pq.png" -NewName "IMAGE1-no.png" -ErrorAction SilentlyContinue
Rename-Item -Path "$assetsPath\IMAGE2pq.png" -NewName "IMAGE2-no.png" -ErrorAction SilentlyContinue
Rename-Item -Path "$assetsPath\IMAGE3pq.webp" -NewName "IMAGE3-no.webp" -ErrorAction SilentlyContinue
Rename-Item -Path "$assetsPath\IMAGE4pq.webp" -NewName "IMAGE4-no.webp" -ErrorAction SilentlyContinue
Rename-Item -Path "$assetsPath\IMAGE5pq.png" -NewName "IMAGE5-no.png" -ErrorAction SilentlyContinue
Rename-Item -Path "$assetsPath\AVL1.png" -NewName "AVL1-no.png" -ErrorAction SilentlyContinue
Rename-Item -Path "$assetsPath\AVL2.png" -NewName "AVL2-no.png" -ErrorAction SilentlyContinue
Rename-Item -Path "$assetsPath\AVL3.png" -NewName "AVL3-no.png" -ErrorAction SilentlyContinue
Rename-Item -Path "$assetsPath\AVL4.png" -NewName "AVL4-no.png" -ErrorAction SilentlyContinue

# Replace references in index.html
Write-Host "Updating index.html references..."
if (Test-Path $htmlPath) {
    $content = Get-Content -Path $htmlPath -Raw -Encoding utf8
    $content = $content -replace "IMAGE1pq.png", "IMAGE1-no.png"
    $content = $content -replace "IMAGE2pq.png", "IMAGE2-no.png"
    $content = $content -replace "IMAGE3pq.webp", "IMAGE3-no.webp"
    $content = $content -replace "IMAGE4pq.webp", "IMAGE4-no.webp"
    $content = $content -replace "IMAGE5pq.png", "IMAGE5-no.png"
    $content = $content -replace "AVL1.png", "AVL1-no.png"
    $content = $content -replace "AVL2.png", "AVL2-no.png"
    $content = $content -replace "AVL3.png", "AVL3-no.png"
    $content = $content -replace "AVL4.png", "AVL4-no.png"
    Set-Content -Path $htmlPath -Value $content -Encoding utf8
    Write-Host "index.html updated successfully."
} else {
    Write-Host "Error: index.html not found."
}
