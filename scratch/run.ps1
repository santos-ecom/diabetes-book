$code = Get-Content -Path scratch/generate_cancer_portugues.ps1 -Raw -Encoding UTF8
Invoke-Expression $code

