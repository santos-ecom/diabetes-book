$html = Get-Content 'cancerportugues/index.html' -Raw -Encoding UTF8

$replacements = @{
    'IMAG1.png' = 'IMG1 (2).png'
    'IMAG2.png' = 'IMG2 (1).png'
    'IMG3.png' = 'IMG3 (1).png'
    'IMAG4.jpg' = 'IMG4 (1).png'
    'AVL1.png' = 'DEPOIMENTOS (1).png'
    'AVL2.png' = 'DEPOIMENTOS (2).png'
    'AVL3.png' = 'DEPOIMENTOS (3).png'
    'AVL4.png' = 'DEPOIMENTOS (4).png'
    'https://pay.hotmart.com/A105903706A?checkoutMode=10' = 'https://pay.hotmart.com/I106053694X'
    'https://pay.hotmart.com/A105903706A' = 'https://pay.hotmart.com/I106053694X'
}

foreach ($key in $replacements.Keys) {
    $html = $html.Replace($key, $replacements[$key])
}

[System.IO.File]::WriteAllText("$(Get-Location)/cancerportugues/index.html", $html, [System.Text.Encoding]::UTF8)
Write-Host "Updated cancerportugues/index.html successfully."
