$json = Get-Content -Path 'C:\Users\Usuario\.gemini\antigravity\brain\c108fe07-8526-413e-a96c-94253c72cfc5\.system_generated\logs\transcript.jsonl' -Raw
$lines = $json -split "\r?\n"
$rebuilt = @{}

# Parse logs and find all view_file outputs of rebuild_pages_clean.ps1
foreach ($line in $lines) {
    if ($line -like "*VIEW_FILE*" -and $line -like "*rebuild_pages_clean.ps1*") {
        try {
            $obj = ConvertFrom-Json $line -ErrorAction SilentlyContinue
            if ($obj -and $obj.content) {
                # Extract line number range from the view_file arguments or content
                # Format: "Showing lines 1 to 100"
                if ($obj.content -match 'Showing lines (\d+) to (\d+)') {
                    $start = [int]$Matches[1]
                    $end = [int]$Matches[2]
                    
                    $raw_lines = $obj.content -split "\r?\n"
                    foreach ($rl in $raw_lines) {
                        if ($rl -match '^(\d+):\s?(.*)$') {
                            $ln = [int]$Matches[1]
                            $rebuilt[$ln] = $Matches[2]
                        }
                    }
                }
            }
        } catch {}
    }
}

if ($rebuilt.Count -gt 0) {
    $keys = $rebuilt.Keys | Sort-Object
    $final_lines = @()
    foreach ($k in $keys) {
        $final_lines += $rebuilt[$k]
    }
    $content = $final_lines -join "`r`n"
    [System.IO.File]::WriteAllText('rebuild_pages_clean.ps1', $content, [System.Text.Encoding]::UTF8)
    Write-Host "Assembled rebuild_pages_clean.ps1 successfully with $($rebuilt.Count) lines!"
} else {
    Write-Host "Failed to find any lines."
}
