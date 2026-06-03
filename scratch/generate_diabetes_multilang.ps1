$base_dir = "c:\Users\conta\Downloads\diabetes-book-main\diabetes-book-main"
$template_path = Join-Path $base_dir "diabetespolonesshopify\index.html"

if (-not (Test-Path $template_path)) {
    Write-Error "Polish template not found at $template_path"
    exit 1
}

$template_content = [System.IO.File]::ReadAllText($template_path, [System.Text.Encoding]::UTF8)

# Define language mappings
$languages = @(
    @{
        name = "tcheco"
        lang = "cs"
        dest = "diabetestchecoshopify"
        replacements = @(
            @('lang="pl"', 'lang="cs"'),
            @('Dieta dla Diabetyków – Smart Select', 'Dieta pro diabetiky – Smart Select'),
            @('⏰ OSTATNIE GODZINY – 70% ZNIŻKI KOŃCZY SIĘ ZA', '⏰ POSLEDNÍ HODINY – 70% SLEVA KONČÍ ZA'),
            @('godz', 'hod'),
            @('min', 'min'),
            @('sek', 'sek'),
            @('Masz powyżej 60 lat i zmagasz się z kontrolowaniem poziomu cukru we krwi, nie chcąc rezygnować z ulubionych potraw?', 'Je vám více než 60 let a snažíte se mít pod kontrolou hladinu cukru v krvi, aniž byste se museli vzdát svých oblíbených jídel?'),
            @('Jeśli TAK, czytaj dalej…', 'Pokud ANO, čtěte dále…'),
            @('Najprostsza Dieta Dla Diabetyków Po 60-tce – zdjęcie produktu', 'Nejjednodušší dieta pro diabetiky po šedesátce – produktová fotografie'),
            @('Najprostsza Dieta Dla Diabetyków Po 60-tce', 'Nejjednodušší dieta pro diabetiky po šedesátce'),
            @('<strong>Najprostsza', '<strong>Nejjednodušší'),
            @('Dieta Dla Diabetyków Po 60-tce</strong>', 'dieta pro diabetiky po šedesátce</strong>'),
            @('87zł', '490 Kč'),
            @('290zł', '1490 Kč'),
            @('Oszczędzasz 70%', 'Ušetříte 70 %'),
            @('/pl/cart/43011722084429:1', '/cs/cart/TODO_VARIANT_ID:1'),
            @('KUP TERAZ', 'KOUPIT NYNÍ'),
            @('KUP 1, OTRZYMAJ 3', 'KUPTE 1, ZÍSKEJTE 3'),
            @('Tylko przez ograniczony czas – oto, co otrzymasz:', 'Pouze po omezenou dobu – zde je to, co získáte:'),
            @('Pakiet 3 książek – Dieta dla diabetyków', 'Balíček 3 knih – Dieta pro diabetiky'),
            @('Czy uważasz, że musisz jeść nudne, pozbawione smaku jedzenie, aby kontrolować cukrzycę po 60-tce?', 'Myslíte si, že musíte jíst nudné jídlo bez chuti, aby ste měli cukrovku po šedesátce pod kontrolou?'),
            @('Zastanów się jeszcze raz.', 'Zamyslete se znovu.'),
            @('Prawda jest taka, że większość diet dla seniorów z cukrzycą jest <em>zbyt restrykcyjna</em> i pozostawia uczucie frustracji, głodu i przygnębienia.', 'Pravdou je, že většina diet při cukrovce pro seniory je <em>příliš restriktivní</em> a zanechává pocit frustrace, hladu a skleslosti.'),
            @('Prawdopodobnie powiedziano Ci, abyś zrezygnował z węglowodanów, poświęcił smak lub na zawsze zrezygnował z ulubionych potraw.', 'Pravděpodobně vám bylo řečeno, abyste se vzdali sacharidů, obětovali chuť oder na vždy vzdali svých oblíbených jídel.'),
            @('<strong>A co jeśli kontrolowanie poziomu cukru we krwi nie musiałoby być karą?</strong> Z <em>Najprostszą Dietą Dla Diabetyków Po 60-tce</em> odkryjesz, że zdrowe odżywianie przy cukrzycy nie oznacza wyrzeczeń — chodzi o mądre, poparte nauką wybory, które wspierają Twoje ciało, energię i życie po 60-tce. Ten łatwy do zrozumienia przewodnik obala mity i daje Ci dokładnie to, czego potrzebujesz, aby dobrze jeść, dobrze żyć i odzyskać kontrolę nad swoim zdrowiem — bez spędzania godzin w kuchni czy polegania na jałowych posiłkach.', '<strong>Co kdyby kontrola hladiny cukru v krvi nemusela být trestem?</strong> S <em>Nejjednodušší dietou pro diabetiky po šedesátce</em> zjistíte, že zdravé stravování při cukrovce neznamená odříkání — jde o chytrá rozhodnutí podložená vědou, která podpoří vaše telo, energii a život po šedesátce. Tento snadno srozumitelný průvodce vyvrací mýty a dává vám přesně to, co potřebujete, aby jste se dobře stravovali, dobře žili a získali zpět kontrolu nad svým zdravím — bez trávení hodin v kuchyni nebo spoléhání se na jídla bez chuti.'),
            @('Styl życia przy diecie dla diabetyków', 'Životní styl při dietě pro diabetiky'),
            @('Ten Bestseller Zawiera:', 'Tento bestseller obsahuje:'),
            @('✅ <strong>Prosty, krok po kroku plan diety dla diabetyków</strong> opracowany specjalnie dla osób po 60. roku życia', '✅ <strong>Jednoduchý plán diéty pre diabetikov krok za krokom</strong> vytvořený speciálně pro lidi po šedesátce'),
            @('✅ <strong>Łatwe do przygotowania przepisy</strong> z codziennych składników (bez wymyślnych lub drogich produktów!)', '✅ <strong>Snadno připravitelné recepty</strong> z běžných surovin (žádné složité nebo drahé produkty!)'),
            @('✅ <strong>Porady żywieniowe</strong>, które współpracują z Twoim starzejącym się metabolizmem — a nie przeciwko niemu', '✅ <strong>Výživové rady</strong>, které pracují s vaším stárnoucím metabolismem — a ne proti němu'),
            @('✅ <strong>Praktyczne wskazówki</strong> na temat poprawy energii, obniżenia poziomu cukru we krwi i naturalnego obniżenia HbA1c', '✅ <strong>Praktické tipy</strong> na zvýšení energie, snížení hladiny cukru v krvi a přirozené snížení HbA1c'),
            @('✅ <strong>Pyszne posiłki</strong>, które wspierają zdrowie serca, kontrolę wagi i wrażliwość na insulinę', '✅ <strong>Lahodná jídla</strong>, která podporují zdraví srdce, kontrolu hmotnosti a citlivost na inzulin'),
            @('✅ <strong>Wskazówki dotyczące zakupów</strong> i przykładowe plany posiłków, aby ułatwić życie', '✅ <strong>Tipy na nákupy</strong> a ukázkové jídelníčky pro usnadnění života'),
            @('✅ <strong>Zatwierdzone przez ekspertów, poparte nauką strategie</strong>, abyś każdego dnia czuł się lepiej', '✅ <strong>Odborníky schválené a vědou podložené strategie</strong>, abyste se každý den cítili lépe'),
            @('Zdrowy posiłek dla diabetyków', 'Zdravé jídlo pro diabetiky'),
            @('Baner 70% zniżki', 'Banner 70% sleva'),
            @('Zdjęcie pakietu produtos', 'Fotografie balíčku produktů'),
            @('Zarządzanie cukrzycą po 60-tce nie musi być przytłaczające ani mylące.', 'Zvládanie cukrovky po šedesátce nemusí být zdrcující ani matoucí.'),
            @('Jeśli masz dość skomplikowanych planów posiłków, mdłego jedzenia i ciągłego zastanawiania się, co jest "bezpieczne" do zjedzenia, ten pakiet jest dla Ciebie. Najprostsza Dieta Dla Diabetyków Po 60-tce to jasny, praktyczny i naukowo udokumentowany przewodnik, zaprojektowany specjalnie dla starszych dorosłych, którzy chcą kontrolować poziom cukru we krwi, chronić serce i zwiększyć energię — bez rezygnacji z potraw, które kochają. Natychmiastowe pobieranie cyfrowe – to są e-booki (po zakończeniu płatności od razu będziesz mieć możliwość pobrania produktu ze strony z podziękowaniem, a wkrótce po tym otrzymasz również wiadomość e-mail z linkiem).', 'Pokud máte dost složitých jídelníčků, nevýrazného jídla a neustálého přemýšlení, co je „bezpečné“ jíst, tento balíček je pro vás. Nejjednodušší dieta pro diabetiky po šedesátce je jasný, praktický a vědecky podložený průvodce navržený speciálně pro starší dospělé, kteří chtěli mít pod kontrolou hladinu cukru v krvi, chránit své srdce a zvýšit energii — aniž by se museli vzdát jídel, která milují. Okamžité digitální stažení – jedná se o e-knihy (po dokončení platby budete mít okamžitě možnost stáhnout si produkt na děkovné stránce a krátce poté obdržíte også e-mail s odkazem).'),
            @('<strong>BONUS 1</strong>: <strong>Książka Kucharska dla Cukrzyków Typu 2</strong>', '<strong>BONUS 1</strong>: <strong>Kuchařka pro cukrovku 2. typu</strong>'),
            @('<strong>BONUS 2</strong>: <strong>Książka Kucharska i Plan Posiłków dla Nowo Zdiagnozowanych</strong>', '<strong>BONUS 2</strong>: <strong>Kuchařka a jídelníček pro nově diagnostikované</strong>'),
            @('Zacznij mądrzej jeść, czuć się silniejszym i lepiej żyć – już dziś.', 'Začněte jíst chytřeji, cítit se silnější a žít lépe – již dnes.'),
            @('Przewiń do góry i kliknij przycisk "KUP TERAZ"! Zdobądź swój egzemplarz już teraz, zanim skończy się zniżka!', 'Přejdete nahoru a kliknite na tlačítko „KOUPIT NYNÍ“! Získejte svou kopii hned teď, než sleva skončí!'),
            @('Zamów teraz i zaoszczędź 70%, zanim ta ograniczona czasowo oferta zniknie.', 'Objednejte nyní a ušetřete 70 %, než tato časově omezená nabídka vyprší.'),
            @('Opinia klienta 1', 'Hodnocení zákazníka 1'),
            @('Opinia klienta 2', 'Hodnocení zákazníka 2'),
            @('Opinia klienta 3', 'Hodnocení zákazníka 3'),
            @('Opinia klienta 4', 'Hodnocení zákazníka 4'),
            @('Oto co mówią o nas inni:', 'Zde je to, co o nás říkají ostatní:'),
            @('Här är vad andra säger om oss:', 'Zde je to, co o nás říkají ostatní:')
        )
    },
    @{
        name = "hungaro"
        lang = "hu"
        dest = "diabeteshungaroshopify"
        replacements = @(
            @('lang="pl"', 'lang="hu"'),
            @('Dieta dla Diabetyków – Smart Select', 'Diéta cukorbetegeknek – Smart Select'),
            @('⏰ OSTATNIE GODZINY – 70% ZNIŻKI KOŃCZY SIĘ ZA', '⏰ UTOLSÓ ÓRÁK – A 70%-OS KEDVEZMÉNY MINDJÁRT VÉGET ÉR'),
            @('godz', 'óra'),
            @('min', 'perc'),
            @('sek', 'mp'),
            @('Masz powyżej 60 lat i zmagasz się z kontrolowaniem poziomu cukru we krwi, nie chcąc rezygnować z ulubionych potraw?', 'Elmúlt 60 éves, és küzd a vércukorszintje szabályozásával, miközben nem szeretne lemondani kedvenc ételeiről?'),
            @('Jeśli TAK, czytaj dalej…', 'Ha IGEN, olvasson tovább…'),
            @('Najprostsza Dieta Dla Diabetyków Po 60-tce – zdjęcie produktu', 'A legegyszerűbb diéta cukorbetegeknek 60 felett – termékfotó'),
            @('Najprostsza Dieta Dla Diabetyków Po 60-tce', 'A legegyszerűbb diéta cukorbetegeknek 60 felett'),
            @('<strong>Najprostsza', '<strong>A legegyszerűbb'),
            @('Dieta Dla Diabetyków Po 60-tce</strong>', 'diéta cukorbetegeknek 60 felett</strong>'),
            @('87zł', '7900 Ft'),
            @('290zł', '23900 Ft'),
            @('Oszczędzasz 70%', 'Megtakarítás: 70%'),
            @('/pl/cart/43011722084429:1', '/hu/cart/TODO_VARIANT_ID:1'),
            @('KUP TERAZ', 'VÁSÁROLJON MOST'),
            @('KUP 1, OTRZYMAJ 3', 'VÁSÁROLJON 1-ET, KAPJON 3-AT'),
            @('Tylko przez ograniczony czas – oto, co otrzymasz:', 'Csak korlátozott ideig – íme, amit kap:'),
            @('Pakiet 3 książek – Dieta dla diabetyków', '3 könyves csomag – Diéta cukorbetegeknek'),
            @('Czy uważasz, że musisz jeść nudne, pozbawione smaku jedzenie, aby kontrolować cukrzycę po 60-tce?', 'Úgy gondolja, hogy unalmas, íztelen ételeket kell ennie ahhoz, hogy 60 év felett kontrollálja a cukorbetegségét?'),
            @('Zastanów się jeszcze raz.', 'Gondolja újra.'),
            @('Prawda jest taka, że większość diet dla seniorów z cukrzycą jest <em>zbyt restrykcyjna</em> i pozostawia uczucie frustracji, głodu i przygnębienia.', 'Az igazság az, hogy a legtöbb időskori cukorbeteg étrend <em>túl szigorú</em>, és csak frusztrációt, éhséget és levertséget okoz.'),
            @('Prawdopodobnie powiedziano Ci, abyś zrezygnował z węglowodanów, poświęcił smak lub na zawsze zrezygnował z ulubionych potraw.', 'Valószínűleg azt mondták Önnek, hogy mondjon le a szénhidrátokról, áldozza fel az ízeket, vagy felejtse el örökre a kedvenc ételeit.'),
            @('<strong>A co jeśli kontrolowanie poziomu cukru we krwi nie musiałoby być karą?</strong> Z <em>Najprostszą Dietą Dla Diabetyków Po 60-tce</em> odkryjesz, że zdrowe odżywianie przy cukrzycy nie oznacza wyrzeczeń — chodzi o mądre, poparte nauką wybory, które wspierają Twoje ciało, energię i życie po 60-tce. Ten łatwy do zrozumienia przewodnik obala mity i daje Ci dokładnie to, czego potrzebujesz, aby dobrze jeść, dobrze żyć i odzyskać kontrolę nad swoim zdrowiem — bez spędzania godzin w kuchni czy polegania na jałowych posiłkach.', '<strong>Mi lenne, ha a vércukorszint szabályozása nem lenne büntetés?</strong> A <em>Legegyszerűbb diéta cukorbetegeknek 60 felett</em> segítségével felfedezheti, hogy a cukorbetegség melletti egészséges táplálkozás nem jelent lemondást — olyan okos, tudományosan alátámasztott döntésekről szól, amelyek támogatják a testét, az energiáját és a 60 feletti életét. Ez az könnyen érthető útmutató eloszlatja a tévhiteket, és pontosan megadja azt, amire szüksége van ahhoz, hogy jól étkezzen, jól éljen és visszanyerje az irányítást az egészsége felett — anélkül, hogy órákat töltene a konyhában, vagy íztelen ételekre hagyatkozna.'),
            @('Styl życia przy diecie dla diabetyków', 'Életmód a cukorbetegek étrendjében'),
            @('Ten Bestseller Zawiera:', 'Ez a bestseller tartalma:'),
            @('✅ <strong>Prosty, krok po kroku plan diety dla diabetyków</strong> opracowany specjalnie dla osób po 60. roku życia', '✅ <strong>Egyszerű, lépésről lépésre követhető étrend cukorbetegeknek</strong>, kifejezetten 60 év felettieknek tervezve'),
            @('✅ <strong>Łatwe do przygotowania przepisy</strong> z codziennych składników (bez wymyślnych lub drogich produktów!)', '✅ <strong>Könnyen elkészíthető receptek</strong> mindennapi alapanyagokból (különleges vagy drága termékek nélkül!)'),
            @('✅ <strong>Porady żywieniowe</strong>, które współpracują z Twoim starzejącym się metabolizmem — a nie przeciwko niemu', '✅ <strong>Táplálkozási tanácsok</strong>, amelyek együttműködnek az öregedő metabolizmusával — nem pedig ellene dolgoznak'),
            @('✅ <strong>Praktyczne wskazówki</strong> na temat poprawy energii, obniżenia poziomu cukru we krwi i naturalnego obniżenia HbA1c', '✅ <strong>Praktikus tippek</strong> az energiaszint növelésére, a vércukorszint csökkentésére és a HbA1c természetes csökkentésére'),
            @('✅ <strong>Pyszne posiłki</strong>, które wspierają zdrowie serca, kontrolę wagi i wrażliwość na insulinę', '✅ <strong>Ízletes ételek</strong>, amelyek támogatják a szív egészségét, a testsúlykontrollt és az inzulinérzékenységet'),
            @('✅ <strong>Wskazówki dotyczące zakupów</strong> i przykładowe plany posiłków, aby ułatwić życie', '✅ <strong>Bevásárlási tippek</strong> és mintaétrendek a mindennapok megkönnyítésére'),
            @('✅ <strong>Zatwierdzone przez ekspertów, poparte nauką strategie</strong>, abyś każdego dnia czuł się lepiej', '✅ <strong>Szakértők által jóváhagyott, tudományosan megalapozott stratégiák</strong>, hogy minden nap jobban érezze magát'),
            @('Zdrowy posiłek dla diabetyków', 'Egészséges étel cukorbetegeknek'),
            @('Baner 70% zniżki', '70%-os kedvezményes bänner'),
            @('Zdjęcie pakietu produtos', 'Termékcsomag fotó'),
            @('Zarządzanie cukrzycą po 60-tce nie musi być przytłaczające ani mylące.', 'A cukorbetegség kezelése 60 év felett nem kell, hogy megterhelő vagy zavaró legyen.'),
            @('Jeśli masz dość skomplikowanych planów posiłków, mdłego jedzenia i ciągłego zastanawiania się, co jest "bezpieczne" do zjedzenia, ten pakiet jest dla Ciebie. Najprostsza Dieta Dla Diabetyków Po 60-tce to jasny, praktyczny i naukowo udokumentowany przewodnik, zaprojektowany specjalnie dla starszych dorosłych, którzy chcą kontrolować poziom cukru we krwi, chronić serce i zwiększyć energię — bez rezygnacji z potraw, które kochają. Natychmiastowe pobieranie cyfrowe – to są e-booki (po zakończeniu płatności od razu będziesz mieć możliwość pobrania produktu ze strony z podziękowaniem, a wkrótce po tym otrzymasz również wiadomość e-mail z linkiem).', 'Ha eleged van a bonyolult étkezési tervekből, az íztelen ételekből és a folyamatos tépelődésből azon, hogy mit „biztonságos” megenni, ez a csomag neked szól. A Legegyszerűbb diéta cukorbetegeknek 60 felett egy világos, praktikus és tudományosan alátámasztott útmutató, amelyet kifejezetten olyan idősebb felnőtteknek terveztek, akik szeretnék szabályozni a vércukorszintjüket, védeni a szívüket és növelni az energiaszintjüket — anélkül, hogy lemondanának a szeretett ételekről. Azonnali digitális letöltés – ezek e-könyvek (a fizetés befejezése után azonnal letöltheted a terméket a köszönőoldalon, és röviddel ezután egy e-mailt is kapsz a linkkel).'),
            @('<strong>BONUS 1</strong>: <strong>Książka Kucharska dla Cukrzyków Typu 2</strong>', '<strong>BONUS 1</strong>: <strong>Szakácskönyv a 2-es típusú cukorbetegséghez</strong>'),
            @('<strong>BONUS 2</strong>: <strong>Książka Kucharska i Plan Posiłków dla Nowo Zdiagnozowanych</strong>', '<strong>BONUS 2</strong>: <strong>Szakácskönyv és étrend a frissen diagnosztizáltaknak</strong>'),
            @('Zacznij mądrzej jeść, czuć się silniejszym i lepiej żyć – już dziś.', 'Kezdjen el okosabban étkezni, érezze magát erősebbnek és éljen jobban – már mától.'),
            @('Przewiń do góry i kliknij przycisk "KUP TERAZ"! Zdobądź swój egzemplarz już teraz, zanim skończy się zniżka!', 'Görgessen a lap tetejére és kattintson a „VÁSÁROLJON MOST” gombra! Szerezze be a példányát most, mielőtt a kedvezmény véget ér!'),
            @('Zamów teraz i zaoszczędź 70%, zanim ta ograniczona czasowo oferta zniknie.', 'Rendelje meg most és takarítson meg 70%-ot, mielőtt ez a korlátozott ideig tartó ajánlat lejár.'),
            @('Opinia klienta 1', 'Vásárlói vélemény 1'),
            @('Opinia klienta 2', 'Vásárlói vélemény 2'),
            @('Opinia klienta 3', 'Vásárlói vélemény 3'),
            @('Opinia klienta 4', 'Vásárlói vélemény 4'),
            @('Oto co mówią o nas inni:', 'Íme, mit mondanak rólunk mások:'),
            @('Här är vad andra säger om oss:', 'Íme, mit mondanak rólunk mások:')
        )
    },
    @{
        name = "grego"
        lang = "el"
        dest = "diabetesgregoshopify"
        replacements = @(
            @('lang="pl"', 'lang="el"'),
            @('Dieta dla Diabetyków – Smart Select', 'Δίαιτα για Διαβητικούς – Smart Select'),
            @('⏰ OSTATNIE GODZINY – 70% ZNIŻKI KOŃCZY SIĘ ZA', '⏰ ΤΕΛΕΥΤΑΙΕΣ ΩΡΕΣ – Η ΕΚΠΤΩΣΗ 70% ΛΗΓΕΙ ΣΥΝΤΟΜΑ'),
            @('godz', 'ώρες'),
            @('min', 'λεπ'),
            @('sek', 'δευτ'),
            @('Masz powyżej 60 lat i zmagasz się z kontrolowaniem poziomu cukru we krwi, nie chcąc rezygnować z ulubionych potraw?', 'Είστε άνω των 60 ετών και δυσκολεύεστε να ελέγξετε το σάκχαρό σας, χωρίς να θέλετε να στερηθείτε τα αγαπημένα σας φαγητά;'),
            @('Jeśli TAK, czytaj dalej…', 'Εάν ΝΑΙ, διαβάστε παρακάτω…'),
            @('Najprostsza Dieta Dla Diabetyków Po 60-tce – zdjęcie produktu', 'Η ευκολότερη δίαιτα για διαβητικούς άνω των 60 – φωτογραφία προϊόντος'),
            @('Najprostsza Dieta Dla Diabetyków Po 60-tce', 'Η ευκολότερη δίαιτα για διαβητικούς άνω των 60'),
            @('<strong>Najprostsza', '<strong>Η ευκολότερη'),
            @('Dieta Dla Diabetyków Po 60-tce</strong>', 'δίαιτα για διαβητικούς άνω των 60</strong>'),
            @('87zł', '19,90 €'),
            @('290zł', '59,70 €'),
            @('Oszczędzasz 70%', 'Εξοικονομήστε 70%'),
            @('/pl/cart/43011722084429:1', '/el/cart/TODO_VARIANT_ID:1'),
            @('KUP TERAZ', 'ΑΓΟΡΑΣΤΕ ΤΩΡΑ'),
            @('KUP 1, OTRZYMAJ 3', 'ΑΓΟΡΑΣΤΕ 1, ΠΑΡΤΕ 3'),
            @('Tylko przez ograniczony czas – oto, co otrzymasz:', 'Μόνο για περιορισμένο χρονικό διάστημα – ορίστε τι θα λάβετε:'),
            @('Pakiet 3 książek – Dieta dla diabetyków', 'Πακέτο 3 βιβλίων – Δίαιτα για διαβητικούς'),
            @('Czy uważasz, że musisz jeść nudne, pozbawione smaku jedzenie, aby kontrolować cukrzycę po 60-tce?', 'Πιστεύετε ότι πρέπει να τρώτε βαρετό, άγευστο φαγητό για να ελέγξετε τον διαβήτη μετά τα 60;'),
            @('Zastanów się jeszcze raz.', 'Ξανασκεφτείτε το.'),
            @('Prawda jest taka, że większość diet dla seniorów z cukrzycą jest <em>zbyt restrykcyjna</em> i pozostawia uczucie frustracji, głodu i przygnębienia.', 'Η αλήθεια είναι ότι οι περισσότερες δίαιτες διαβήτη για ηλικιωμένους είναι <em>υπερβολικά περιοριστικές</em>, προκαλώντας απογοήτευση, πείνα και κακή διάθεση.'),
            @('Prawdopodobnie powiedziano Ci, abyś zrezygnował z węglowodanów, poświęcił smak lub na zawsze zrezygnował z ulubionych potraw.', 'Πιθανόν να σας είπαν να κόψετε τους υδατάνθρακες, να θυσιάσετε τη γεύση ή να εγκαταλείψετε για πάντα τα αγαπημένα σας φαγητά.'),
            @('<strong>A co jeśli kontrolowanie poziomu cukru we krwi nie musiałoby być karą?</strong> Z <em>Najprostszą Dietą Dla Diabetyków Po 60-tce</em> odkryjesz, że zdrowe odżywianie przy cukrzycy nie oznacza wyrzeczeń — chodzi o mądre, poparte nauką wybory, które wspierają Twoje ciało, energię i życie po 60-tce. Ten łatwy do zrozumienia przewodnik obala mity i daje Ci dokładnie to, czego potrzebujesz, aby dobrze jeść, dobrze żyć i odzyskać kontrolę nad swoim zdrowiem — bez spędzania godzin w kuchni czy polegania na jałowych posiłkach.', '<strong>Και αν ο έλεγχος του σακχάρου στο αίμα δεν χρειαζόταν να είναι τιμωρία;</strong> Με την <em>Ευκολότερη δίαιτα για διαβητικούς άνω των 60</em>, θα ανακαλύψετε ότι η υγιεινή διατροφή για τον διαβήτη δεν σημαίνει στερήσεις — πρόκειται για έξυπνες, επιστημονικά τεκμηριωμένες επιλογές που υποστηρίζουν το σώμα, την ενέργεια και τη ζωή σας μετά τα 60. Αυτός ο εύκολος στην κατανόηση οδηγός καταρρίπτει τους μύθους και σας δίνει ακριβώς αυτό που χρειάζεστε για να τρώτε καλά, να ζείτε καλά και να ανακτήσετε τον έλεγχο της υγείας σας — χωρίς να περνάτε ώρες στην κουζίνα ή να βασίζεστε σε άνοστα γεύματα.'),
            @('Styl życia przy diecie dla diabetyków', 'Τρόπος ζωής στη δίαιτα για διαβητικούς'),
            @('Ten Bestseller Zawiera:', 'Αυτό το Bestseller Περιλαμβάνει:'),
            @('✅ <strong>Prosty, krok po kroku plan diety dla diabetyków</strong> opracowany specjalnie dla osób po 60. roku życia', '✅ <strong>Απλό πλάνο διατροφής για διαβητικούς βήμα προς βήμα</strong>, σχεδιασμένο ειδικά για άτομα άνω των 60 ετών'),
            @('✅ <strong>Łatwe do przygotowania przepisy</strong> z codziennych składników (bez wymyślnych lub drogich produktów!)', '✅ <strong>Εύκολες στην προετοιμασία συνταγές</strong> με καθημερινά υλικά (χωρίς περίπλοκα ή ακριβά προϊόντα!)'),
            @('✅ <strong>Porady żywieniowe</strong>, które współpracują z Twoim starzejącym się metabolizmem — a nie przeciwko niemu', '✅ <strong>Διατροφικές συμβουλές</strong> που λειτουργούν υπέρ του μεταβολισμού σας που αλλάζει με την ηλικία — και όχι εναντίον του'),
            @('✅ <strong>Praktyczne wskazówki</strong> na temat poprawy energii, obniżenia poziomu cukru we krwi i naturalnego obniżenia HbA1c', '✅ <strong>Πρακτικές συμβουλές</strong> για την αύξηση της ενέργειας, τη μείωση του σακχάρου στο αίμα και τη φυσική μείωση της HbA1c'),
            @('✅ <strong>Pyszne posiłki</strong>, które wspierają zdrowie serca, kontrolę wagi i wrażliwość na insulinę', '✅ <strong>Νόστιμα γεύματα</strong> που υποστηρίζουν την υκειά της καρδιάς, τον έλεγχο του βάρους και την ευαισθησία στην ινσουλίνη'),
            @('✅ <strong>Wskazówki dotyczące zakupów</strong> i przykładowe plany posiłków, aby ułatwić życie', '✅ <strong>Συμβουλές για ψώνια</strong> και ενδεικτικά προγράμματα γευμάτων για να κάνουν τη ζωή σας πιο εύκολη'),
            @('✅ <strong>Zatwierdzone przez ekspertów, poparte nauką strategie</strong>, abyś każdego dnia czuł się lepiej', '✅ <strong>Εγκεκριμένες από ειδικούς και επιστημονικά τεκμηριωμένες στρατηγικές</strong> για να νιώθετε καλύτερα κάθε μέρα'),
            @('Zdrowy posiłek dla diabetyków', 'Υγιεινό γεύμα για διαβητικούς'),
            @('Baner 70% zniżki', 'Πανό έκπτωσης 70%'),
            @('Zdjęcie pakietu produtos', 'Φωτογραφία πακέτου προϊόντων'),
            @('Zarządzanie cukrzycą po 60-tce nie musi być przytłaczające ani mylące.', 'Η διαχείριση του διαβήτη μετά τα 60 δεν χρειάζεται να είναι κουραστική ή μπερδεμένη.'),
            @('Jeśli masz dość skomplikowanych planów posiłków, mdłego jedzenia i ciągłego zastanawiania się, co jest "bezpieczne" do zjedzenia, ten pakiet jest dla Ciebie. Najprostsza Dieta Dla Diabetyków Po 60-tce to jasny, praktyczny i naukowo udokumentowany przewodnik, zaprojektowany specjalnie dla starszych dorosłych, którzy chcą kontrolować poziom cukru we krwi, chronić serce i zwiększyć energię — bez rezygnacji z potraw, które kochają. Natychmiastowe pobieranie cyfrowe – to są e-booki (po zakończeniu płatności od razu będziesz mieć możliwość pobrania produktu ze strony z podziękowaniem, a wkrótce po tym otrzymasz również wiadomość e-mail z linkiem).', 'Αν έχετε βαρεθεί τα περίπλοκα προγράμματα γευμάτων, τα άνοστα φαγητά και τη συνεχή ανησυχία για το τι είναι «ασφαλές» να φάτε, αυτό το πακέτο είναι για εσάς. Η Ευκολότερη δίαιτα για διαβητικούς άνω των 60 είναι ένας σαφής, πρακτικός και επιστημονικά τεκμηριωμένος οδηγός, σχεδιασμένος ειδικά για μεγαλύτερους ενήλικες που θέλουν να ελέγξουν το σάκχαρό τους, να προστατεύσουν την καρδιά τους και να αυξήσουν την ενέργειά τους — χωρίς να στερηθούν τα φαγητά που αγαπούν. Άμεση ψηφιακή λήψη – πρόκειται για ηλεκτρονικά βιβλία (e-books) (μετά την ολοκλήρωση της πληρωμής θα έχετε αμέσως τη δυνατότητα να κατεβάσετε το προϊόν στη σελίδα ευχαριστιών, ενώ λίγο αργότερα θα λάβετε και ένα e-mail με τον σύνδεσμο).'),
            @('<strong>BONUS 1</strong>: <strong>Książka Kucharska dla Cukrzyków Typu 2</strong>', '<strong>BONUS 1</strong>: <strong>Βιβλίο Συνταγών για Διαβήτη Τύπου 2</strong>'),
            @('<strong>BONUS 2</strong>: <strong>Książka Kucharska i Plan Posiłków dla Nowo Zdiagnozowanych</strong>', '<strong>BONUS 2</strong>: <strong>Βιβλίο Συνταγών και Πρόγραμμα Γευμάτων για Νεοδιαγνωσθέντες</strong>'),
            @('Zacznij mądrzej jeść, czuć się silniejszym i lepiej żyć – już dziś.', 'Ξεκινήστε να τρώτε πιο έξυπνα, να νιώθετε πιο δυνατοί και να ζείτε καλύτερα – από σήμερα.'),
            @('Przewiń do góry i kliknij przycisk "KUP TERAZ"! Zdobądź swój egzemplarz już teraz, zanim skończy się zniżka!', 'Μεταβείτε στην κορυφή και κάντε κλικ στο κουμπί «ΑΓΟΡΑΣΤΕ ΤΩΡΑ»! Αποκτήστε το αντίγραφό σας τώρα πριν λήξει η έκπτωση!'),
            @('Zamów teraz i zaoszczędź 70%, zanim ta ograniczona czasowo oferta zniknie.', 'Παραγγείλετε τώρα και εξοικονομήστε 70% πριν χαθεί αυτή η περιορισμένη προσφορά.'),
            @('Opinia klienta 1', 'Αξιολόγηση πελάτη 1'),
            @('Opinia klienta 2', 'Αξιολόγηση πελάτη 2'),
            @('Opinia klienta 3', 'Αξιολόγηση πελάτη 3'),
            @('Opinia klienta 4', 'Αξιολόγηση πελάτη 4'),
            @('Oto co mówią o nas inni:', 'Ορίστε τι λένε οι άλλοι για εμάς:'),
            @('Här är vad andra säger om oss:', 'Ορίστε τι λένε οι άλλοι για εμάς:')
        )
    },
    @{
        name = "romeno"
        lang = "ro"
        dest = "diabetesromenoshopify"
        replacements = @(
            @('lang="pl"', 'lang="ro"'),
            @('Dieta dla Diabetyków – Smart Select', 'Dieta pentru diabetici – Smart Select'),
            @('⏰ OSTATNIE GODZINY – 70% ZNIŻKI KOŃCZY SIĘ ZA', '⏰ ULTIMELE ORE – REDUCEREA DE 70% SE ÎNCHEIE ÎN CURÂND'),
            @('godz', 'ore'),
            @('min', 'min'),
            @('sek', 'sec'),
            @('Masz powyżej 60 lat i zmagasz się z kontrolowaniem poziomu cukru we krwi, nie chcąc rezygnować z ulubionych potraw?', 'Aveți peste 60 de ani și vă luptați să vă țineți sub control glicemia, fără să vreți să renunțați la mâncărurile preferate?'),
            @('Jeśli TAK, czytaj dalej…', 'Dacă DA, citiți mai departe…'),
            @('Najprostsza Dieta Dla Diabetyków Po 60-tce – zdjęcie produktu', 'Cea mai simplă dietă pentru diabetici de peste 60 de ani – fotografia produsului'),
            @('Najprostsza Dieta Dla Diabetyków Po 60-tce', 'Cea mai simplă dietă pentru diabetici de peste 60 de ani'),
            @('<strong>Najprostsza', '<strong>Cea mai simplă'),
            @('Dieta Dla Diabetyków Po 60-tce</strong>', 'dietă pentru diabetici de peste 60 de ani</strong>'),
            @('87zł', '99 lei'),
            @('290zł', '299 lei'),
            @('Oszczędzasz 70%', 'Economisiți 70%'),
            @('/pl/cart/43011722084429:1', '/ro/cart/TODO_VARIANT_ID:1'),
            @('KUP TERAZ', 'CUMPĂRĂ ACUM'),
            @('KUP 1, OTRZYMAJ 3', 'CUMPĂRĂ 1, PRIMEȘTI 3'),
            @('Tylko przez ograniczony czas – oto, co otrzymasz:', 'Doar pentru un timp limitat – iată ce veți obține:'),
            @('Pakiet 3 książek – Dieta dla diabetyków', 'Pachet de 3 cărți – Dieta pentru diabetici'),
            @('Czy uważasz, że musisz jeść nudne, pozbawione smaku jedzenie, aby kontrolować cukrzycę po 60-tce?', 'Credeți că trebuie să mâncați alimente fade și fără gust pentru a vă ține sub control diabetul după 60 de ani?'),
            @('Zastanów się jeszcze raz.', 'Gândiți-vă din nou.'),
            @('Prawda jest taka, że większość diet dla seniorów z cukrzycą jest <em>zbyt restrykcyjna</em> i pozostawia uczucie frustracji, głodu i przygnębienia.', 'Adevărul este că majoritatea dietelor pentru diabetici destinate seniorilor sunt <em>prea restrictive</em>, lăsându-vă frustrat, flămând și descurajat.'),
            @('Prawdopodobnie powiedziano Ci, abyś zrezygnował z węglowodanów, poświęcił smak lub na zawsze zrezygnował z ulubionych potraw.', 'Probabil vi s-a spus să renunțați la carbohidrați, să sacrificați gustul sau să renunțați pentru totdeauna la mâncărurile preferate.'),
            @('<strong>A co jeśli kontrolowanie poziomu cukru we krwi nie musiałoby być karą?</strong> Z <em>Najprostszą Dietą Dla Diabetyków Po 60-tce</em> odkryjesz, że zdrowe odżywianie przy cukrzycy nie oznacza wyrzeczeń — chodzi o mądre, poparte nauką wybory, które wspierają Twoje ciało, energię i życie po 60-tce. Ten łatwy do zrozumienia przewodnik obala mity i daje Ci dokładnie to, czego potrzebujesz, aby dobrze jeść, dobrze żyć i odzyskać kontrolę nad swoim zdrowiem — bez spędzania godzin w kuchni czy polegania na jałowych posiłkach.', '<strong>Cum ar fi dacă ținerea sub control a glicemiei nu ar trebui să fie o pedeapsă?</strong> Cu <em>Cea mai simplă dietă pentru diabetici de peste 60 de ani</em>, veți descoperi că alimentația sănătoasă în diabet nu înseamnă sacrificii — este vorba despre alegeri inteligente, susținute științific, care vă sprijină corpul, energia și viața după 60 de ani. Acest ghid ușor de înțeles demontează miturile și vă oferă exact ceea ce aveți nevoie pentru a mânca bine, a trăi bine și a prelua din nou controlul asupra sănătății dumneavoastră — fără a petrece ore în șir în bucătărie sau a depinde de mese fade.'),
            @('Styl życia przy diecie dla diabetyków', 'Stil de viață în dieta diabeticului'),
            @('Ten Bestseller Zawiera:', 'Acest Bestseller Conține:'),
            @('✅ <strong>Prosty, krok po kroku plan diety dla diabetyków</strong> opracowany specjalnie dla osób po 60. roku życia', '✅ <strong>Un plan simplu, pas cu pas, pentru dieta diabeticului</strong>, creat special pentru persoanele de peste 60 de ani'),
            @('✅ <strong>Łatwe do przygotowania przepisy</strong> z codziennych składników (bez wymyślnych lub drogich produktów!)', '✅ <strong>Rețete ușor de preparat</strong> din ingrediente obișnuite (fără produse sofisticate sau scumpe!)'),
            @('✅ <strong>Porady żywieniowe</strong>, które współpracują z Twoim starzejącym się metabolizmem — a nie przeciwko niemu', '✅ <strong>Sfaturi nutriționale</strong> care lucrează împreună cu metabolismul dumneavoastră aflat în schimbare — nu împotriva lui'),
            @('✅ <strong>Praktyczne wskazówki</strong> na temat poprawy energii, obniżenia poziomu cukru we krwi i naturalnego obniżenia HbA1c', '✅ <strong>Sfaturi practice</strong> pentru creșterea energiei, scăderea glicemiei și reducerea naturală a HbA1c'),
            @('✅ <strong>Pyszne posiłki</strong>, które wspierają zdrowie serca, kontrolę wagi i wrażliwość na insulinę', '✅ <strong>Mâncăruri delicioase</strong> care susțin sănătatea inimii, controlul greutății și sensibilitatea la insulină'),
            @('✅ <strong>Wskazówki dotyczące zakupów</strong> i przykładowe plany posiłków, aby ułatwić życie', '✅ <strong>Sfaturi pentru cumpărături</strong> și modele de meniuri pentru a vă ușura viața'),
            @('✅ <strong>Zatwierdzone przez ekspertów, poparte nauką strategie</strong>, abyś każdego dnia czuł się lepiej', '✅ <strong>Strategii aprobate de experți și susținute de știință</strong> pentru a vă simți mai bine în fiecare zi'),
            @('Zdrowy posiłek dla diabetyków', 'Mâncare sănătoasă pentru diabetici'),
            @('Baner 70% zniżki', 'Banner reducere de 70%'),
            @('Zdjęcie pakietu produtos', 'Fotografie pachet de produse'),
            @('Zarządzanie cukrzycą po 60-tce nie musi być przytłaczające ani mylące.', 'Gestionarea diabetului după 60 de ani nu trebuie să fie copleșitoare sau derutantă.'),
            @('Jeśli masz dość skomplikowanych planów posiłków, mdłego jedzenia i ciągłego zastanawiania się, co jest "bezpieczne" do zjedzenia, ten pakiet jest dla Ciebie. Najprostsza Dieta Dla Diabetyków Po 60-tce to jasny, praktyczny i naukowo udokumentowany przewodnik, zaprojektowany specjalnie dla starszych dorosłych, którzy chcą kontrolować poziom cukru we krwi, chronić serce i zwiększyć energię — bez rezygnacji z potraw, które kochają. Natychmiastowe pobieranie cyfrowe – to są e-booki (po zakończeniu płatności od razu będziesz mieć możliwość pobrania produktu ze strony z podziękowaniem, a wkrótce po tym otrzymasz również wiadomość e-mail z linkiem).', 'Dacă v-ați săturat de planuri de masă complicate, mâncare fadă și de grija constantă legată de ce este „sigur” de mâncat, acest pachet este pentru dumneavoastră. Cea mai simplă dietă pentru diabetici de peste 60 de ani este un ghid clar, practic și susținut științific, conceput special pentru adulții în vârstă care doresc să își controleze glicemia, să își protejeze inima și să își sporească energia — fără a renunța la mâncărurile pe care le adoră. Descărcare digitală instantanee – acestea sunt e-bookuri (după finalizarea plății veți avea imediat posibilitatea de a descărca produsul de pe pagina de mulțumire, iar la scurt timp după aceea veți primi și un e-mail cu linkul).'),
            @('<strong>BONUS 1</strong>: <strong>Książka Kucharska dla Cukrzyków Typu 2</strong>', '<strong>BONUS 1</strong>: <strong>Carte de bucate pentru diabetul de tip 2</strong>'),
            @('<strong>BONUS 2</strong>: <strong>Książka Kucharska i Plan Posiłków dla Nowo Zdiagnozowanych</strong>', '<strong>BONUS 2</strong>: <strong>Carte de bucate și plan de mese pentru cei recent diagnosticați</strong>'),
            @('Zacznij mądrzej jeść, czuć się silniejszym i lepiej żyć – już dziś.', 'Începeți să mâncați mai inteligent, să vă simțiți mai puternic și să trăiți mai bine – chiar de astăzi.'),
            @('Przewiń do góry i kliknij przycisk "KUP TERAZ"! Zdobądź swój egzemplarz już teraz, zanim skończy się zniżka!', 'Derulați în sus și faceți clic pe butonul „CUMPĂRĂ ACUM”! Obțineți exemplarul acum, înainte ca reducerea să se termine!'),
            @('Zamów teraz i zaoszczędź 70%, zanim ta ograniczona czasowo oferta zniknie.', 'Comandați acum și economisiți 70% înainte ca această ofertă limitată să dispară.'),
            @('Opinia klienta 1', 'Recenzia clientului 1'),
            @('Opinia klienta 2', 'Recenzia clientului 2'),
            @('Opinia klienta 3', 'Recenzia clientului 3'),
            @('Opinia klienta 4', 'Recenzia clientului 4'),
            @('Oto co mówią o nas inni:', 'Iată ce spun alții despre noi:'),
            @('Här är vad andra säger om oss:', 'Iată ce spun alții despre noi:')
        )
    },
    @{
        name = "eslovaco"
        lang = "sk"
        dest = "diabeteseslovacoshopify"
        replacements = @(
            @('lang="pl"', 'lang="sk"'),
            @('Dieta dla Diabetyków – Smart Select', 'Diéta pre diabetikov – Smart Select'),
            @('⏰ OSTATNIE GODZINY – 70% ZNIŻKI KOŃCZY SIĘ ZA', '⏰ POSLEDNÉ HODINY – 70% ZĽAVA ČOSKORO SKONČÍ'),
            @('godz', 'hod'),
            @('min', 'min'),
            @('sek', 'sek'),
            @('Masz powyżej 60 lat i zmagasz się z kontrolowaniem poziomu cukru we krwi, nie chcąc rezygnować z ulubionych potraw?', 'Máte viac ako 60 rokov a snažíte sa mať pod kontrolou hladinu cukru v krvi bez toho, aby ste sa museli vzdať svojich obľúbených jedál?'),
            @('Jeśli TAK, czytaj dalej…', 'Ak ÁNO, čítajte ďalej…'),
            @('Najprostsza Dieta Dla Diabetyków Po 60-tce – zdjęcie produktu', 'Najjednoduchšia diéta pre diabetikov po šesťdesiatke – produktová fotografia'),
            @('Najprostsza Dieta Dla Diabetyków Po 60-tce', 'Najjednoduchšia diéta pre diabetikov po šesťdesiatke'),
            @('<strong>Najprostsza', '<strong>Najjednoduchšia'),
            @('Dieta Dla Diabetyków Po 60-tce</strong>', 'diéta pre diabetikov po šesťdesiatke</strong>'),
            @('87zł', '19,90 €'),
            @('290zł', '59,70 €'),
            @('Oszczędzasz 70%', 'Ušetrite 70 %'),
            @('/pl/cart/43011722084429:1', '/sk/cart/TODO_VARIANT_ID:1'),
            @('KUP TERAZ', 'KÚPIŤ TERAZ'),
            @('KUP 1, OTRZYMAJ 3', 'KÚPTE 1, ZÍSKAJTE 3'),
            @('Tylko przez ograniczony czas – oto, co otrzymasz:', 'Iba na obmedzený čas – tu je to, čo získate:'),
            @('Pakiet 3 książek – Dieta dla diabetyków', 'Balíček 3 kníh – Diéta pre diabetikov'),
            @('Czy uważasz, że musisz jeść nudne, pozbawione smaku jedzenie, aby kontrolować cukrzycę po 60-tce?', 'Myslíte si, že musíte jesť nudné jedlo bez chuti, aby ste mali cukrovku po šesťdesiatke pod kontrolou?'),
            @('Zastanów się jeszcze raz.', 'Zamyslite sa znova.'),
            @('Prawda jest taka, że większość diet dla seniorów z cukrzycą jest <em>zbyt restrykcyjna</em> i pozostawia uczucie frustracji, głodu i przygnębienia.', 'Pravdou je, že väčšina diét pri cukrovke pre seniorov je <em>príliš reštriktívna</em> a zanecháva pocit frustrácie, hladu a skleslosti.'),
            @('Prawdopodobnie powiedziano Ci, abyś zrezygnował z węglowodanów, poświęcił smak lub na zawsze zrezygnował z ulubionych potraw.', 'Pravdepodobne vám bolo povedané, aby ste sa vzdali sacharidov, obetovali chuť alebo sa navždy vzdali svojich obľúbených jedál.'),
            @('<strong>A co jeśli kontrolowanie poziomu cukru we krwi nie musiałoby być karą?</strong> Z <em>Najprostszą Dietą Dla Diabetyków Po 60-tce</em> odkryjesz, że zdrowe odżywianie przy cukrzycy nie oznacza wyrzeczeń — chodzi o mądre, poparte nauką wybory, które wspierają Twoje ciało, energię i życie po 60-tce. Ten łatwy do zrozumienia przewodnik obala mity i daje Ci dokładnie to, czego potrzebujesz, aby dobrze jeść, dobrze żyć i odzyskać kontrolę nad swoim zdrowiem — bez spędzania godzin w kuchni czy polegania na jałowych posiłkach.', '<strong>Čo keby kontrola hladiny cukru v krvi nemusela byť trestom?</strong> S <em>Najjednoduchšou diétou pre diabetikov po šesťdesiatke</em> zistíte, že zdravé stravovanie pri cukrovke neznamená odriekanie — ide o múdre rozhodnutia podložené vedou, ktoré podporia vaše telo, energiu a život po šesťdesiatke. Tento ľahko zrozumiteľný sprievodca vyvracia mýty a dáva vám presne to, čo potrebujete, aby ste sa dobre stravovali, dobre žili a získali späť kontrolu nad svojím zdravím — bez trávenia hodín v kuchyni alebo spoliehania sa na jedlá bez chuti.'),
            @('Styl życia przy diecie dla diabetyków', 'Životný štýl pri diéte pre diabetikov'),
            @('Ten Bestseller Zawiera:', 'Tento bestseller obsahuje:'),
            @('✅ <strong>Prosty, krok po kroku plan diety dla diabetyków</strong> opracowany specjalnie dla osób po 60. roku życia', '✅ <strong>Jednoduchý plán diéty pre diabetikov krok za krokom</strong> vytvorený špedelne pre ľudí po šesťdesiatke'),
            @('✅ <strong>Łatwe do przygotowania przepisy</strong> z codziennych składników (bez wymyślnych lub drogich produktów!)', '✅ <strong>Ľahko pripraviteľné recepty</strong> z bežných surovín (žiadne zložité alebo drahé produkty!)'),
            @('✅ <strong>Porady żywieniowe</strong>, które współpracują z Twoim starzejącym się metabolizmem — a nie przeciwko niemu', '✅ <strong>Výživové rady</strong>, ktoré pracujú s vaším starnúcim metabolizmus — a nie proti nemu'),
            @('✅ <strong>Praktyczne wskazówki</strong> na temat poprawy energii, obniżenia poziomu cukru we krwi i naturalnego obniżenia HbA1c', '✅ <strong>Praktické tipy</strong> na zvýšenie energie, zníženie hladiny cukru v krvi a prirodzené zníženie HbA1c'),
            @('✅ <strong>Pyszne posiłki</strong>, które wspierają zdrowie serca, kontrolę wagi i wrażliwość na insulinę', '✅ <strong>Lahodné jedlá</strong>, ktoré podporujú zdravie srdca, kontrolu hmotnosti a citlivosť na inzulín'),
            @('✅ <strong>Wskazówki dotyczące zakupów</strong> i przykładowe plany posiłków, aby ułatwić życie', '✅ <strong>Tipy na nákupy</strong> a ukážkové jedálničky pre uľahčenie života'),
            @('✅ <strong>Zatwierdzone przez ekspertów, poparte nauką strategie</strong>, abyś każdego dnia czuł się lepiej', '✅ <strong>Odborníkmi schválené a vedou podložené stratégie</strong>, aby ste sa každý deň cítili lepšie'),
            @('Zdrowy posiłek dla diabetyków', 'Zdravé jedlo pre diabetikov'),
            @('Baner 70% zniżki', 'Banner 70% zľava'),
            @('Zdjęcie pakietu produtos', 'Fotografia balíčka produktov'),
            @('Zarządzanie cukrzycą po 60-tce nie musi być przytłaczające ani mylące.', 'Zvládanie cukrovky po šesťdesiatke nemusí byť zdrvujúce ani mätúce.'),
            @('Jeśli masz dość skomplikowanych planów posiłków, mdłego jedzenia i ciągłego zastanawiania się, co jest "bezpieczne" do zjedzenia, ten pakiet jest dla Ciebie. Najprostsza Dieta Dla Diabetyków Po 60-tce to jasny, praktyczny i naukowo udokumentowany przewodnik, zaprojektowany specjalnie dla starszych dorosłych, którzy chcą kontrolować poziom cukru we krwi, chronić serce i zwiększyć energię — bez rezygnacji z potraw, które kochają. Natychmiastowe pobieranie cyfrowe – to są e-booki (po zakończeniu płatności od razu będziesz mieć możliwość pobrania produktu ze strony z podziękowaniem, a wkrótce po tym otrzymasz również wiadomość e-mail z linkiem).', 'Ak máte dosť zložitých jedálničkov, nevýrazného jedla a neustáleho premýšľania, čo je „bezpečné“ jesť, tento balíček je pre vás. Najjednoduchšia diéta pre diabetikov po šesťdesiatke je jasný, praktický a vedecky podložený sprievodca navržený špedelne pre starších dospelých, ktorí chcú mať pod kontrolou hladinu cukru v krvi, chrániť svoje srdce a zvýšiť energiu — bez toho, aby sa museli vzdať jedál, ktoré milujú. Okamžité digitálne stiahnutie – jedná sa o e-knihy (po dokončení platby budete mať okamžite možnost stiahnuť si produkt na ďakovnej stránke a krátko nato obdržíte aj e-mail s odkazom).'),
            @('<strong>BONUS 1</strong>: <strong>Książka Kucharska dla Cukrzyków Typu 2</strong>', '<strong>BONUS 1</strong>: <strong>Kuchárka pre cukrovku 2. typu</strong>'),
            @('<strong>BONUS 2</strong>: <strong>Książka Kucharska i Plan Posiłków dla Nowo Zdiagnozowanych</strong>', '<strong>BONUS 2</strong>: <strong>Kuchárka a jedálniček pre novodiagnostikovaných</strong>'),
            @('Zacznij mądrzej jeść, czuć się silniejszym i lepiej żyć – już dziś.', 'Začnite jesť rozumnejšie, cítiť sa silnejší a žiť lepšie – už dnes.'),
            @('Przewiń do góry i kliknij przycisk "KUP TERAZ"! Zdobądź swój egzemplarz już teraz, zanim skończy się zniżka!', 'Prejdite nahor a kliknite na tlačidlo „KÚPIŤ TERAZ“! Získajte svoju kópiu hneď teraz, kým zľava skončí!'),
            @('Zamów teraz i zaoszczędź 70%, zanim ta ograniczona czasowo oferta zniknie.', 'Objednajte teraz a ušetrite 70 %, kým táto časovo obmedzená ponuka vyprší.'),
            @('Opinia klienta 1', 'Hodnotenie zákazníka 1'),
            @('Opinia klienta 2', 'Hodnotenie zákazníka 2'),
            @('Opinia klienta 3', 'Hodnotenie zákazníka 3'),
            @('Opinia klienta 4', 'Hodnotenie zákazníka 4'),
            @('Oto co mówią o nas inni:', 'Tu je to, čo o nás hovoria iní:'),
            @('Här är vad andra säger om oss:', 'Tu je to, čo o nás hovoria iní:')
        )
    },
    @{
        name = "estoniano"
        lang = "et"
        dest = "diabetesestonianoshopify"
        replacements = @(
            @('lang="pl"', 'lang="et"'),
            @('Dieta dla Diabetyków – Smart Select', 'Diabeetikute dieet – Smart Select'),
            @('⏰ OSTATNIE GODZINY – 70% ZNIŻKI KOŃCZY SIĘ ZA', '⏰ VIIMASED TUNNID – 70% SOODUSTUS LÕPPEB PEAGI'),
            @('godz', 'tundi'),
            @('min', 'min'),
            @('sek', 'sek'),
            @('Masz powyżej 60 lat i zmagasz się z kontrolowaniem poziomu cukru we krwi, nie chcąc rezygnować z ulubionych potraw?', 'Kas olete üle 60-aastane ja teil on raskusi veresuhkru taseme kontrolli all hoidmisega, kuid te ei soovi loobuda oma lemmiktoitudest?'),
            @('Jeśli TAK, czytaj dalej…', 'Kui JAH, lugege edasi…'),
            @('Najprostsza Dieta Dla Diabetyków Po 60-tce – zdjęcie produktu', 'Kõige lihtsam diabeetikute dieet pärast 60. eluaastat – tootefoto'),
            @('Najprostsza Dieta Dla Diabetyków Po 60-tce', 'Kõige lihtsam diabeetikute dieet pärast 60. eluaastat'),
            @('<strong>Najprostsza', '<strong>Kõige lihtsam'),
            @('Dieta Dla Diabetyków Po 60-tce</strong>', 'diabeetikute dieet pärast 60. eluaastat</strong>'),
            @('87zł', '19,90 €'),
            @('290zł', '59,70 €'),
            @('Oszczędzasz 70%', 'Säästate 70%'),
            @('/pl/cart/43011722084429:1', '/et/cart/TODO_VARIANT_ID:1'),
            @('KUP TERAZ', 'OSTA KOHE'),
            @('KUP 1, OTRZYMAJ 3', 'OSTA 1, SAAD 3'),
            @('Tylko przez ograniczony czas – oto, co otrzymasz:', 'Ainult piiratud aja jooksul – siin on see, mida saate:'),
            @('Pakiet 3 książek – Dieta dla diabetyków', '3 raamatu komplekt – Diabeetikute dieet'),
            @('Czy uważasz, że musisz jeść nudne, pozbawione smaku jedzenie, aby kontrolować cukrzycę po 60-tce?', 'Kas arvate, et peate sööma igavat ja maitsetut toitu, et hoida diabeeti pärast 60. eluaastat kontrolli all?'),
            @('Zastanów się jeszcze raz.', 'Mõelge uuesti.'),
            @('Prawda jest taka, że większość diet dla seniorów z cukrzycą jest <em>zbyt restrykcyjna</em> i pozostawia uczucie frustracji, głodu i przygnębienia.', 'Tõde on see, et enamik eakate diabeedidieete on <em>liiga piiravad</em>, tekitades frustratsiooni, nälga ja masendust.'),
            @('Prawdopodobnie powiedziano Ci, abyś zrezygnował z węglowodanów, poświęcił smak lub na zawsze zrezygnował z ulubionych potraw.', 'Tõenäoliselt on teile öeldud, et peate loobuma süsivesikutest, ohverdama maitse või loobuma igaveseks oma lemmiktoitudest.'),
            @('<strong>A co jeśli kontrolowanie poziomu cukru we krwi nie musiałoby być karą?</strong> Z <em>Najprostszą Dietą Dla Diabetyków Po 60-tce</em> odkryjesz, że zdrowe odżywianie przy cukrzycy nie oznacza wyrzeczeń — chodzi o mądre, poparte nauką wybory, które wspierają Twoje ciało, energię i życie po 60-tce. Ten łatwy do zrozumienia przewodnik obala mity i daje Ci dokładnie to, czego potrzebujesz, aby dobrze jeść, dobrze żyć i odzyskać kontrolę nad swoim zdrowiem — bez spędzania godzin w kuchni czy polegania na jałowych posiłkach.', '<strong>Mis oleks, kui veresuhkru kontrolli all hoidmine ei peaks olema karistus?</strong> Raamatuga <em>Kõige lihtsam diabeetikute dieet pärast 60. eluaastat</em> avastate, et tervislik toitumine diabeedi korral ei tähenda loobumist — see tähendab nutikaid, teaduspõhiseid valikuid, mis toetavad teie keha, energiat ja elu pärast 60. eluaastat. See hõlpsasti mõistetav juhend kummutab müüdid ja annab teile täpselt selle, mida vajate, et hästi süüa, hästi elada ja saavutada taas kontroll oma tervise üle — ilma et peaksite veetma tunde köögis või sööma maitsetuid toite.'),
            @('Styl życia przy diecie dla diabetyków', 'Elustiil diabeetikute dieedi ajal'),
            @('Ten Bestseller Zawiera:', 'See bestseller sisaldab:'),
            @('✅ <strong>Prosty, krok po kroku plan diety dla diabetyków</strong> opracowany specjalnie dla osób po 60. roku życia', '✅ <strong>Lihtne samm-sammuline toitumiskava diabeetiketelee</strong>, mis on loodud spetsiaalselt üle 60-aastastele inimestele'),
            @('✅ <strong>Łatwe do przygotowania przepisy</strong> z codziennych składników (bez wymyślnych lub drogich produktów!)', '✅ <strong>Lihtsalt valmistatavad retseptid</strong> igapäevastest koostisosadest (ilma keeruliste või kallite toodeteta!)'),
            @('✅ <strong>Porady żywieniowe</strong>, które współpracują z Twoim starzejącym się metabolizmem — a nie przeciwko niemu', '✅ <strong>Toitumisnõuanded</strong>, mis töötavad koos teie vananeva ainevahetusega — mitte selle vastu'),
            @('✅ <strong>Praktyczne wskazówki</strong> na temat poprawy energii, obniżenia poziomu cukru we krwi i naturalnego obniżenia HbA1c', '✅ <strong>Praktilised näpunäited</strong> energia suurendamiseks, veresuhkru alandamiseks ja HbA1c taseme loomulikuks vähendamiseks'),
            @('✅ <strong>Pyszne posiłki</strong>, które wspierają zdrowie serca, kontrolę wagi i wrażliwość na insulinę', '✅ <strong>Maitsvad toidud</strong>, mis toetavad südame tervist, kaalukontrolli ja insuliinitundlikkust'),
            @('✅ <strong>Wskazówki dotyczące zakupów</strong> i przykładowe plany posiłków, aby ułatwić życie', '✅ <strong>Ostunõuanded</strong> ja näidismenüüd elu lihtsustamiseks'),
            @('✅ <strong>Zatwierdzone przez ekspertów, poparte nauką strategie</strong>, abyś każdego dnia czuł się lepiej', '✅ <strong>Ekspertide heakskiidetud ja teaduspõhised strateegiad</strong>, et tunneksite end iga päev paremini'),
            @('Zdrowy posiłek dla diabetyków', 'Tervislik toit diabeetikutele'),
            @('Baner 70% zniżki', '70% soodustuse bänner'),
            @('Zdjęcie pakietu produtos', 'Tootekomplekti foto'),
            @('Zarządzanie cukrzycą po 60-tce nie musi być przytłaczające ani mylące.', 'Diabeedi ohjeldamine pärast 60. eluaastat ei pea olema koormav ega segadusttekitav.'),
            @('Jeśli masz dość skomplikowanych planów posiłków, mdłego jedzenia i ciągłego zastanawiania się, co jest "bezpieczne" do zjedzenia, ten pakiet jest dla Ciebie. Najprostsza Dieta Dla Diabetyków Po 60-tce to jasny, praktyczny i naukowo udokumentowany przewodnik, zaprojektowany specjalnie dla starszych dorosłych, którzy chcą kontrolować poziom cukru we krwi, chronić serce i zwiększyć energię — bez rezygnacji z potraw, które kochają. Natychmiastowe pobieranie cyfrowe – to są e-booki (po zakończeniu płatności od razu będziesz mieć możliwość pobrania produktu ze strony z podziękowaniem, a wkrótce po tym otrzymasz również wiadomość e-mail z linkiem).', 'Kui teil on kõrini keerulistest toidukavadest, maitsetust toidust ja pidevast mõtlemisest, mis on söömiseks „ohutu“, on see komplekt teie jaoks. Kõige lihtsam diabeetikute dieet pärast 60. eluaastat on selge, praktiline ja teaduspõhine juhend, mis on loodud spetsiaalselt eakatele täiskasvanutele, kes soovivad hoida veresuhkrut kontrolli all, kaitsta oma südant ja suurendada energiat — ilma et peaksid loobuma toitudest, mida nad armastavad. Kohene digitaalne allalaadimine – need on e-raamatud (pärast makse sooritamist on teil kohe võimalus toode allalaadida tänu-lehel ja peagi saate ka meili lingiga).'),
            @('<strong>BONUS 1</strong>: <strong>Książka Kucharska dla Cukrzyków Typu 2</strong>', '<strong>BOONUS 1</strong>: <strong>2. tüübi diabeedi kokaraamat</strong>'),
            @('<strong>BONUS 2</strong>: <strong>Książka Kucharska i Plan Posiłków dla Nowo Zdiagnozowanych</strong>', '<strong>BOONUS 2</strong>: <strong>Kokaraamat ja toidukava vastdiagnoositutele</strong>'),
            @('Zacznij mądrzej jeść, czuć się silniejszym i lepiej żyć – już dziś.', 'Alustage tervislikumat toitumist, tundke end tugevamana ja elage paremini – juba täna.'),
            @('Przewiń do góry i kliknij przycisk "KUP TERAZ"! Zdobądź swój egzemplarz już teraz, zanim skończy się zniżka!', 'Keri üles ja klõpsa nupule „OSTA KOHE“! Hangi oma koopia kohe, enne kui soodustus lõppeb!'),
            @('Zamów teraz i zaoszczędź 70%, zanim ta ograniczona czasowo oferta zniknie.', 'Telli kohe ja säästa 70%, enne kui see piiratud ajaga pakkumine aegub.'),
            @('Opinia klienta 1', 'Kliendi arvustus 1'),
            @('Opinia klienta 2', 'Kliendi arvustus 2'),
            @('Opinia klienta 3', 'Kliendi arvustus 3'),
            @('Opinia klienta 4', 'Kliendi arvustus 4'),
            @('Oto co mówią o nas inni:', 'Siin on see, mida teised meie kohta ütlevad:'),
            @('Här är wat andra säger om oss:', 'Siin on see, mida teised meie kohta ütlevad:')
        )
    }
)

foreach ($l in $languages) {
    $lang = $l.lang
    $dest_dir = Join-Path $base_dir $l.dest
    
    if (-not (Test-Path $dest_dir)) {
        New-Item -ItemType Directory -Path $dest_dir -Force | Out-Null
        Write-Host "Created directory: $dest_dir"
    }
    
    $content = $template_content
    
    # 1. Replace image filenames to point to correct suffix
    $content = $content.Replace("IMAGE1-pl.png", "IMAGE1-$lang.png")
    $content = $content.Replace("IMAGE2-pl.png", "IMAGE2-$lang.png")
    $content = $content.Replace("IMAGE3-pl.png", "IMAGE3-$lang.png")
    $content = $content.Replace("IMAGE4-pl.png", "IMAGE4-$lang.png")
    $content = $content.Replace("IMAGE5-pl.png", "IMAGE5-$lang.png")
    $content = $content.Replace("new-review-1-pl.png", "new-review-1-$lang.png")
    $content = $content.Replace("new-review-2-pl.png", "new-review-2-$lang.png")
    $content = $content.Replace("new-review-3-pl.png", "new-review-3-$lang.png")
    $content = $content.Replace("new-review-4-pl.png", "new-review-4-$lang.png")
    
    # 2. Sort replacements by the source text length in descending order
    $sorted_replacements = $l.replacements | Sort-Object { $_[0].Length } -Descending
    
    foreach ($r in $sorted_replacements) {
        $search = $r[0]
        $replace = $r[1]
        $content = $content.Replace($search, $replace)
    }
    
    # 3. Save the translated file
    $dest_file = Join-Path $dest_dir "index.html"
    [System.IO.File]::WriteAllText($dest_file, $content, [System.Text.Encoding]::UTF8)
    
    Write-Host "Generated Diabetes Shopify landing page for $($l.name) ($lang) at $dest_file"
}

Write-Host "Diabetes Shopify landing page generation completed successfully for all 6 languages!"
