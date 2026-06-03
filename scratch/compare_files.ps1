$swe = Get-Content 'diabetessuecoshopify/index.html' -Encoding utf8
$nor = Get-Content 'diabetesnorueguesshopify/index.html' -Encoding utf8

# Helper to normalize lines (remove text content, keep tags/classes/styles)
function Normalize-Line($line) {
    # Replace Swedish/Norwegian text with a placeholder
    $line = [regex]::Replace($line, '(?s)>[^<]+<', '><')
    $line = [regex]::Replace($line, '(?s)^[^<]+<', '<')
    $line = [regex]::Replace($line, '>[^<]+$', '>')
    # Normalize language attribute, variant IDs, subdomains, image names
    $line = $line -replace 'lang="sv"', 'lang="no"'
    $line = $line -replace '/se/', '/no/'
    $line = $line -replace '43022642380877', '43034781548621'
    $line = $line -replace '-se', '-no'
    $line = $line -replace 'SISTA TIMMARNA', 'SISTE TIMER'
    $line = $line -replace 'tt', 'timer'
    $line = $line -replace 'mm', 'min'
    $line = $line -replace 'ss', 'sek'
    return $line.Trim()
}

$sweNorm = @()
foreach ($l in $swe) {
    $norm = Normalize-Line $l
    if ($norm -ne "") {
        $sweNorm += $norm
    }
}

$norNorm = @()
foreach ($l in $nor) {
    $norm = Normalize-Line $l
    if ($norm -ne "") {
        $norNorm += $norm
    }
}

Compare-Object $sweNorm $norNorm -IncludeEqual:$false | Select-Object -First 50
