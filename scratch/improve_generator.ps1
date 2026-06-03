$filePath = "c:\Users\conta\Downloads\diabetes-book-main\diabetes-book-main\scratch\generate_gordura_multilang.ps1"
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# 1. Fix the typo `tehdæksemme` with `tehdäksemme`
$content = $content.Replace("tehdæksemme", "tehdäksemme")

# 2. Modify the replacements loop to sort by length of Finnish text descending
$oldLoop = @'
    # Replace texts from the language-specific mapping
    foreach ($replacement in $details.replacements) {
        $fi_text = $replacement[0]
        $target_text = $replacement[1]
        $content = $content.Replace($fi_text, $target_text)
    }
'@

$newLoop = @'
    # Replace texts from the language-specific mapping (sorted by length descending to prevent substring collisions)
    $sorted_replacements = $details.replacements | Sort-Object { $_[0].Length } -Descending
    foreach ($replacement in $sorted_replacements) {
        $fi_text = $replacement[0]
        $target_text = $replacement[1]
        $content = $content.Replace($fi_text, $target_text)
    }
'@

if ($content.Contains($oldLoop)) {
    $content = $content.Replace($oldLoop, $newLoop)
    Write-Host "Replaced loop structure successfully."
} else {
    Write-Warning "Could not find original loop structure in script."
}

[System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
Write-Host "Generator improvement complete!"
