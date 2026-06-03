$base_dir = "c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main"

# 1. Image Renaming mapping helper function
function Rename-ImageIfExist($dir, $oldName, $newName) {
    $oldPath = Join-Path $dir $oldName
    $newPath = Join-Path $dir $newName
    if (Test-Path $oldPath) {
        if (Test-Path $newPath) {
            Remove-Item $newPath -Force
        }
        Rename-Item -Path $oldPath -NewName $newName
        Write-Host "Renamed $oldName to $newName in $dir"
    }
}

# --- PROCESS POLISH (PL) ---
$pl_dir = Join-Path $base_dir "gorduranofigadopolonesshopify"
Rename-ImageIfExist $pl_dir "IMG1 (2).png" "gordura_IMAGEM1_PL.png"
Rename-ImageIfExist $pl_dir "IMG2 (1).png" "gordura_IMAGEM2_PL.png"
Rename-ImageIfExist $pl_dir "IMG3 (1).png" "gordura_IMAGEM3_PL.png"
Rename-ImageIfExist $pl_dir "IMG4 (1).png" "gordura_IMAGEM4_PL.png"
Rename-ImageIfExist $pl_dir "DEPOIMENTOS (1).png" "gordura_1_PL.png"
Rename-ImageIfExist $pl_dir "DEPOIMENTOS (2).png" "gordura_2_PL.png"
Rename-ImageIfExist $pl_dir "DEPOIMENTOS (3).png" "gordura_3_PL.png"
Rename-ImageIfExist $pl_dir "DEPOIMENTOS (4).png" "gordura_4_PL.png"
# Copy IMAGEM5 from FR
Copy-Item -Path (Join-Path $base_dir "gorduranofigadofrancesshopify\gordura_IMAGEM5_FR.png") -Destination (Join-Path $pl_dir "gordura_IMAGEM5_PL.png") -Force

# Update PL text
$pl_html_path = Join-Path $pl_dir "index.html"
if (Test-Path $pl_html_path) {
    $html = Get-Content -Path $pl_html_path -Raw -Encoding UTF8
    $html = $html.Replace("TODO_VARIANT_ID", "43054416658509")
    $html = $html.Replace("19.90 €", "89 zł")
    $html = $html.Replace("19,90 €", "89 zł")
    $html = $html.Replace("59.70 €", "269 zł")
    $html = $html.Replace("59,70 €", "269 zł")
    [System.IO.File]::WriteAllText($pl_html_path, $html, [System.Text.Encoding]::UTF8)
    Write-Host "Updated Variant ID and Prices in Polish HTML"
}

# --- PROCESS DUTCH (NL) ---
$nl_dir = Join-Path $base_dir "gorduranofigadoholandesshopify"
Rename-ImageIfExist $nl_dir "IMG1 (2).png" "gordura_IMAGEM1_NL.png"
Rename-ImageIfExist $nl_dir "IMG2 (1).png" "gordura_IMAGEM2_NL.png"
Rename-ImageIfExist $nl_dir "IMG3 (1).png" "gordura_IMAGEM3_NL.png"
Rename-ImageIfExist $nl_dir "IMG4 (1).png" "gordura_IMAGEM4_NL.png"
Rename-ImageIfExist $nl_dir "DEPOIMENTOS (1).png" "gordura_1_NL.png"
Rename-ImageIfExist $nl_dir "DEPOIMENTOS (2).png" "gordura_2_NL.png"
Rename-ImageIfExist $nl_dir "DEPOIMENTOS (3).png" "gordura_3_NL.png"
Rename-ImageIfExist $nl_dir "DEPOIMENTOS (4).png" "gordura_4_NL.png"
Copy-Item -Path (Join-Path $base_dir "gorduranofigadofrancesshopify\gordura_IMAGEM5_FR.png") -Destination (Join-Path $nl_dir "gordura_IMAGEM5_NL.png") -Force

# Update NL text
$nl_html_path = Join-Path $nl_dir "index.html"
if (Test-Path $nl_html_path) {
    $html = Get-Content -Path $nl_html_path -Raw -Encoding UTF8
    $html = $html.Replace("TODO_VARIANT_ID", "43054417543245")
    # Netherlands uses Euro, so no price conversion needed.
    [System.IO.File]::WriteAllText($nl_html_path, $html, [System.Text.Encoding]::UTF8)
    Write-Host "Updated Variant ID in Dutch HTML"
}

# --- PROCESS SWEDISH (SV) ---
$sv_dir = Join-Path $base_dir "gorduranofigadosuecoshopify"
Rename-ImageIfExist $sv_dir "IMAG1 (7).png" "gordura_IMAGEM1_SV.png"
Rename-ImageIfExist $sv_dir "IMAG2 (1).png" "gordura_IMAGEM2_SV.png"
Rename-ImageIfExist $sv_dir "IMAG3.jpg" "gordura_IMAGEM3_SV.jpg"
Rename-ImageIfExist $sv_dir "IMAG4.jpg" "gordura_IMAGEM4_SV.jpg"
Rename-ImageIfExist $sv_dir "1 (2).jpg" "gordura_1_SV.jpg"
Rename-ImageIfExist $sv_dir "2.jpg" "gordura_2_SV.jpg"
Rename-ImageIfExist $sv_dir "3.jpg" "gordura_3_SV.jpg"
Rename-ImageIfExist $sv_dir "4.jpg" "gordura_4_SV.jpg"
Copy-Item -Path (Join-Path $base_dir "gorduranofigadofrancesshopify\gordura_IMAGEM5_FR.png") -Destination (Join-Path $sv_dir "gordura_IMAGEM5_SV.png") -Force

# Update SV text & image extensions
$sv_html_path = Join-Path $sv_dir "index.html"
if (Test-Path $sv_html_path) {
    $html = Get-Content -Path $sv_html_path -Raw -Encoding UTF8
    $html = $html.Replace("TODO_VARIANT_ID", "43054415675469")
    $html = $html.Replace("19.90 €", "229 kr")
    $html = $html.Replace("19,90 €", "229 kr")
    $html = $html.Replace("59.70 €", "689 kr")
    $html = $html.Replace("59,70 €", "689 kr")
    # Change Swedish image extensions to .jpg where uploaded as such
    $html = $html.Replace("gordura_IMAGEM3_SV.png", "gordura_IMAGEM3_SV.jpg")
    $html = $html.Replace("gordura_IMAGEM4_SV.png", "gordura_IMAGEM4_SV.jpg")
    $html = $html.Replace("gordura_1_SV.png", "gordura_1_SV.jpg")
    $html = $html.Replace("gordura_2_SV.png", "gordura_2_SV.jpg")
    $html = $html.Replace("gordura_3_SV.png", "gordura_3_SV.jpg")
    $html = $html.Replace("gordura_4_SV.png", "gordura_4_SV.jpg")
    [System.IO.File]::WriteAllText($sv_html_path, $html, [System.Text.Encoding]::UTF8)
    Write-Host "Updated Variant ID, Prices and Image Extensions in Swedish HTML"
}

# --- PROCESS DANISH (DA) ---
$da_dir = Join-Path $base_dir "gorduranofigadodinamarquesshopify"
Rename-ImageIfExist $da_dir "IMAG1 (8).png" "gordura_IMAGEM1_DA.png"
Rename-ImageIfExist $da_dir "IMAG2 (2).png" "gordura_IMAGEM2_DA.png"
Rename-ImageIfExist $da_dir "IMAG3.jpg" "gordura_IMAGEM3_DA.jpg"
Rename-ImageIfExist $da_dir "IMAG4.jpg" "gordura_IMAGEM4_DA.jpg"
Rename-ImageIfExist $da_dir "1 (2).jpg" "gordura_1_DA.jpg"
Rename-ImageIfExist $da_dir "2.jpg" "gordura_2_DA.jpg"
Rename-ImageIfExist $da_dir "3.jpg" "gordura_3_DA.jpg"
Rename-ImageIfExist $da_dir "4.jpg" "gordura_4_DA.jpg"
Copy-Item -Path (Join-Path $base_dir "gorduranofigadofrancesshopify\gordura_IMAGEM5_FR.png") -Destination (Join-Path $da_dir "gordura_IMAGEM5_DA.png") -Force

# Update DA text & image extensions
$da_html_path = Join-Path $da_dir "index.html"
if (Test-Path $da_html_path) {
    $html = Get-Content -Path $da_html_path -Raw -Encoding UTF8
    $html = $html.Replace("TODO_VARIANT_ID", "43054418034765")
    $html = $html.Replace("19.90 €", "149 kr")
    $html = $html.Replace("19,90 €", "149 kr")
    $html = $html.Replace("59.70 €", "449 kr")
    $html = $html.Replace("59,70 €", "449 kr")
    # Change Danish image extensions to .jpg where uploaded as such
    $html = $html.Replace("gordura_IMAGEM3_DA.png", "gordura_IMAGEM3_DA.jpg")
    $html = $html.Replace("gordura_IMAGEM4_DA.png", "gordura_IMAGEM4_DA.jpg")
    $html = $html.Replace("gordura_1_DA.png", "gordura_1_DA.jpg")
    $html = $html.Replace("gordura_2_DA.png", "gordura_2_DA.jpg")
    $html = $html.Replace("gordura_3_DA.png", "gordura_3_DA.jpg")
    $html = $html.Replace("gordura_4_DA.png", "gordura_4_DA.jpg")
    [System.IO.File]::WriteAllText($da_html_path, $html, [System.Text.Encoding]::UTF8)
    Write-Host "Updated Variant ID, Prices and Image Extensions in Danish HTML"
}

# --- PROCESS NORWEGIAN (NO) ---
$no_dir = Join-Path $base_dir "gorduranofigadonorueguesshopify"
Rename-ImageIfExist $no_dir "IMAG1 (7).png" "gordura_IMAGEM1_NO.png"
Rename-ImageIfExist $no_dir "IMAG2 (1).png" "gordura_IMAGEM2_NO.png"
Rename-ImageIfExist $no_dir "IMAG3.jpg" "gordura_IMAGEM3_NO.jpg"
Rename-ImageIfExist $no_dir "IMAG4.jpg" "gordura_IMAGEM4_NO.jpg"
Rename-ImageIfExist $no_dir "1 (2).jpg" "gordura_1_NO.jpg"
Rename-ImageIfExist $no_dir "2.jpg" "gordura_2_NO.jpg"
Rename-ImageIfExist $no_dir "3.jpg" "gordura_3_NO.jpg"
Rename-ImageIfExist $no_dir "4.jpg" "gordura_4_NO.jpg"
Copy-Item -Path (Join-Path $base_dir "gorduranofigadofrancesshopify\gordura_IMAGEM5_FR.png") -Destination (Join-Path $no_dir "gordura_IMAGEM5_NO.png") -Force

# Update NO text & image extensions
$no_html_path = Join-Path $no_dir "index.html"
if (Test-Path $no_html_path) {
    $html = Get-Content -Path $no_html_path -Raw -Encoding UTF8
    $html = $html.Replace("TODO_VARIANT_ID", "43054417346637")
    $html = $html.Replace("19.90 €", "229 kr")
    $html = $html.Replace("19,90 €", "229 kr")
    $html = $html.Replace("59.70 €", "689 kr")
    $html = $html.Replace("59,70 €", "689 kr")
    # Change Norwegian image extensions to .jpg where uploaded as such
    $html = $html.Replace("gordura_IMAGEM3_NO.png", "gordura_IMAGEM3_NO.jpg")
    $html = $html.Replace("gordura_IMAGEM4_NO.png", "gordura_IMAGEM4_NO.jpg")
    $html = $html.Replace("gordura_1_NO.png", "gordura_1_NO.jpg")
    $html = $html.Replace("gordura_2_NO.png", "gordura_2_NO.jpg")
    $html = $html.Replace("gordura_3_NO.png", "gordura_3_NO.jpg")
    $html = $html.Replace("gordura_4_NO.png", "gordura_4_NO.jpg")
    [System.IO.File]::WriteAllText($no_html_path, $html, [System.Text.Encoding]::UTF8)
    Write-Host "Updated Variant ID, Prices and Image Extensions in Norwegian HTML"
}
