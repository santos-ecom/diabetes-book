# UTF8 encoding
$french_markers = @(
    'avec', 'dans', 'pour', 'une', 'vous', 'votre',
    'notre', 'mais', 'aux', 'par', 'ceux',
    'celles', 'Cette', 'elles', 'ils', 'heur', 'heures',
    'termin', 'scription', 'conçu', 'exclusivement', 'aider',
    'esprit', 'réclame', 'urgence', 'dépenser',
    'fortune', 'limitée', 'recevez', 'magnifique', 'réduction',
    'massive', 'infiniment', 'moindre', 'dîner', 'change',
    'radicalement', 'cours', 'téléchargement', 'immédiat',
    'paiement', 'recevrez', 'accès', 'renoncez', 'jamais',
    'espérer', 'meilleur', 'renforçant', 'défenses', 'corps',
    'sentir', 'durement', 'réprimé', 'restrictions', 'aident',
    'douloureux', 'commande', 'profitez', 'spéciale', 'offre',
    'Fournissez', 'abondance', 'nutriments', 'essentiels',
    'réparer', 'régénérer', 'détoxifier', 'guérir', 'lutter',
    'saine', 'faute', 'combattre'
)

$html = Get-Content -Path 'cancerportugues/index.html' -Raw -Encoding UTF8

# Remove scripts and styles
$html_clean = [System.Text.RegularExpressions.Regex]::Replace($html, '(?s)<style.*?>.*?</style>', '')
$html_clean = [System.Text.RegularExpressions.Regex]::Replace($html_clean, '(?s)<script.*?>.*?</script>', '')
# Remove HTML tags
$html_clean = [System.Text.RegularExpressions.Regex]::Replace($html_clean, '<[^>]+>', ' ')

$lines = $html_clean -split "`r?`n"

$found = $false
for ($i = 0; $i -lt $lines.Length; $i++) {
    $line = $lines[$i]
    foreach ($marker in $french_markers) {
        # Word boundary match
        $pattern = "\b" + [System.Text.RegularExpressions.Regex]::Escape($marker) + "\b"
        if ([System.Text.RegularExpressions.Regex]::IsMatch($line, $pattern, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)) {
            $line_num = $i + 1
            Write-Host "Line ${line_num}: $($line.Trim())"
            $found = $true
            break
        }
    }
}

if (-not $found) {
    Write-Host "No French text markers found."
}
