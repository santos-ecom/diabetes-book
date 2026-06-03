$pol = Get-Content 'diabetespolonesshopify/index.html' -Encoding utf8
$nor = Get-Content 'diabetesnorueguesshopify/index.html' -Encoding utf8

function Normalize-Line($line) {
    $line = [regex]::Replace($line, '(?s)>[^<]+<', '><')
    $line = [regex]::Replace($line, '(?s)^[^<]+<', '<')
    $line = [regex]::Replace($line, '>[^<]+$', '>')
    $line = $line -replace 'lang="pl"', 'lang="no"'
    $line = $line -replace '/pl/', '/no/'
    $line = $line -replace '43022642151437', '43034781548621'
    $line = $line -replace '-pl', '-no'
    $line = $line -replace 'Opinia klienta', 'Kundeomtale'
    $line = $line -replace 'GODZINY', 'TIMER'
    return $line.Trim()
}

$polNorm = @()
foreach ($l in $pol) {
    $norm = Normalize-Line $l
    if ($norm -ne "") {
        $polNorm += $norm
    }
}

$norNorm = @()
foreach ($l in $nor) {
    $norm = Normalize-Line $l
    if ($norm -ne "") {
        $norNorm += $norm
    }
}

Compare-Object $polNorm $norNorm -IncludeEqual:$false | Select-Object -First 40
