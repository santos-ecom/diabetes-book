import os
import re

# Paths
workspace_dir = r"c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main"
shopify_dir = os.path.join(workspace_dir, "diabetesnorueguesshopify")
assets_dir = os.path.join(shopify_dir, "assets")
html_file = os.path.join(shopify_dir, "index.html")

# Image mapping
image_mapping = {
    "IMAGE1pq.png": "IMAGE1-no.png",
    "IMAGE2pq.png": "IMAGE2-no.png",
    "IMAGE3pq.webp": "IMAGE3-no.webp",
    "IMAGE4pq.webp": "IMAGE4-no.webp",
    "IMAGE5pq.png": "IMAGE5-no.png",
    "AVL1.png": "AVL1-no.png",
    "AVL2.png": "AVL2-no.png",
    "AVL3.png": "AVL3-no.png",
    "AVL4.png": "AVL4-no.png",
}

# 1. Rename files in assets directory
print("Renaming files in assets directory...")
for old_name, new_name in image_mapping.items():
    old_path = os.path.join(assets_dir, old_name)
    new_path = os.path.join(assets_dir, new_name)
    if os.path.exists(old_path):
        os.rename(old_path, new_path)
        print(f"Renamed: {old_name} -> {new_name}")
    else:
        print(f"File not found: {old_path}")

# 2. Update HTML file
print("\nUpdating references in index.html...")
if os.path.exists(html_file):
    with open(html_file, "r", encoding="utf-8") as f:
        content = f.read()

    for old_name, new_name in image_mapping.items():
        # Match both raw file name and Shopify Liquid tags
        content = content.replace(old_name, new_name)

    with open(html_file, "w", encoding="utf-8") as f:
        f.write(content)
    print("Updated index.html successfully.")
else:
    print(f"HTML file not found: {html_file}")
