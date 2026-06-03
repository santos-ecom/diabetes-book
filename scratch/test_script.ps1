$filePath = "c:\Users\conta\Downloads\diabetes-book-main\diabetes-book-main\scratch\generate_gordura_multilang.ps1"
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

$match = [regex]::Match($content, "tehd(.)ksemme")
if ($match.Success) {
    $char = $match.Groups[1].Value
    $code = [int][char]$char
    Write-Host "Character is '$char' with code $code"
} else {
    Write-Host "No match for tehd(.)ksemme"
}
