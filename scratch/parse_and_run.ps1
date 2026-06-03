# Read the template
$fr_html = Get-Content -Path 'gorduranofigadofrancesshopify/index.html' -Raw -Encoding UTF8

# Read the translation script as plain text
$script_lines = Get-Content -Path 'scratch/generate_gordura.ps1' -Encoding UTF8

$translations = @{}
$current_lang = $null
$in_replacements = $false

foreach ($line in $script_lines) {
    $line = $line.Trim()
    
    # Detect language block start, e.g., "polones" = @{
    if ($line -match '"([^"]+)"\s*=\s*@\{') {
        $current_lang = $Matches[1]
        $translations[$current_lang] = @{
            replacements = @()
        }
        $in_replacements = $false
        continue
    }
    
    if (-not $current_lang) { continue }
    
    # Detect block end
    if ($line -eq '}') {
        $current_lang = $null
        $in_replacements = $false
        continue
    }
    
    # Detect basic fields
    if ($line -match 'lang\s*=\s*"([^"]*)"') {
        $translations[$current_lang]['lang'] = $Matches[1]
    }
    elseif ($line -match 'suffix\s*=\s*"([^"]*)"') {
        $translations[$current_lang]['suffix'] = $Matches[1]
    }
    elseif ($line -match 'title\s*=\s*"([^"]*)"') {
        $translations[$current_lang]['title'] = $Matches[1]
    }
    elseif ($line -match 'countdown_label\s*=\s*"([^"]*)"') {
        $translations[$current_lang]['countdown_label'] = $Matches[1]
    }
    elseif ($line -match 'hours_label\s*=\s*"([^"]*)"') {
        $translations[$current_lang]['hours_label'] = $Matches[1]
    }
    elseif ($line -match 'minutes_label\s*=\s*"([^"]*)"') {
        $translations[$current_lang]['minutes_label'] = $Matches[1]
    }
    elseif ($line -match 'seconds_label\s*=\s*"([^"]*)"') {
        $translations[$current_lang]['seconds_label'] = $Matches[1]
    }
    
    # Detect replacements start
    if ($line -match 'replacements\s*=\s*@\(') {
        $in_replacements = $true
        continue
    }
    
    # Parse replacements array elements
    if ($in_replacements) {
        # Check for @("from", "to")
        # Regex to capture the two strings inside the @("...", "...") structure
        if ($line -match '@\("([\s\S]*?)",\s*"([\s\S]*?)"\)') {
            $from = $Matches[1].Replace('`r', "`r").Replace('`n', "`n")
            $to = $Matches[2].Replace('`r', "`r").Replace('`n', "`n")
            $translations[$current_lang]['replacements'] += ,($from, $to)
        }
    }
}

# Now generate pages
foreach ($lang_key in $translations.Keys) {
    $info = $translations[$lang_key]
    $dest_dir = "gorduranofigado${lang_key}shopify"
    
    if (-not (Test-Path $dest_dir)) {
        New-Item -Path $dest_dir -ItemType Directory | Out-Null
    }
    
    $html = $fr_html
    
    # Replace basic headers and language tags
    $html = $html.Replace('lang="fr"', 'lang="' + $info['lang'] + '"')
    
    # Replace countdown sticky and labels
    $html = $html.Replace("DERNIERES HEURES - 70% DE REDUCTION SE TERMINE BIENTOT", $info['countdown_label'])
    $html = $html.Replace("heures", $info['hours_label'])
    $html = $html.Replace("min", $info['minutes_label'])
    $html = $html.Replace("sec", $info['seconds_label'])
    
    # Replace variant ID references with a placeholder
    $html = [System.Text.RegularExpressions.Regex]::Replace($html, "/fr/cart/43049184428109:1", "/" + $info['lang'] + "/cart/TODO_VARIANT_ID:1")
    
    # Replace image suffixes
    $html = $html.Replace("_FR.png", "_" + $info['suffix'] + ".png")
    $html = $html.Replace("_FR.jpg", "_" + $info['suffix'] + ".jpg")
    
    # Perform translation replacements
    foreach ($rep in $info['replacements']) {
        $from = $rep[0]
        $to = $rep[1]
        $html = $html.Replace($from, $to)
    }
    
    $dest_file = Join-Path $dest_dir "index.html"
    [System.IO.File]::WriteAllText($dest_file, $html, [System.Text.Encoding]::UTF8)
    Write-Host "Generated page for $lang_key"
}
