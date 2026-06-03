$base_dir = "c:\Users\conta\Downloads\diabetes-book-main\diabetes-book-main"
$template_path = Join-Path $base_dir "diabetespolonesshopify\index.html"
$dest_dir = Join-Path $base_dir "diabetestchecoshopify"

if (-not (Test-Path $template_path)) {
    Write-Error "Polish template not found at $template_path"
    exit 1
}

if (-not (Test-Path $dest_dir)) {
    New-Item -ItemType Directory -Path $dest_dir -Force | Out-Null
    Write-Host "Created directory: $dest_dir"
}

$template_content = [System.IO.File]::ReadAllText($template_path, [System.Text.Encoding]::UTF8)

# Translation mappings list (all using single quotes to avoid smart quote delimiter issues)
$cukrovka_typ2 = 'Kucha' + [char]0x00f9 + 'ka pro cukrovku 2. typu'
$nejjednodussi = 'Nejjednodu' + [char]0x0161 + [char]0x0161 + [char]0x00ed + ' dieta pro diabetiky po ' + [char]0x0161 + 'edes' + [char]0x00e1 + 'tce'
$dieta_pro_diabetiky = 'Dieta pro diabetiky'
$posledni_hodiny = [char]0x23f0 + ' POSLEDNÍ HODINY – 70% SLEVA KONČÍ ZA'
$hod = 'hod'
$min = 'min'
$sek = 'sek'
$hero_question = 'Je vám více než 60 let a snažíte se mít pod kontrolou hladinu cukru v krvi, aniž byste se museli vzdát svých oblíbených jídel?'
$pokud_ano = 'Pokud ANO, ' + [char]0x010d + 't' + [char]0x011b + 'te d' + [char]0x00e1 + 'le…'
$book_alt = 'Nejjednodu' + [char]0x0161 + [char]0x0161 + [char]0x00ed + ' dieta pro diabetiky po ' + [char]0x0161 + 'edes' + [char]0x00e1 + 'tce – produktov' + [char]0x00e1 + ' fotografie'
$usetrite = 'U' + [char]0x0161 + 'et' + [char]0x0159 + [char]0x00ed + 'te 70 %'
$koupit_nyni = 'KOUPIT NYNÍ'
$kupte_1 = 'KUPTE 1, ZÍSKEJTE 3'
$pouze_po = 'Pouze po omezenou dobu – zde je to, co získáte:'
$balicek_3 = 'Balí' + [char]0x010d + 'ek 3 knih – Dieta pro diabetiky'
$myslite_si = 'Myslíte si, že musíte jíst nudné jídlo bez chuti, abyste měli cukrovku po ' + [char]0x0161 + 'edes' + [char]0x00e1 + 'tce pod kontrolou?'
$zamyslete_se = 'Zamyslete se znovu.'
$pravdou_je = 'Pravdou je, že většina diet při cukrovce pro seniory je <em>příliš restriktivní</em> a zanechává pocit frustrace, hladu a skleslosti.'
$pravdepodobne = 'Pravděpodobně vám bylo řečeno, abyste se vzdali sacharidů, obětovali chuť nebo se navždy vzdali svých oblíbených jídel.'
$co_kdyby = '<strong>Co kdyby kontrola hladiny cukru v krvi nemusela být trestem?</strong> S <em>Nejjednodu' + [char]0x0161 + [char]0x0161 + [char]0x00ed + ' dietou pro diabetiky po ' + [char]0x0161 + 'edes' + [char]0x00e1 + 'tce</em> zjistíte, že zdravé stravování při cukrovce neznamená odříkání — jde o chytrá rozhodnutí podložená vědou, která podpoří vaše tělo, energii a život po šedesátce. Tento snadno srozumitelný průvodce vyvrací mýty a dává vám přesně to, co potřebujete, abyste se dobře stravovali, dobře žili a získali zpět kontrolu nad svým zdravím — bez trávení hodin v kuchyni nebo spoléhání se na jídla bez chuti.'
$zivotni_styl = 'Životní styl při dietě pro diabetiky'
$tento_bestseller = 'Tento bestseller obsahuje:'
$list1 = '✅ <strong>Jednoduchý plán diety pro diabetiky krok za krokem</strong> vytvořený speciálně pro lidi po šedesátce'
$list2 = '✅ <strong>Snadno připravitelné recepty</strong> z běžných surovin (žádné složité nebo drahé produkty!)'
$list3 = '✅ <strong>Výživové rady</strong>, které pracují s vaším stárnoucím metabolismem — a ne proti němu'
$list4 = '✅ <strong>Praktické tipy</strong> na zvýšení energie, snížení hladiny cukru v krvi a přirozené snížení HbA1c'
$list5 = '✅ <strong>Lahodná jídla</strong>, která podporují zdraví srdce, kontrolu hmotnosti a citlivost na inzulin'
$list6 = '✅ <strong>Tipy na nákupy</strong> a ukázkové jídelníčky pro usnadnění života'
$list7 = '✅ <strong>Odborníky schválené a vědou podložené strategie</strong>, abyste se každý den cítili lépe'
$zdrave_jidlo = 'Zdravé jídlo pro diabetiky'
$banner_sleva = 'Banner 70% sleva'
$foto_balicku = 'Fotografie balíčku produktů'
$zvladani = 'Zvládání cukrovky po šedesátce nemusí být zdrcující ani matoucí.'
$pokud_mate = 'Pokud máte dost složitých jídelníčků, nevýrazného jídla a neustálého přemýšlení, co je „bezpečné“ jíst, tento balíček je pro vás. Nejjednodušší dieta pro diabetiky po šedesátce je jasný, praktický a vědecky podložený průvodce navržený speciálně pro starší dospělé, kteří chtěli mít pod kontrolou hladinu cukru v krvi, chránit své srdce a zvýšit energii — aniž by se museli vzdát jídel, která milují. Okamžité digitální stažení – jedná se o e-knihy (po dokončení platby budete mít okamžitě možnost stáhnout si produkt na děkovné stránce a krátce poté obdržíte také e-mail s odkazem).'
$bonus1 = '<strong>BONUS 1</strong>: <strong>Kuchařka pro cukrovku 2. typu</strong>'
$bonus2 = '<strong>BONUS 2</strong>: <strong>Kuchařka a jídelníček pro nově diagnostikované</strong>'
$zacnete_jist = 'Začněte jíst chytřeji, cítit se silnější a žít lépe – již dnes.'
$prejdete_nahoru = 'Přejdete nahoru a klikněte na tlačítko „KOUPIT NYNÍ“! Získejte svou kopii hned teď, než sleva skončí!'
$objednejte_nyni = 'Objednejte nyní a ušetřete 70 %, než tato časově omezená nabídka vyprší.'
$review1_alt = 'Hodnocení zákazníka 1'
$review2_alt = 'Hodnocení zákazníka 2'
$review3_alt = 'Hodnocení zákazníka 3'
$review4_alt = 'Hodnocení zákazníka 4'
$zde_je_co = 'Zde je to, co o nás říkají ostatní:'

$replacements = @(
    @('lang="pl"', 'lang="cs"'),
    @('Dieta dla Diabetyków – Smart Select', "$dieta_pro_diabetiky – Smart Select"),
    @('⏰ OSTATNIE GODZINY – 70% ZNIŻKI KOŃCZY SIĘ ZA', $posledni_hodiny),
    @('godz', $hod),
    @('min', $min),
    @('sek', $sek),
    @('Masz powyżej 60 lat i zmagasz się z kontrolowaniem poziomu cukru we krwi, nie chcąc rezygnować z ulubionych potraw?', $hero_question),
    @('Jeśli TAK, czytaj dalej…', $pokud_ano),
    @('Najprostsza Dieta Dla Diabetyków Po 60-tce – zdjęcie produktu', $book_alt),
    @('Najprostsza Dieta Dla Diabetyków Po 60-tce', $nejjednodussi),
    @('87zł', '490 Kč'),
    @('290zł', '1490 Kč'),
    @('Oszczędzasz 70%', $usetrite),
    @('/pl/cart/43011722084429:1', '/cs/cart/TODO_VARIANT_ID:1'),
    @('KUP TERAZ', $koupit_nyni),
    @('KUP 1, OTRZYMAJ 3', $kupte_1),
    @('Tylko przez ograniczony czas – oto, co otrzymasz:', $pouze_po),
    @('Pakiet 3 książek – Dieta dla diabetyków', $balicek_3),
    @('Czy uważasz, że musisz jeść nudne, pozbawione smaku jedzenie, aby kontrolować cukrzycę po 60-tce?', $myslite_si),
    @('Zastanów się jeszcze raz.', $zamyslete_se),
    @('Prawda jest taka, że większość diet dla seniorów z cukrzycą jest <em>zbyt restrykcyjna</em> i pozostawia uczucie frustracji, głodu i przygnębienia.', $pravdou_je),
    @('Prawdopodobnie powiedziano Ci, abyś zrezygnował z węglowodanów, poświęcił smak lub na zawsze zrezygnował z ulubionych potraw.', $pravdepodobne),
    @('<strong>A co jeśli kontrolowanie poziomu cukru we krwi nie musiałoby być karą?</strong> Z <em>Najprostszą Dietą Dla Diabetyków Po 60-tce</em> odkryjesz, że zdrowe odżywianie przy cukrzycy nie oznacza wyrzeczeń — chodzi o mądre, poparte nauką wybory, które wspierają Twoje ciało, energię i życie po 60-tce. Ten łatwy do zrozumienia przewodnik obala mity i daje Ci dokładnie to, czego potrzebujesz, aby dobrze jeść, dobrze żyć i odzyskać kontrolę nad swoim zdrowiem — bez spędzania godzin w kuchni czy polegania na jałowych posiłkach.', $co_kdyby),
    @('Styl życia przy diecie dla diabetyków', $zivotni_styl),
    @('Ten Bestseller Zawiera:', $tento_bestseller),
    @('✅ <strong>Prosty, krok po kroku plan diety dla diabetyków</strong> opracowany specjalnie dla osób po 60. roku życia', $list1),
    @('✅ <strong>Łatwe do przygotowania przepisy</strong> z codziennych składników (bez wymyślnych lub drogich produktów!)', $list2),
    @('✅ <strong>Porady żywieniowe</strong>, które współpracują z Twoim starzejącym się metabolizmem — a nie przeciwko niemu', $list3),
    @('✅ <strong>Praktyczne wskazówki</strong> na temat poprawy energii, obniżenia poziomu cukru we krwi i naturalnego obniżenia HbA1c', $list4),
    @('✅ <strong>Pyszne posiłki</strong>, które wspierają zdrowie serca, kontrolę wagi i wrażliwość na insulinę', $list5),
    @('✅ <strong>Wskazówki dotyczące zakupów</strong> i przykładowe plany posiłków, aby ułatwić życie', $list6),
    @('✅ <strong>Zatwierdzone przez ekspertów, poparte nauką strategie</strong>, abyś każdego dnia czuł się lepiej', $list7),
    @('Zdrowy posiłek dla diabetyków', $zdrave_jidlo),
    @('Baner 70% zniżki', $banner_sleva),
    @('Zdjęcie pakietu produtos', $foto_balicku),
    @('Zarządzanie cukrzycą po 60-tce nie musi być przytłaczające ani mylące.', $zvladani),
    @('Jeśli masz dość skomplikowanych planów posiłków, mdłego jedzenia i ciągłego zastanawiania się, co jest "bezpieczne" do zjedzenia, ten pakiet jest dla Ciebie. Najprostsza Dieta Dla Diabetyków Po 60-tce to jasny, praktyczny i naukowo udokumentowany przewodnik, zaprojektowany specjalnie dla starszych dorosłych, którzy chcą kontrolować poziom cukru we krwi, chronić serce i zwiększyć energię — bez rezygnacji z potraw, które kochają. Natychmiastowe pobieranie cyfrowe – to są e-booki (po zakończeniu płatności od razu będziesz mieć możliwość pobrania produktu ze strony z podziękowaniem, a wkrótce po tym otrzymasz również wiadomość e-mail z linkiem).', $pokud_mate),
    @('<strong>BONUS 1</strong>: <strong>Książka Kucharska dla Cukrzyków Typu 2</strong>', $bonus1),
    @('<strong>BONUS 2</strong>: <strong>Książka Kucharska i Plan Posiłków dla Nowo Zdiagnozowanych</strong>', $bonus2),
    @('Zacznij mądrzej jeść, czuć się silniejszym i lepiej żyć – już dziś.', $zacnete_jist),
    @('Przewiń do góry i kliknij przycisk "KUP TERAZ"! Zdobądź swój egzemplarz już teraz, zanim skończy się zniżka!', $prejdete_nahoru),
    @('Zamów teraz i zaoszczędź 70%, zanim ta ograniczona czasowo oferta zniknie.', $objednejte_nyni),
    @('Opinia klienta 1', $review1_alt),
    @('Opinia klienta 2', $review2_alt),
    @('Opinia klienta 3', $review3_alt),
    @('Opinia klienta 4', $review4_alt),
    @('Oto co mówią o nas inni:', $zde_je_co),
    @('Här är vad andra säger om oss:', $zde_je_co)
)

$content = $template_content

# 1. Replace image filenames to point to correct multilingual formats (-pl to -cs)
$content = $content.Replace("IMAGE1-pl.png", "IMAGE1-cs.png")
$content = $content.Replace("IMAGE2-pl.png", "IMAGE2-cs.png")
$content = $content.Replace("IMAGE3-pl.png", "IMAGE3-cs.png")
$content = $content.Replace("IMAGE4-pl.png", "IMAGE4-cs.png")
$content = $content.Replace("IMAGE5-pl.png", "IMAGE5-cs.png")
$content = $content.Replace("new-review-1-pl.png", "new-review-1-cs.png")
$content = $content.Replace("new-review-2-pl.png", "new-review-2-cs.png")
$content = $content.Replace("new-review-3-pl.png", "new-review-3-cs.png")
$content = $content.Replace("new-review-4-pl.png", "new-review-4-cs.png")

# 2. Sort replacements by the source text length in descending order to prevent substring collisions
$sorted_replacements = $replacements | Sort-Object { $_[0].Length } -Descending

foreach ($r in $sorted_replacements) {
    $search = $r[0]
    $replace = $r[1]
    $content = $content.Replace($search, $replace)
}

# 3. Save the translated file
$dest_file = Join-Path $dest_dir "index.html"
[System.IO.File]::WriteAllText($dest_file, $content, [System.Text.Encoding]::UTF8)

Write-Host "Czech Shopify diabetes landing page generation complete!"
