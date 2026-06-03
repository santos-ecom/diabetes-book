$rootDir = "c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main"
$origHtml = "$rootDir\diabetesnoruegues\index.html"
$shopHtml = "$rootDir\diabetesnorueguesshopify\index.html"

# Construct KJØP NÅ using unicode code points:
# K = 0x4B, J = 0x4A, Ø = 0xD8, P = 0x50, space = 0x20, N = 0x4E, Å = 0xC5
$kjopNa = [char]0x4B + [char]0x4A + [char]0xD8 + [char]0x50 + [char]0x20 + [char]0x4E + [char]0xC5

Write-Host "Target word constructed: $kjopNa"

function Update-FileButtons($filePath, $word) {
    if (Test-Path $filePath) {
        $content = Get-Content -Path $filePath -Raw -Encoding utf8
        
        $oldStrong = "<strong>$word</strong>"
        $newStrong = "<strong style=""color:#ffffff !important;"">$word</strong>"
        
        if ($content -like "*$oldStrong*") {
            $content = $content.Replace($oldStrong, $newStrong)
            Set-Content -Path $filePath -Value $content -Encoding utf8
            Write-Host "Updated strong tags in $filePath"
        } else {
            Write-Host "Pattern $oldStrong not found in $filePath (already updated or encoding mismatch)."
        }
    } else {
        Write-Host "File not found: $filePath"
    }
}

Update-FileButtons $origHtml $kjopNa
Update-FileButtons $shopHtml $kjopNa
