import html.parser
import sys

class HTMLStructureParser(html.parser.HTMLParser):
    def __init__(self):
        super().__init__()
        self.tags = []
        
    def handle_starttag(self, tag, attrs):
        # Ignore script, noscript, title, meta, link tags
        if tag in ['script', 'noscript', 'meta', 'link', 'title', 'br']:
            return
        attrs_dict = dict(attrs)
        # We care about structural attributes like class, style, id, src, alt, href (structure-ish)
        relevant_attrs = {}
        for k in ['class', 'style', 'id', 'src', 'alt']:
            if k in attrs_dict:
                relevant_attrs[k] = attrs_dict[k]
        
        # href is checked but we ignore the exact target variant ID differences
        if 'href' in attrs_dict:
            relevant_attrs['href'] = 'LINK'
            
        self.tags.append((tag, relevant_attrs))

def compare_files(file1, file2):
    with open(file1, 'r', encoding='utf-8') as f:
        html1 = f.read()
    with open(file2, 'r', encoding='utf-8') as f:
        html2 = f.read()
        
    p1 = HTMLStructureParser()
    p1.feed(html1)
    
    p2 = HTMLStructureParser()
    p2.feed(html2)
    
    print(f"File 1 ({file1}) has {len(p1.tags)} tags")
    print(f"File 2 ({file2}) has {len(p2.tags)} tags")
    
    max_len = max(len(p1.tags), len(p2.tags))
    diffs = 0
    for i in range(max_len):
        t1 = p1.tags[i] if i < len(p1.tags) else None
        t2 = p2.tags[i] if i < len(p2.tags) else None
        
        if t1 != t2:
            print(f"Diff at index {i}:")
            print(f"  PL: {t1}")
            print(f"  SE: {t2}")
            diffs += 1
            if diffs > 30:
                print("Too many diffs, stopping...")
                break

if __name__ == "__main__":
    compare_files(
        r"c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main\diabetespolonesshopify\index.html",
        r"c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main\diabetessuecoshopify\index.html"
    )
