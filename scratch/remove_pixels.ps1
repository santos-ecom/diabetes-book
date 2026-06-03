$dirs = @(
    "canceralemaoshopify",
    "cancerfrancesshopify",
    "cancerholandesshopify",
    "canceritalianoshopify",
    "cancerpolonesshopify"
)

$base_dir = "c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main"

foreach ($dir in $dirs) {
    $file_path = Join-Path $base_dir (Join-Path $dir "index.html")
    if (Test-Path $file_path) {
        $html = Get-Content -Path $file_path -Raw -Encoding UTF8
        
        # 1. Remove UTMify window.pixelId script block (with raw/endraw tags)
        $html = [System.Text.RegularExpressions.Regex]::Replace($html, "(?i)<script>\s*\{\x25\s*raw\s*\x25\}\s*window\.pixelId[\s\S]*?\{\x25\s*endraw\s*\x25\}\s*<\/script>\s*", "")
        
        # 2. Remove UTMify external javascript script block
        $html = [System.Text.RegularExpressions.Regex]::Replace($html, "(?i)<script[^>]*src=`"https:\/\/cdn\.utmify\.com\.br\/scripts\/utms\/latest\.js`"[^>]*>\s*<\/script>\s*", "")
        
        # 3. Remove Facebook Pixel script block (with raw/endraw tags)
        $html = [System.Text.RegularExpressions.Regex]::Replace($html, "(?i)<script>\s*\{\x25\s*raw\s*\x25\}\s*!function\(f,b,e,v,n,t,s\)[\s\S]*?\{\x25\s*endraw\s*\x25\}\s*<\/script>\s*", "")
        
        # 4. Remove Facebook Pixel noscript block
        $html = [System.Text.RegularExpressions.Regex]::Replace($html, "(?i)<noscript>\s*<img[^>]*src=`"https:\/\/www\.facebook\.com\/tr\?id=[\s\S]*?<\/noscript>\s*", "")
        
        [System.IO.File]::WriteAllText($file_path, $html, [System.Text.Encoding]::UTF8)
        Write-Host "Removed pixels and UTMify tracking from: $dir/index.html"
    } else {
        Write-Warning "File not found: $file_path"
    }
}
