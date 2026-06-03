$frPath = "c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main\diabetesfrancesshopify\index.html"
$bgPath = "c:\Users\Usuario\Downloads\diabetes-book-main (1)\diabetes-book-main\diabetesbulgaroshopify\index.html"

$content = [System.IO.File]::ReadAllText($frPath, [System.Text.Encoding]::UTF8)

# Replace lang
$content = $content.Replace('lang="fr"', 'lang="bg"')

# Replace document title script and title tag
$content = $content.Replace('document.title = "Régime diabétique – Smart Select";', 'document.title = "Диета при Диабет – Smart Select";')
$content = $content.Replace('<title>Régime diabétique – Smart Select</title>', '<title>Диета при Диабет – Smart Select</title>')

# Replace sticky countdown
$content = $content.Replace('⏰ DERNIÈRES HEURES – REMISE 70% SE TERMINE DANS', '⏰ ПОСЛЕДНИ ЧАСОВЕ – 70% ОТСТЪПКА ПРИКЛЮЧВА СЛЕД')
$content = $content.Replace('<span class="time-label">heures</span>', '<span class="time-label">чч</span>')
$content = $content.Replace('<span class="time-label">min</span>', '<span class="time-label">мм</span>')
$content = $content.Replace('<span class="time-label">sec</span>', '<span class="time-label">сс</span>')

# Replace intro section
$content = $content.Replace('Vous avez plus de 60 ans et vous avez du mal à contrôler votre glycémie sans renoncer aux aliments que vous aimez ?', 'Вие сте на възраст над 60 години и се борите да контролирате кръвната си захар, без да се отказвате от храните, които обичате?')
$content = $content.Replace('Si OUI, alors continuez à lire…', 'Ако отговорът е ДА, тогава продължете да четете…')

# Replace product image alt
$content = $content.Replace('alt="Le régime diabétique le plus facile après 60 ans – image du produit"', 'alt="Най-лесната диета при диабет след 60 – изображение на продукта"')
$content = $content.Replace('Régime diabétique le plus facile après 60 ans', 'Най-лесната диета при диабет след 60')
$content = $content.Replace('Vous économisez 70%', 'Спестявате 70%')
$content = $content.Replace('ACHETER MAINTENANT', 'КУПЕТЕ СЕГА')

# Replace buy 1 get 3
$content = $content.Replace('ACHETEZ 1 OBTENEZ 3', 'КУПЕТЕ 1, ПОЛУЧЕТЕ 3')
$content = $content.Replace('Pour une durée limitée seulement, voici ce que vous obtiendrez :', 'Само за ограничено време, ето какво ще получите:')
$content = $content.Replace('alt="Pack de 3 livres – Régime diabétique"', 'alt="Пакет от 3 книги – Диета при диабет"')

# Replace sub-headline
$content = $content.Replace('Pensez-vous que vous devez manger des aliments ennuyeux et sans goût pour gérer votre diabète après 60 ans ?', 'Вярвате ли, че трябва да ядете скучна, безвкусна храна, за да управлявате диабета си след 60?')
$content = $content.Replace('Détrompez-vous.', 'Помислете отново.')
$content = $content.Replace('La vérité est que la plupart des régimes pour les seniors atteints de diabète sont <em>bien trop restrictifs</em> et vous laissent frustré, affamé et vaincu.', 'Истината е, че повечето диети за възрастни хора с диабет са <em>твърде ограничителни</em> и ви карат да се чувствате разочаровани, гладни и победени.')
$content = $content.Replace("On vous a probablement dit de couper les glucides, d'abandonner les saveurs ou de renoncer à vos repas préférés pour toujours.", 'Вероятно са ви казали да намалите въглехидратите, да се откажете от вкуса или да се откажете от любимите си ястия завинаги.')
$content = $content.Replace("<strong>Mais et si la gestion de votre glycémie n'avait pas à ressembler à une punition ?</strong>", '<strong>Но какво ще стане, ако управлението на кръвната ви захар не трябва да се усеща като наказание?</strong>')

$longFr = 'Avec <em>Le régime diabétique le plus facile après 60 ans</em>, vous découvrirez que bien manger avec le diabète n''est pas une question de privation — il s''agit de choix intelligents, basés sur la science, qui soutiennent votre corps, votre énergie et votre vie après 60 ans. Ce guide facile à suivre brise les mythes et vous donne exactement ce dont vous avez besoin pour bien manger, bien vivre et reprendre le contrôle de votre santé — sans passer des heures dans la cuisine ni dépendre de repas fades.'
$longBg = 'С <em>Най-лесната диета при диабет след 60</em> ще откриете, че доброто хранене при диабет не е свързано с лишения – става дума за интелигентни, научно обосновани избори, които поддържат тялото ви, вашата енергия и живота ви след 60. Това лесно за следване ръководство разбива митовете и ви дава точно това, от което се нуждаете, за да се храните добре, да живеете добре и да си върнете контрола над здравето си – без да прекарвате часове в кухнята или да разчитате на безвкусни ястия.'
$content = $content.Replace($longFr, $longBg)

# Replace lifestyle alt
$content = $content.Replace('alt="Image de style de vie régime diabétique"', 'alt="Изображение на начин на живот при диета за диабет"')

# Replace bestseller section
$content = $content.Replace('Ce best-seller comprend :', 'Този бестселър съдържа:')
$content = $content.Replace('✅ <strong>Un plan de régime diabétique simple et étape par étape</strong> conçu spécifiquement pour les personnes de plus de 60 ans', '✅ <strong>Опростен диетичен план при диабет стъпка по стъпка</strong>, създаден специално за хора над 60 години')
$content = $content.Replace('✅ <strong>Des recettes faciles à préparer</strong> avec des ingrédients du quotidien (pas d''aliments compliqués ou chers !)', '✅ <strong>Лесни за приготвяне рецепти</strong> с ежедневни съставки (без сложни или скъпи храни!)')
$content = $content.Replace('✅ <strong>Des conseils nutritionnels</strong> qui fonctionnent avec votre métabolisme vieillissant — pas contre lui', '✅ <strong>Хранителни насоки</strong>, които работят с вашия забавен метаболизъм при стареене – а не срещу него')
$content = $content.Replace('✅ <strong>Des conseils pratiques</strong> pour stimuler l''énergie, abaisser la glycémie et réduire l''A1C naturellement', '✅ <strong>Практически съвети</strong> за повишаване на енергията, понижаване на кръвната захар и намаляване на A1C по естествен начин')
$content = $content.Replace('✅ <strong>Des repas délicieux</strong> qui soutiennent la santé cardiaque, la gestion du poids et la sensibilité à l''insuline', '✅ <strong>Вкусни ястия</strong>, които поддържат здравето на сърцето, управлението на теглото и инсулиновата чувствителност')
$content = $content.Replace('✅ <strong>Des conseils pour faire les courses</strong> et des exemples de plans de repas pour vous faciliter la vie', '✅ <strong>Съвети за пазаруване</strong> и примерни планове за хранене, за да улесните живота си')
$content = $content.Replace('✅ <strong>Des stratégies basées sur la science et approuvées par des experts</strong> pour vous aider à vous sentir mieux chaque jour', '✅ <strong>Одобрени от експерти, научно подкрепени стратегии</strong>, които да ви помогнат да се чувствате по-добре всеки ден')

# Replace alt lifestyle images
$content = $content.Replace('alt="Repas sain pour diabétiques"', 'alt="Здравословно ястие за диабетици"')
$content = $content.Replace('alt="Bannière remise 70%"', 'alt="Банер за 70% отстъпка"')
$content = $content.Replace('alt="Image pack produit"', 'alt="Изображение на пакета от продукти"')

# Replace long paragraph
$content = $content.Replace('<strong>Gérer le diabète après 60 ans n''a pas à être écrasant ou déroutant.</strong>', '<strong>Управлението на диабета след 60 години не трябва да бъде непосилно или объркващо.</strong>')

$longFr2 = 'Si vous en avez assez des plans de repas complexes, des aliments fades et de deviner constamment ce qui est "sûr" à manger, ce pack est pour vous. Le régime diabétique le plus facile après 60 ans est un guide clair, pratique et basé sur la science, conçu spécifiquement pour les personnes âgées qui souhaitent contrôler leur glycémie, protéger leur cœur et stimuler leur énergie — sans renoncer aux aliments qu''elles aiment. Téléchargement numérique instantané — ce sont des e-books (Une fois le paiement effectué, vous aurez immédiatement la possibilité de télécharger le(s) produit(s) depuis la page d''achat final, et vous recevrez également un e-mail de téléchargement peu après).'
$longBg2 = 'Ако сте уморени от сложни хранителни планове, безвкусна храна и постоянно отгатване какво е „безопасно“ за ядене, този пакет е за вас. „Най-лесната диета при диабет след 60“ е ясно, практично и научно обосновано ръководство, създадено специално за по-възрастни хора, които искат да контролират кръвната си захар, да предпазят сърцето си и да повишат енергията си – без да се отказват от храните, които обичат. Незабавно цифрово изтегляне – това са електронни книги (След завършване на плащането веднага ще имате възможност да изтеглите продукта(ите) от крайната страница за покупка, а малко след това ще получите и имейл за изтегляне).'
$content = $content.Replace($longFr2, $longBg2)

# Replace bonuses
$content = $content.Replace('+ <strong>BONUS 1</strong> : <strong>Livre de cuisine pour le diabète de type 2</strong>', '+ <strong>БОНУС 1</strong>: <strong>Готварска книга за диабет тип 2</strong>')
$content = $content.Replace('+ <strong>BONUS 2</strong> : <strong>Livre de cuisine et plan de repas pour les personnes nouvellement diagnostiquées</strong>', '+ <strong>БОНУС 2</strong>: <strong>Готварска книга и хранителен план за новодиагностицирани с диабет</strong>')

# Replace CTA
$content = $content.Replace('Commencez à manger plus intelligemment, à vous sentir plus fort et à mieux vivre — dès aujourd''hui.', 'Започнете да се храните по-умно, да се чувствате по-силни и да живеете по-добре – днес.')
$content = $content.Replace('<strong>Faites défiler vers le haut et cliquez sur le bouton "ACHETER MAINTENANT" ! Obtenez votre copie maintenant avant l''expiration de la remise !</strong>', '<strong>Превъртете нагоре и кликнете върху бутона „КУПЕТЕ СЕГА“! Вземете вашето копие сега, преди отстъпката да изтече!</strong>')
$content = $content.Replace('<em>Commandez maintenant et économisez 70% avant que cette offre limitée ne disparaisse.</em>', '<em>Поръчайте сега и спестете 70%, преди тази ограничена оферта да изчезне.</em>')

# Replace reviews
$content = $content.Replace('Voici ce que les autres disent de nous :', 'Ето какво казват другите за нас :')
$content = $content.Replace('alt="Avis client 1"', 'alt="Рецензия на клиент 1"')
$content = $content.Replace('alt="Avis client 2"', 'alt="Рецензия на клиент 2"')
$content = $content.Replace('alt="Avis client 3"', 'alt="Рецензия на клиент 3"')
$content = $content.Replace('alt="Avis client 4"', 'alt="Рецензия на клиент 4"')

# Replace footer links
$content = $content.Replace('Contactez-nous', 'Свържете се с нас')
$content = $content.Replace('Politique de confidentialité', 'Политика за поверителност')
$content = $content.Replace('Politique de remboursement et de retour', 'Политика за възстановяване на суми и връщане')
$content = $content.Replace('Conditions générales', 'Правила и условия')

# Replace Image references to Liquid Shopify format with correct BG assets
$content = $content.Replace("product-bundle-v2-fr.jpg", "IMAGEM1_BG.png")
$content = $content.Replace("3books-bundle-v2-fr.jpg", "IMAGEM2_BG.png")
$content = $content.Replace("lifestyle-1-v2-fr.jpg", "IMAGEM3_BG.png")
$content = $content.Replace("lifestyle-2-v2-fr.jpg", "IMAGEM4_BG.png")
$content = $content.Replace("70off-banner-v2-fr.png", "IMAGEM5_BG.png")
$content = $content.Replace("review-1-v2-fr.jpg", "1_BG.png")
$content = $content.Replace("review-2-v2-fr.jpg", "2_BG.png")
$content = $content.Replace("review-3-v2-fr.jpg", "3_BG.png")
$content = $content.Replace("review-4-v2-fr.jpg", "4_BG.png")

# Replace checkout URLs with Bulgarian variant, BGN currency and bg locale
$content = $content.Replace("/cart/43034496703309:1?locale=fr&currency=EUR", "/cart/43045172805709:1?locale=bg&currency=BGN")

[System.IO.File]::WriteAllText($bgPath, $content, [System.Text.Encoding]::UTF8)
Write-Host "Bulgarian Shopify HTML generation complete!"
