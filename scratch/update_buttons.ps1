$rootDir = "c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main"

# Files to update
$origHtml = "$rootDir\diabetesnoruegues\index.html"
$shopHtml = "$rootDir\diabetesnorueguesshopify\index.html"

# 1. Update original Norwegian page buttons
if (Test-Path $origHtml) {
    $content = Get-Content -Path $origHtml -Raw -Encoding utf8
    
    # Replace buttons
    $oldBtn = 'style="border-radius:20px;background-color:#01bc00;box-shadow:var(--wp--preset--shadow--deep)"><strong>KJØP NÅ</strong></a>'
    $newBtn = 'style="border-radius:20px;background-color:#01bc00;box-shadow:var(--wp--preset--shadow--deep);color:#ffffff !important;"><strong style="color:#ffffff !important;">KJØP NÅ</strong></a>'
    $content = $content.Replace($oldBtn, $newBtn)
    
    Set-Content -Path $origHtml -Value $content -Encoding utf8
    Write-Host "Original Norwegian page buttons updated."
}

# 2. Update Shopify Norwegian page buttons and add high-specificity CSS rules
if (Test-Path $shopHtml) {
    $content = Get-Content -Path $shopHtml -Raw -Encoding utf8
    
    # Replace buttons
    $oldBtn = 'style="border-radius:20px;background-color:#01bc00;box-shadow:var(--wp--preset--shadow--deep)"><strong>KJØP NÅ</strong></a>'
    $newBtn = 'style="border-radius:20px;background-color:#01bc00;box-shadow:var(--wp--preset--shadow--deep);color:#ffffff !important;"><strong style="color:#ffffff !important;">KJØP NÅ</strong></a>'
    $content = $content.Replace($oldBtn, $newBtn)
    
    # Ingest button override style rule before </style>
    $cssOverride = @"
        /* Force checkout button styling on all Shopify themes */
        .wp-block-button__link.has-background.wp-element-button,
        .wp-block-button__link,
        .wp-element-button {
            background-color: #01bc00 !important;
            color: #ffffff !important;
            border-radius: 20px !important;
            font-family: var(--wp--preset--font-family--system-sans-serif) !important;
            font-size: var(--wp--preset--font-size--medium) !important;
            font-weight: bold !important;
            padding: 14px 20px !important;
            text-decoration: none !important;
            display: inline-block !important;
            box-shadow: var(--wp--preset--shadow--deep) !important;
            text-transform: uppercase !important;
        }
        
        .ip-countdown-sticky .time-card {
            color: #000000 !important;
        }
"@

    # Replace the old countdown rule with the new one + cssOverride
    $oldCountdownRule = @"
        .ip-countdown-sticky .time-card {
            color: #000000 !important;
        }
"@
    
    if ($content -notlike "*Force checkout button styling*") {
        $content = $content.Replace($oldCountdownRule, $cssOverride)
    }
    
    Set-Content -Path $shopHtml -Value $content -Encoding utf8
    Write-Host "Shopify Norwegian page buttons and CSS updated."
}
