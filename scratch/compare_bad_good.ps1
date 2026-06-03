$bad = Get-Content 'diabetesnoruegues2/index.html' -Raw
$good = Get-Content 'diabetesnoruegues/index.html' -Raw

$badMain = [regex]::Match($bad, '(?s)<main.*?</main>').Value
$goodMain = [regex]::Match($good, '(?s)<main.*?</main>').Value

function Get-Structure($html) {
    $html = [regex]::Replace($html, '(?s)<script.*?>.*?</script>', '')
    $html = [regex]::Replace($html, '(?s)>[^<]+<', '><')
    $html = [regex]::Replace($html, 'src="[^"]+"', 'src="image_placeholder"')
    $html = [regex]::Replace($html, 'href="[^"]+"', 'href="link_placeholder"')
    return $html.Trim()
}

$badStruct = Get-Structure($badMain)
$goodStruct = Get-Structure($goodMain)

if ($badStruct -eq $goodStruct) {
    Write-Host "HTML structures are identical!"
} else {
    Write-Host "HTML structures differ!"
    $badFile = "scratch/bad_struct.html"
    $goodFile = "scratch/good_struct.html"
    Set-Content -Path $badFile -Value $badStruct -Encoding utf8
    Set-Content -Path $goodFile -Value $goodStruct -Encoding utf8
    
    Compare-Object (Get-Content $badFile) (Get-Content $goodFile) | Select-Object -First 50
}
