$base_dir = "c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main"

# Configuration for files, prices, and currencies
# Using regex patterns to match any previous format of 19.90 / 59.70 (with € or already modified zł/kr)
$config = @(
    @{
        Path = "gorduranofigadopolonesshopify\index.html"
        Price = "89 zł"
        Compare = "269 zł"
    },
    @{
        Path = "cancerpolonesshopify\index.html"
        Price = "89 zł"
        Compare = "269 zł"
    },
    @{
        Path = "gorduranofigadosuecoshopify\index.html"
        Price = "229 kr"
        Compare = "689 kr"
    },
    @{
        Path = "gorduranofigadodinamarquesshopify\index.html"
        Price = "149 kr"
        Compare = "449 kr"
    },
    @{
        Path = "gorduranofigadonorueguesshopify\index.html"
        Price = "229 kr"
        Compare = "689 kr"
    }
)

foreach ($item in $config) {
    $file_path = Join-Path $base_dir $item.Path
    if (Test-Path $file_path) {
        $html = Get-Content -Path $file_path -Raw -Encoding UTF8
        
        # Regex replace 19.90 or 19,90 followed by optional spacing and symbols (like €, zł, kr)
        $html = [System.Text.RegularExpressions.Regex]::Replace($html, "19[.,]90\s*(?:€|zł|kr\.?)", $item.Price)
        
        # Regex replace 59.70 or 59,70 followed by optional spacing and symbols (like €, zł, kr)
        $html = [System.Text.RegularExpressions.Regex]::Replace($html, "59[.,]70\s*(?:€|zł|kr\.?)", $item.Compare)
        
        [System.IO.File]::WriteAllText($file_path, $html, [System.Text.Encoding]::UTF8)
        Write-Host "Successfully updated prices in: $($item.Path)"
    } else {
        Write-Warning "File not found: $file_path"
    }
}
