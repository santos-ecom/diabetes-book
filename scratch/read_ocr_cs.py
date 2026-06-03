import json

log_path = r"C:\Users\conta\.gemini\antigravity\brain\fa9e4535-d5a1-493e-a636-c72d812b0552\.system_generated\logs\transcript.jsonl"

with open(log_path, 'r', encoding='utf-8') as f:
    for line in f:
        try:
            step = json.loads(line)
            if step.get("source") == "MODEL" and "tool_calls" in step:
                for tool in step["tool_calls"]:
                    if tool.get("name") == "write_to_file" and "ocr.cs" in tool.get("args", {}).get("TargetFile", ""):
                        print("FOUND OCR.CS WRITE:")
                        print(tool["args"]["CodeContent"])
                        print("="*40)
        except Exception as e:
            pass
