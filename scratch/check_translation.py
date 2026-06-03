# -*- coding: utf-8 -*-
import re

french_markers = [
    r'\bavec\b', r'\bdans\b', r'\bpour\b', r'\bune\b', r'\bvous\b', r'\bvotre\b',
    r'\bnotre\b', r'\bmais\b', r'\bavec\b', r'\baux\b', r'\bpar\b', r'\bceux\b',
    r'\bcelles\b', r'\bCette\b', r'\belles\b', r'\bils\b', r'\bheur\b', r'\bheures\b',
    r'\btermin\b', r'\bscription\b', r'\bconçu\b', r'\bexclusivement\b', r'\baider\b',
    r'\bconçu\b', r'\besprit\b', r'\bréclame\b', r'\burgence\b', r'\bdépenser\b',
    r'\bfortune\b', r'\blimitée\b', r'\brecevez\b', r'\bmagnifique\b', r'\bréduction\b',
    r'\bmassive\b', r'\binfiniment\b', r'\bmoindre\b', r'\bdîner\b', r'\bchange\b',
    r'\bradicalement\b', r'\bcours\b', r'\btéléchargement\b', r'\bimmédiat\b',
    r'\bpaiement\b', r'\brecevrez\b', r'\baccès\b', r'\brenoncez\b', r'\bjamais\b',
    r'\bespérer\b', r'\bmeilleur\b', r'\brenforçant\b', r'\bdéfenses\b', r'\bcorps\b',
    r'\bsentir\b', r'\bdurement\b', r'\bréprimé\b', r'\brestrictions\b', r'\baident\b',
    r'\bdouloureux\b', r'\bcommande\b', r'\bprofitez\b', r'\bspéciale\b', r'\boffre\b',
    r'\bFournissez\b', r'\babondance\b', r'\bnutriments\b', r'\bessentiels\b',
    r'\bréparer\b', r'\brégénérer\b', r'\bdétoxifier\b', r'\bguérir\b', r'\blutter\b',
    r'\bsaine\b', r'\bfaute\b', r'\bcombattre\b'
]

with open('cancerportugues/index.html', 'r', encoding='utf-8') as f:
    lines = f.readlines()

found_any = False
for idx, line in enumerate(lines):
    # Skip style blocks, script blocks, metadata, links, etc.
    clean_line = re.sub(r'<style.*?>.*?</style>', '', line, flags=re.DOTALL)
    clean_line = re.sub(r'<script.*?>.*?</script>', '', clean_line, flags=re.DOTALL)
    clean_line = re.sub(r'<[^>]+>', ' ', clean_line)  # strip html tags
    
    for marker in french_markers:
        if re.search(marker, clean_line, re.IGNORECASE):
            # Additional check to verify it looks like French
            print(f"Line {idx+1}: {line.strip()}")
            found_any = True
            break

if not found_any:
    print("No French text markers found.")
