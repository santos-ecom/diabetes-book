import os
import re

def parse_ps1_translations(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # We want to extract the translations dictionary.
    # It contains keys: "polones", "holandes", "sueco", "dinamarques", "noruegues"
    languages = ["polones", "holandes", "sueco", "dinamarques", "noruegues"]
    translations = {}
    
    for lang in languages:
        # Find the block for this language: "lang" = @{ ... }
        # Let's search for the language key and everything up to the next language key or end of dict.
        pattern = r'"' + lang + r'"\s*=\s*@\{([\s\S]*?)\n\s*\}'
        match = re.search(pattern, content)
        if not match:
            print(f"Could not find translation block for {lang}")
            continue
        
        block = match.group(1)
        
        # Parse basic fields
        lang_code_m = re.search(r'lang\s*=\s*"([^"]*)"', block)
        suffix_m = re.search(r'suffix\s*=\s*"([^"]*)"', block)
        title_m = re.search(r'title\s*=\s*"([^"]*)"', block)
        countdown_m = re.search(r'countdown_label\s*=\s*"([^"]*)"', block)
        hours_m = re.search(r'hours_label\s*=\s*"([^"]*)"', block)
        minutes_m = re.search(r'minutes_label\s*=\s*"([^"]*)"', block)
        seconds_m = re.search(r'seconds_label\s*=\s*"([^"]*)"', block)
        
        lang_code = lang_code_m.group(1) if lang_code_m else ""
        suffix = suffix_m.group(1) if suffix_m else ""
        title = title_m.group(1) if title_m else ""
        countdown_label = countdown_m.group(1) if countdown_m else ""
        hours_label = hours_m.group(1) if hours_m else ""
        minutes_label = minutes_m.group(1) if minutes_m else ""
        seconds_label = seconds_m.group(1) if seconds_m else ""
        
        # Parse replacements array
        # Format is @("from", "to"),
        replacements = []
        # Find all @("...", "...")
        # Note: strings inside can contain unescaped quotes or escaped ones, but they are double quoted.
        # Let's parse line by line or find matches
        rep_block_m = re.search(r'replacements\s*=\s*@\(([\s\S]*?)\)', block)
        if rep_block_m:
            rep_block = rep_block_m.group(1)
            # Find all tuples: @("from", "to")
            # We can use regex that finds @("...", "...")
            # To handle multiline, we can find @(" followed by anything up to ", " followed by anything up to ")
            # We'll use a regex that matches double quoted strings.
            # A double quoted string in powershell might have escaped quotes or be simple.
            # Let's do a regex to find each replacement pair:
            pairs = re.findall(r'@\("((?:[^"]|"(?="))*?)",\s*"((?:[^"]|"(?="))*?)"\)', rep_block)
            for pair in pairs:
                # Replace powershell backtick escapes `r `n with actual newlines/carriage returns
                from_str = pair[0].replace('`r', '\r').replace('`n', '\n')
                to_str = pair[1].replace('`r', '\r').replace('`n', '\n')
                replacements.append((from_str, to_str))
        
        translations[lang] = {
            'lang': lang_code,
            'suffix': suffix,
            'title': title,
            'countdown_label': countdown_label,
            'hours_label': hours_label,
            'minutes_label': minutes_label,
            'seconds_label': seconds_label,
            'replacements': replacements
        }
        
    return translations

def main():
    template_path = 'gorduranofigadofrancesshopify/index.html'
    if not os.path.exists(template_path):
        print(f"Template path {template_path} not found.")
        return
        
    with open(template_path, 'r', encoding='utf-8') as f:
        fr_html = f.read()
        
    translations = parse_ps1_translations('scratch/generate_gordura.ps1')
    
    for lang_key, info in translations.items():
        dest_dir = f"gorduranofigado{lang_key}shopify"
        os.makedirs(dest_dir, exist_ok=True)
        
        html = fr_html
        
        # Replace basic headers and language tags
        html = html.replace('lang="fr"', f'lang="{info["lang"]}"')
        
        # Replace countdown sticky and labels
        html = html.replace("DERNIERES HEURES - 70% DE REDUCTION SE TERMINE BIENTOT", info["countdown_label"])
        html = html.replace("heures", info["hours_label"])
        html = html.replace("min", info["minutes_label"])
        html = html.replace("sec", info["seconds_label"])
        
        # Replace variant ID references with a placeholder
        html = re.sub(r'/fr/cart/43049184428109:1', f'/{info["lang"]}/cart/TODO_VARIANT_ID:1', html)
        
        # Replace image suffixes
        html = html.replace("_FR.png", f'_{info["suffix"]}.png')
        html = html.replace("_FR.jpg", f'_{info["suffix"]}.jpg')
        
        # Perform translation replacements
        for from_str, to_str in info['replacements']:
            html = html.replace(from_str, to_str)
            
        dest_file = os.path.join(dest_dir, "index.html")
        with open(dest_file, 'w', encoding='utf-8') as f:
            f.write(html)
        print(f"Generated page for {lang_key}")

if __name__ == '__main__':
    main()
