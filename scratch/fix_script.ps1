$filePath = "c:\Users\conta\Downloads\diabetes-book-main\diabetes-book-main\scratch\generate_gordura_multilang.ps1"
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# Construct "Tässä on se, mitä ihmiset sanovat meistä" dynamically using char codes
$tassa = "T" + [char]0x00e4 + "ss" + [char]0x00e4 + " on se, mit" + [char]0x00e4 + " ihmiset sanovat meist" + [char]0x00e4

# Match any mangled variation of Tässä on se... in the script mapping
$pattern = '@\(''T.+?ss.+? on se, mit.+? ihmiset sanovat meist.+?'',\s*''([^'']+)''\)'

$matches = [regex]::Matches($content, $pattern)
Write-Host "Found matches: $($matches.Count)"

$newContent = [regex]::Replace($content, $pattern, {
    param($m)
    $val = $m.Groups[1].Value.Trim().TrimEnd(':').Trim()
    return "@('$tassa', '$val')"
})

[System.IO.File]::WriteAllText($filePath, $newContent, [System.Text.Encoding]::UTF8)
Write-Host "Rebuilt and cleaned generator file successfully!"
