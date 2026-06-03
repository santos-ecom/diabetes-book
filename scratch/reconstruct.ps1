# Path to transcript
$log_path = 'C:\Users\Usuario\.gemini\antigravity\brain\c108fe07-8526-413e-a96c-94253c72cfc5\.system_generated\logs\transcript.jsonl'

# Read all lines
$lines = Get-Content -Path $log_path -Raw
$json_lines = $lines -split "\r?\n"

$content = ""
$recovered = $false

# 1. Recover the initial content from step 718
foreach ($jl in $json_lines) {
    if ($jl -like "*`"step_index`":718,*") {
        $obj = ConvertFrom-Json $jl
        $content = $obj.tool_calls[0].args.CodeContent
        $recovered = $true
        Write-Host "Recovered base content from step 718 (Length: $($content.Length))"
        break
    }
}

if (-not $recovered) {
    Write-Host "Failed to find step 718."
    exit
}

# 2. Iterate through subsequent steps and apply edits sequentially
foreach ($jl in $json_lines) {
    if ([string]::IsNullOrEmpty($jl)) { continue }
    
    $obj = ConvertFrom-Json $jl -ErrorAction SilentlyContinue
    if (-not $obj -or $obj.step_index -le 718) { continue }
    
    if ($obj.tool_calls) {
        foreach ($tc in $obj.tool_calls) {
            if ($tc.args.TargetFile -like "*rebuild_pages_clean.ps1*") {
                Write-Host "Applying edit from step $($obj.step_index) (Tool: $($tc.name))"
                
                if ($tc.name -eq "replace_file_content") {
                    $target = $tc.args.TargetContent
                    $replacement = $tc.args.ReplacementContent
                    
                    if (-not $content.Contains($target)) {
                        Write-Host "  WARNING: Target content not found in step $($obj.step_index)!"
                    } else {
                        $content = $content.Replace($target, $replacement)
                        Write-Host "  Successfully replaced content."
                    }
                }
                elseif ($tc.name -eq "multi_replace_file_content") {
                    $chunks = $tc.args.ReplacementChunks
                    # Sort chunks by StartLine descending to avoid offset changes affecting earlier lines,
                    # but since we are doing simple string replacement, we can just replace them.
                    # Note: ReplacementChunks is a JSON array.
                    foreach ($chunk in $chunks) {
                        $target = $chunk.TargetContent
                        $replacement = $chunk.ReplacementContent
                        if (-not $content.Contains($target)) {
                            Write-Host "  WARNING: Chunk target content not found in step $($obj.step_index)!"
                        } else {
                            $content = $content.Replace($target, $replacement)
                            Write-Host "  Successfully replaced chunk."
                        }
                    }
                }
            }
        }
    }
}

[System.IO.File]::WriteAllText('rebuild_pages_clean.ps1', $content, [System.Text.Encoding]::UTF8)
Write-Host "Reconstructed rebuild_pages_clean.ps1 successfully! Length: $($content.Length)"
