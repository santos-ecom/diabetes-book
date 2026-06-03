import os

file_path = r"c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main\diabetesarabeshopify\index.html"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

# 1. Update Title and script title
title_old = "<title>نظام غذائي لمرضى السكري - Smart Select</title>"
title_new = '<script>document.title = "أسهل نظام غذائي لمرضى السكري بعد الستين – Smart Select";</script>\n    <title>أسهل نظام غذائي لمرضى السكري بعد الستين – Smart Select</title>'
content = content.replace(title_old, title_new)

# 2. Add CSS overrides
css_override = """        /* ===== HIDE SHOPIFY THEME HEADER/FOOTER ===== */
        .shopify-section-group-header-group, .shopify-section-group-footer-group,
        [class*="header-group"], [class*="footer-group"],
        [id*="shopify-section-header"], [id*="shopify-section-footer"],
        .shopify-section-header, .shopify-section-footer,
        .site-header, .site-footer, .announcement-bar,
        #shopify-section-announcement-bar, .shopify-section-utility-bar,
        #shopify-section-utility-bar, .main-page-title { display: none !important; }

        [id*="shopify-section-"], .shopify-section,
        [class*="custom-liquid"], [class*="custom_liquid"],
        [class*="custom-liquid-padding"], [class*="custom_liquid-padding"],
        [class*="template--"][class*="-padding"],
        #MainContent, main, main.wp-block-group,
        .wp-site-blocks, .wp-site-blocks > main,
        .main-content, .page-width, .gradient, .wrapper, #page, .page-container {
            padding-top: 0 !important; padding-bottom: 0 !important;
            margin-top: 0 !important; margin-bottom: 0 !important;
            max-width: 100% !important; width: 100% !important;
            border: none !important; box-shadow: none !important;
        }

        [id*="shopify-section-"], .shopify-section,
        [class*="custom-liquid"], [class*="custom_liquid"],
        [class*="custom-liquid-padding"], [class*="custom_liquid-padding"],
        [class*="template--"][class*="-padding"],
        #MainContent, .main-content, .page-width, .gradient, .wrapper, #page, .page-container {
            background: transparent !important; background-color: transparent !important;
        }

        html, body { margin: 0 !important; padding: 0 !important; }
        html { background-color: #e42628 !important; font-size: 16px !important; }
        body { background-color: #fec259 !important; }

        .wp-site-blocks p:not([class*="-font-size"]),
        .wp-site-blocks li:not([class*="-font-size"]),
        .wp-site-blocks a:not([class*="-font-size"]),
        .wp-site-blocks span:not([class*="-font-size"]),
        .wp-site-blocks div:not([class*="-font-size"]) {
            font-family: var(--wp--preset--font-family--system-sans-serif) !important;
            font-size: var(--wp--preset--font-size--medium) !important;
            line-height: 1.55 !important;
        }

        .wp-site-blocks h1, .wp-site-blocks h2, .wp-site-blocks h3,
        .wp-site-blocks h4, .wp-site-blocks h5, .wp-site-blocks h6 {
            font-family: var(--wp--preset--font-family--system-sans-serif) !important;
            line-height: 1.2 !important;
        }

        .wp-site-blocks p:not([class*="-color"]):not([style*="color"]):not([class*="countdown"]):not([class*="time"]),
        .wp-site-blocks li:not([class*="-color"]):not([style*="color"]):not([class*="countdown"]):not([class*="time"]),
        .wp-site-blocks a:not([class*="-color"]):not([style*="color"]):not([class*="countdown"]):not([class*="time"]),
        .wp-site-blocks span:not([class*="-color"]):not([style*="color"]):not([class*="countdown"]):not([class*="time"]),
        .wp-site-blocks div:not([class*="-color"]):not([style*="color"]):not([class*="countdown"]):not([class*="time"]),
        .wp-site-blocks h1:not([class*="-color"]):not([style*="color"]):not([class*="countdown"]):not([class*="time"]),
        .wp-site-blocks h2:not([class*="-color"]):not([style*="color"]):not([class*="countdown"]):not([class*="time"]),
        .wp-site-blocks h3:not([class*="-color"]):not([style*="color"]):not([class*="countdown"]):not([class*="time"]),
        .wp-site-blocks h4:not([class*="-color"]):not([style*="color"]):not([class*="countdown"]):not([class*="time"]),
        .wp-site-blocks h5:not([class*="-color"]):not([style*="color"]):not([class*="countdown"]):not([class*="time"]),
        .wp-site-blocks h6:not([class*="-color"]):not([style*="color"]):not([class*="countdown"]):not([class*="time"]),
        .wp-site-blocks strong:not([class*="-color"]):not([style*="color"]):not([class*="countdown"]):not([class*="time"]),
        .wp-site-blocks em:not([class*="-color"]):not([style*="color"]):not([class*="countdown"]):not([class*="time"]) {
            color: #111111 !important;
        }

        .ip-countdown-sticky,
        .ip-countdown-sticky .countdown-label,
        .ip-countdown-sticky .time-separator,
        .ip-countdown-sticky .time-label { color: #ffffff !important; }

        .wp-block-button__link.has-background.wp-element-button,
        .wp-block-button__link,
        .wp-element-button {
            background-color: #01bc00 !important;
            color: #ffffff !important;
            border-radius: 20px !important;
            font-family: var(--wp--preset--font-family--system-sans-serif) !important;
            font-size: var(--wp--preset--font-size--medium) !important;
            font-weight: bold !important;
            padding: 14px 20px !important;
            text-decoration: none !important;
            display: inline-block !important;
            box-shadow: var(--wp--preset--shadow--deep) !important;
            text-transform: uppercase !important;
        }

        .ip-countdown-sticky .time-card { color: #000000 !important; }
    </style>"""

content = content.replace("    </style>", css_override)

# 3. Change Hotmart checkout URLs to Shopify
checkout_old = "https://pay.hotmart.com/Q105713280J?checkoutMode=10"
checkout_new = "/ar/cart/43039028805709:1"
content = content.replace(checkout_old, checkout_new)

# 4. Remove footer
footer_block = """        <footer class="wp-block-template-part">
            <div class="wp-block-group has-global-padding is-layout-constrained wp-block-group-is-layout-constrained"
                style="padding-top:var(--wp--preset--spacing--50);padding-bottom:var(--wp--preset--spacing--50);">
                <div class="wp-block-columns alignwide is-layout-flex wp-block-columns-is-layout-flex"
                    style="flex-wrap:nowrap;">
                    <div class="wp-block-column" style="flex-basis:30%">
                        <p class="wp-block-site-title has-medium-font-size"><a href="/" target="_self" rel="home">سمارت سيلكت</a></p>
                        <p class="wp-block-site-tagline has-small-font-size">سمارت سيلكت</p>
                    </div>
                    <div class="wp-block-column" style="flex-basis:50%">
                        <nav aria-label="Navigation">
                            <ul class="wp-block-navigation__container">
                                <li class="wp-block-navigation-item wp-block-navigation-link"><a
                                        class="wp-block-navigation-item__content" href="/contato/"><span
                                            class="wp-block-navigation-item__label">اتصل بنا</span></a></li>
                                <li class="wp-block-navigation-item wp-block-navigation-link"><a
                                        class="wp-block-navigation-item__content" href="/privacy-policy/"><span
                                            class="wp-block-navigation-item__label">سياسة الخصوصية</span></a></li>
                                <li class="wp-block-navigation-item wp-block-navigation-link"><a
                                        class="wp-block-navigation-item__content"
                                        href="/refund-and-returns-policy/"><span
                                            class="wp-block-navigation-item__label">سياسة الاسترداد والإرجاع</span></a>
                                </li>
                                <li class="wp-block-navigation-item wp-block-navigation-link"><a
                                        class="wp-block-navigation-item__content" href="/terms-conditions/"><span
                                            class="wp-block-navigation-item__label">الشروط والأحكام</span></a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </footer>"""

content = content.replace(footer_block, "        <!-- FOOTER REMOVED FOR SHOPIFY -->")

# 5. Replace image names
images_map = {
    "assets/img1.png": "{{ 'product-bundle-v2-ar.png' | file_url }}",
    "assets/img2.png": "{{ '3books-bundle-v2-ar.png' | file_url }}",
    "assets/img3.png": "{{ 'lifestyle-1-v2-ar.png' | file_url }}",
    "assets/img4.png": "{{ 'lifestyle-2-v2-ar.png' | file_url }}",
    "assets/img5.png": "{{ '70off-banner-v2-ar.png' | file_url }}",
    "assets/review-1.png": "{{ 'review-1-v2-ar.png' | file_url }}",
    "assets/review-2.png": "{{ 'review-2-v2-ar.png' | file_url }}",
    "assets/review-3.png": "{{ 'review-3-v2-ar.png' | file_url }}",
    "assets/review-4.png": "{{ 'review-4-v2-ar.png' | file_url }}"
}

for old_path, new_tag in images_map.items():
    content = content.replace(old_path, new_tag)

with open(file_path, "w", encoding="utf-8") as f:
    f.write(content)

print("Replacement done successfully!")
