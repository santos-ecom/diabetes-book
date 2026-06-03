$filePath = "c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main\diabetesbulgaro\index.html"
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# Replace language code
$content = $content.Replace('html lang="en-US"', 'html lang="bg"')

# Replace title
$content = $content.Replace('<title>Diabetic Diet – Smart Select</title>', '<title>Диета при Диабет – Smart Select</title>')

# Replace sticky countdown text
$content = $content.Replace('FINAL HOURS – 70% OFF ENDS IN', 'ПОСЛЕДНИ ЧАСОВЕ – 70% ОТСТЪПКА ПРИКЛЮЧВА СЛЕД')
$content = $content.Replace('<span class="time-label">hh</span>', '<span class="time-label">чч</span>')
$content = $content.Replace('<span class="time-label">mm</span>', '<span class="time-label">мм</span>')
$content = $content.Replace('<span class="time-label">ss</span>', '<span class="time-label">сс</span>')

# Replace intro text
$content = $content.Replace('Are You Over 60 and Struggling to Control Your Blood Sugar Without Giving Up the Foods You Love?', 'Вие сте на възраст над 60 години и се борите да контролирате кръвната си захар, без да се отказвате от храните, които обичате?')
$content = $content.Replace('If YES, then keep reading…', 'Ако отговорът е ДА, тогава продължете да четете…')

# Replace product main section
$content = $content.Replace('src="assets/product-img.png" alt="The Easiest Diabetic Diet After 60 – product image"', 'src="assets/product-img.png" alt="Най-лесната диета при диабет след 60 – изображение на продукта"')
$content = $content.Replace('The Easiest Diabetic Diet After 60', 'Най-лесната диета при диабет след 60')
$content = $content.Replace('You Save 70%', 'Спестявате 70%')
$content = $content.Replace('<strong>BUY NOW</strong>', '<strong>КУПЕТЕ СЕГА</strong>')

# Replace Buy 1 get 3
$content = $content.Replace('BUY 1 GET 3', 'КУПЕТЕ 1, ПОЛУЧЕТЕ 3')
$content = $content.Replace('Only for a limited time, here is what you will get:', 'Само за ограничено време, ето какво ще получите:')
$content = $content.Replace('alt="3 Books Bundle – Diabetic Diet"', 'alt="Пакет от 3 книги – Диета при диабет"')

# Replace sub-headline
$content = $content.Replace('Do You Believe You Have to Eat Boring, Tasteless Food to Manage Your Diabetes After 60?', 'Вярвате ли, че трябва да ядете скучна, безвкусна храна, за да управлявате диабета си след 60?')
$content = $content.Replace('<strong>Think again.</strong>', '<strong>Помислете отново.</strong>')
$content = $content.Replace('The truth is, most diets for seniors with diabetes are <em>far too restrictive</em> and leave you feeling frustrated, hungry, and defeated.', 'Истината е, че повечето диети за възрастни хора с диабет са <em>твърде ограничителни</em> и ви карат да се чувствате разочаровани, гладни и победени.')
$content = $content.Replace('You have probably been told to cut carbs, ditch flavor, or give up your favorite meals forever.', 'Вероятно са ви казали да намалите въглехидратите, да се откажете от вкуса или да се откажете от любимите си ястия завинаги.')
$content = $content.Replace('<strong>But what if managing your blood sugar didn’t have to feel like a punishment?</strong>', '<strong>Но какво ще стане, ако управлението на кръвната ви захар не трябва да се усеща като наказание?</strong>')

$longText1 = 'With <em>The Easiest Diabetic Diet After 60</em>, you will discover that eating well with diabetes is not about deprivation – it is about smart, science-backed choices that support your body, your energy, and your life after 60. This easy-to-follow guide busts the myths and gives you exactly what you need to eat well, live well, and reclaim control of your health – without spending hours in the kitchen or relying on bland meals.'
$longText1Bg = 'С <em>Най-лесната диета при диабет след 60</em> ще откриете, че доброто хранене при диабет не е свързано с лишения – става дума за интелигентни, научно обосновани избори, които поддържат тялото ви, вашата енергия и живота ви след 60. Това лесно за следване ръководство разбива митовете и ви дава точно това, от което се нуждаете, за да се храните добре, да живеете добре и да си върнете контрола над здравето си – без да прекарвате часове в кухнята или да разчитате на безвкусни ястия.'
$content = $content.Replace($longText1, $longText1Bg)

# Replace alt lifestyle image
$content = $content.Replace('alt="Lifestyle image diabetic diet"', 'alt="Изображение на начин на живот при диета за диабет"')

# Replace bestseller section
$content = $content.Replace('This Bestseller Contains:', 'Този бестселър съдържа:')
$content = $content.Replace('✅ <strong>A simple, step-by-step diabetic diet plan</strong> tailored specifically for people over 60', '✅ <strong>Опростен диетичен план при диабет стъпка по стъпка</strong>, създаден специално за хора над 60 години')
$content = $content.Replace('✅ <strong>Easy-to-prepare recipes</strong> using everyday ingredients (no fancy or expensive food!)', '✅ <strong>Лесни за приготвяне рецепти</strong> с ежедневни съставки (без сложни или скъпи храни!)')
$content = $content.Replace('✅ <strong>Nutritional guidance</strong> that works with your aging metabolism – not against it', '✅ <strong>Хранителни насоки</strong>, които работят с вашия забавен метаболизъм при стареене – а не срещу него')
$content = $content.Replace('✅ <strong>Practical tips</strong> to boost energy, lower blood sugar, and reduce A1C naturally', '✅ <strong>Практически съвети</strong> за повишаване на енергията, понижаване на кръвната захар и намаляване на A1C по естествен начин')
$content = $content.Replace('✅ <strong>Delicious meals</strong> that support heart health, weight management, and insulin sensitivity', '✅ <strong>Вкусни ястия</strong>, които поддържат здравето на сърцето, управлението на теглото и инсулиновата чувствителност')
$content = $content.Replace('✅ <strong>Grocery shopping tips</strong> and sample meal plans to make life easier', '✅ <strong>Съвети за пазаруване</strong> и примерни планове за хранене, за да улесните живота си')
$content = $content.Replace('✅ <strong>Expert-approved, science-backed strategies</strong> to help you feel better every day', '✅ <strong>Одобрени от експерти, научно подкрепени стратегии</strong>, които да ви помогнат да се чувствате по-добре всеки ден')

# Replace image 4, 5, 1 alt tags
$content = $content.Replace('alt="Healthy meal for diabetics"', 'alt="Здравословно ястие за диабетици"')
$content = $content.Replace('alt="70% off banner"', 'alt="Банер за 70% отстъпка"')
$content = $content.Replace('alt="Product bundle image"', 'alt="Изображение на пакета от продукти"')

# Replace long paragraph
$content = $content.Replace('Managing diabetes after 60 doesn’t have to be overwhelming or confusing.', 'Управлението на диабета след 60 години не трябва да бъде непосилно или объркващо.')

$longText2 = 'If you are tired of complex meal plans, bland food, and constantly guessing what is “safe” to eat, this bundle is for you. The Easiest Diabetic Diet After 60 is a clear, practical, and science-backed guide designed specifically for older adults who want to control their blood sugar, protect their heart, and boost their energy – without giving up the foods they love. Instant digital download – these are e-books (After payment is completed, you will immediately have the option to download the product(s) from the final purchase page, and you will also receive a download email shortly after).'
$longText2Bg = 'Ако сте уморени от сложни хранителни планове, безвкусна храна и постоянно отгатване какво е „безопасно“ за ядене, този пакет е за вас. „Най-лесната диета при диабет след 60“ е ясно, практично и научно обосновано ръководство, създадено специално за по-възрастни хора, които искат да контролират кръвната си захар, да предпазят сърцето си и да повишат енергията си – без да се отказват от храните, които обичат. Незабавно цифрово изтегляне – това са електронни книги (След завършване на плащането веднага ще имате възможност да изтеглите продукта(ите) от крайната страница за покупка, а малко след това ще получите и имейл за изтегляне).'
$content = $content.Replace($longText2, $longText2Bg)

# Replace bonuses
$content = $content.Replace('+ <strong>BONUS 1</strong>: <strong>Type 2 Diabetes Cookbook</strong>', '+ <strong>БОНУС 1</strong>: <strong>Готварска книга за диабет тип 2</strong>')
$content = $content.Replace('+ <strong>BONUS 2</strong>: <strong>Diabetes Cookbook & Meal Plan for Newly Diagnosed</strong>', '+ <strong>БОНУС 2</strong>: <strong>Готварска книга и хранителен план за новодиагностицирани с диабет</strong>')

# Replace CTA
$content = $content.Replace('Start eating smarter, feeling stronger, and living better – today.', 'Започнете да се храните по-умно, да се чувствате по-силни и да живеете по-добре – днес.')
$content = $content.Replace('<strong>Scroll up and click the “BUY NOW” button! Grab your copy now before the discount expires!</strong>', '<strong>Превъртете нагоре и кликнете върху бутона „КУПЕТЕ СЕГА“! Вземете вашето копие сега, преди отстъпката да изтече!</strong>')
$content = $content.Replace('<em>Order now and save 70% before this limited-time deal disappears.</em>', '<em>Поръчайте сега и спестете 70%, преди тази ограничена оферта да изчезне.</em>')

# Replace reviews intro and alts
$content = $content.Replace('Here is what others are saying about us:', 'Ето какво казват другите за нас:')
$content = $content.Replace('alt="Customer review 1"', 'alt="Рецензия на клиент 1"')
$content = $content.Replace('alt="Customer review 2"', 'alt="Рецензия на клиент 2"')
$content = $content.Replace('alt="Customer review 3"', 'alt="Рецензия на клиент 3"')
$content = $content.Replace('alt="Customer review 4"', 'alt="Рецензия на клиент 4"')

# Replace footer links
$content = $content.Replace('Contact Us', 'Свържете се с нас')
$content = $content.Replace('Privacy Policy', 'Политика за поверителност')
$content = $content.Replace('Refund and Returns Policy', 'Политика за възстановяване на суми и връщане')
$content = $content.Replace('Terms and Conditions', 'Правила и условия')

[System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
Write-Host "Translation to Bulgarian complete!"
