$base_dir = "c:\Users\conta\Downloads\diabetes-book-main\diabetes-book-main"

# Map of directory folder names to their language suffixes
$folders = @{
    "gorduranofigadofinlandesshopify" = "FI"
    "gorduranofigadoeslovenoshopify"  = "SL"
    "gorduranofigadotchecoshopify"   = "CS"
    "gorduranofigadohungaroshopify"   = "HU"
    "gorduranofigadogregoshopify"     = "EL"
    "gorduranofigadoromenoshopify"    = "RO"
    "gorduranofigadoeslovacoshopify"  = "SK"
    "gorduranofigadocroatashopify"    = "HR"
    "gorduranofigadobulgaroshopify"   = "BG"
    "gorduranofigadoestonianoshopify" = "ET"
    "gorduranofigadoturcoshopify"     = "TR"
    "gorduranofigadonorueguesshopify" = "NO"
}

# The files mapping patterns
$file_mappings = @(
    @{ pattern = "*IMAGEM1*.png"; target = "gordura_IMAGEM1_{suffix}.png" }
    @{ pattern = "*IMAGEM2*.png"; target = "gordura_IMAGEM2_{suffix}.png" }
    @{ pattern = "*IMAGEM3*.jpg"; target = "gordura_IMAGEM3_{suffix}.jpg" }
    @{ pattern = "*IMAGEM4*.jpg"; target = "gordura_IMAGEM4_{suffix}.jpg" }
    @{ pattern = "*IMAGEM5*.png"; target = "gordura_IMAGEM5_{suffix}.png" }
    @{ pattern = "*AVL1*.jpg";     target = "gordura_1_{suffix}.jpg" }
    @{ pattern = "*AVL2*.jpg";     target = "gordura_2_{suffix}.jpg" }
    @{ pattern = "*AVL3*.jpg";     target = "gordura_3_{suffix}.jpg" }
    @{ pattern = "*AVL4*.jpg";     target = "gordura_4_{suffix}.jpg" }
)

foreach ($folder in $folders.Keys) {
    $suffix = $folders[$folder]
    $dir_path = Join-Path $base_dir $folder
    
    if (-not (Test-Path $dir_path)) {
        Write-Warning "Directory not found: $dir_path"
        continue
    }
    
    Write-Host "--- Processing Folder: $folder (Suffix: $suffix) ---"
    
    foreach ($mapping in $file_mappings) {
        $pattern = $mapping.pattern
        $target_name = $mapping.target.Replace("{suffix}", $suffix)
        
        $files = Get-ChildItem -Path $dir_path -Filter $pattern
        
        foreach ($file in $files) {
            $old_path = $file.FullName
            $new_path = Join-Path $dir_path $target_name
            
            # Avoid renaming a file to its own name if it's already renamed
            if ($file.Name -eq $target_name) {
                Write-Host "Already correct: $($file.Name)"
                continue
            }
            
            if (Test-Path $new_path) {
                Remove-Item -Path $new_path -Force
            }
            
            Rename-Item -Path $old_path -NewName $target_name -Force
            Write-Host "Renamed: $($file.Name) -> $target_name"
        }
    }
}

Write-Host "Image renaming process complete!"
