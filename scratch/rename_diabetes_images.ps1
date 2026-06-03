$base_dir = "c:\Users\conta\Downloads\diabetes-book-main\diabetes-book-main"

# Map of directory folder names to their language suffixes
$folders = @{
    "diabetestchecoshopify"   = "cs"
    "diabeteshungaroshopify"   = "hu"
    "diabetesgregoshopify"     = "el"
    "diabetesromenoshopify"    = "ro"
    "diabeteseslovacoshopify"  = "sk"
    "diabetesestonianoshopify" = "et"
}

# The files mapping patterns
$file_mappings = @(
    @{ pattern = "*IMAGEM1*.png"; target = "diabetes_IMAGE1_{suffix}.png"; html_replace = "IMAGE1-{suffix}.png" }
    @{ pattern = "*IMAGEM2*.png"; target = "diabetes_IMAGE2_{suffix}.png"; html_replace = "IMAGE2-{suffix}.png" }
    @{ pattern = "*IMAGEM3*.jpg"; target = "diabetes_IMAGE3_{suffix}.jpg"; html_replace = "IMAGE3-{suffix}.png" }
    @{ pattern = "*IMAGEM4*.jpg"; target = "diabetes_IMAGE4_{suffix}.jpg"; html_replace = "IMAGE4-{suffix}.png" }
    @{ pattern = "*IMAGEM5*.png"; target = "diabetes_IMAGE5_{suffix}.png"; html_replace = "IMAGE5-{suffix}.png" }
    @{ pattern = "*AVL1*.jpg";     target = "diabetes_review_1_{suffix}.jpg"; html_replace = "new-review-1-{suffix}.png" }
    @{ pattern = "*AVL2*.jpg";     target = "diabetes_review_2_{suffix}.jpg"; html_replace = "new-review-2-{suffix}.png" }
    @{ pattern = "*AVL3*.jpg";     target = "diabetes_review_3_{suffix}.jpg"; html_replace = "new-review-3-{suffix}.png" }
    @{ pattern = "*AVL4*.jpg";     target = "diabetes_review_4_{suffix}.jpg"; html_replace = "new-review-4-{suffix}.png" }
)

foreach ($folder in $folders.Keys) {
    $suffix = $folders[$folder]
    $dir_path = Join-Path $base_dir $folder
    
    if (-not (Test-Path $dir_path)) {
        Write-Warning "Directory not found: $dir_path"
        continue
    }
    
    Write-Host "--- Processing Folder: $folder (Suffix: $suffix) ---"
    
    # 1. Update the index.html file references
    $html_path = Join-Path $dir_path "index.html"
    if (Test-Path $html_path) {
        $html_content = [System.IO.File]::ReadAllText($html_path, [System.Text.Encoding]::UTF8)
        
        foreach ($mapping in $file_mappings) {
            $search_name = $mapping.html_replace.Replace("{suffix}", $suffix)
            $replace_name = $mapping.target.Replace("{suffix}", $suffix)
            
            $html_content = $html_content.Replace($search_name, $replace_name)
        }
        
        [System.IO.File]::WriteAllText($html_path, $html_content, [System.Text.Encoding]::UTF8)
        Write-Host "Updated references in $html_path"
    } else {
        Write-Warning "index.html not found in $dir_path"
    }
    
    # 2. Rename physical files on disk
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

Write-Host "Diabetes image renaming process complete!"
