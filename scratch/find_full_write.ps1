$json = Get-Content -Path 'C:\Users\Usuario\.gemini\antigravity\brain\c108fe07-8526-413e-a96c-94253c72cfc5\.system_generated\logs\transcript.jsonl' -Raw
$lines = $json -split "\r?\n"
foreach ($line in $lines) {
    if ($line -like "*`"step_index`":718,*") {
        $obj = ConvertFrom-Json $line
        Write-Host $obj.tool_calls[0].args.CodeContent
    }
}
