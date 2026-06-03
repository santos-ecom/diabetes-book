# This script reads gorduranofigadofrancesshopify/index.html and generates translated versions for pl, nl, sv, da, no.

$fr_html = Get-Content -Path 'gorduranofigadofrancesshopify/index.html' -Raw -Encoding UTF8

$translations = @{
    "polones" = @{
        lang = "pl"
        suffix = "PL"
        title = "FoieGras – Atlas Library"
        countdown_label = "OSTATNIE GODZINY - 70% ZNIŻKI KOŃCZY SIĘ WKRÓTCE"
        hours_label = "godzin"
        minutes_label = "min"
        seconds_label = "sek"
        
        replacements = @(
            @("Retenez-vous`r`n                            votre respiration à chaque fois que votre médecin parle de votre foie... mais n'avez`r`n                            toujours aucune idée de ce que vous êtes censé manger ?", "Czy wstrzymujesz oddech za każdym razem, gdy lekarz mówi o Twojej wątrobie... ale nadal nie masz pojęcia, co powinieneś jeść?"),
            @("Retenez-vous votre respiration à chaque fois que votre médecin parle de votre foie... mais n'avez toujours aucune idée de ce que vous êtes censé manger ?", "Czy wstrzymujesz oddech za każdym razem, gdy lekarz mówi o Twojej wątrobie... ale nadal nie masz pojęcia, co powinieneś jeść?"),
            @("Vous n'êtes pas le seul.", "Nie jesteś jedyny."),
            @("Et vous ne faites rien de mal.", "I nie robisz nic złego."),
            @("La plupart des gens diagnostiqués avec un foie`r`n                    gras s'entendent dire :`r`n                    « Perdez du poids. Mangez plus sainement. »", "Większości osób ze zdiagnozowanym stłuszczeniem wątroby mówi się: „Schudnij. Jedz zdrowiej”."),
            @("La plupart des gens diagnostiqués avec un foie gras s'entendent dire : « Perdez du poids. Mangez plus sainement. »", "Większości osób ze zdiagnozowanym stłuszczeniem wątroby mówi się: „Schudnij. Jedz zdrowiej”."),
            @("Ensuite, ils sont renvoyés chez eux sans véritable`r`n                    plan. Aucun`r`n                    exemple de repas. Aucune structure étape par étape.", "Następnie są odsyłani do domu bez żadnego konkretnego planu. Bez przykładowych posiłków. Bez struktury krok po kroku."),
            @("Ensuite, ils sont renvoyés chez eux sans véritable plan. Aucun exemple de repas. Aucune structure étape par étape.", "Następnie są odsyłani do domu bez żadnego konkretnego planu. Bez przykładowych posiłków. Bez struktury krok po kroku."),
            @("Le Livre de Recettes Complet pour le Foie`r`n                                                Gras pour`r`n                                                Débutants + 2`r`n                                                BONUS", "Kompletna Książka Kucharska na Stłuszczenie Wątroby dla Początkujących + 2 BONUSY"),
            @("Le Livre de Recettes Complet pour le Foie Gras pour Débutants + 2 BONUS", "Kompletna Książka Kucharska na Stłuszczenie Wątroby dla Początkujących + 2 BONUSY"),
            @("Le Livre de Recettes Complet pour le Foie Gras pour`r`n                                            Débutants + 2 BONUS", "Kompletna Książka Kucharska na Stłuszczenie Wątroby dla Początkujących + 2 BONUSY"),
            @("19.90 €", "19.90 €"),
            @("59.70 €", "59.70 €"),
            @("Vous Économisez 70%", "Oszczędzasz 70%"),
            @("ACHETER`r`n                                MAINTENANT", "KUP TERAZ"),
            @("ACHETER MAINTENANT", "KUP TERAZ"),
            @("ACHETEZ-EN 1, OBTENEZ-EN`r`n                            3", "KUP 1, OTRZYMAJ 3"),
            @("ACHETEZ-EN 1, OBTENEZ-EN 3", "KUP 1, OTRZYMAJ 3"),
            @("Pour un temps limité, voici ce que vous obtiendrez`r`n                    :", "Przez ograniczony czas otrzymasz:"),
            @("Pour un temps limité, voici ce que vous obtiendrez :", "Przez ograniczony czas otrzymasz:"),
            @("Pourquoi cette offre semble-t-elle`r`n                                trop belle`r`n                                pour être vraie ?", "Dlaczego ta oferta wydaje się zbyt piękna, aby była prawdziwa?"),
            @("Pourquoi cette offre semble-t-elle trop belle pour être vraie ?", "Dlaczego ta oferta wydaje się zbyt piękna, aby była prawdziwa?"),
            @("Nous comprenons - trois livres à succès`r`n                        pour`r`n                        le prix d'un n'est pas quelque chose que vous voyez tous les jours.", "Rozumiemy to – trzy bestsellerowe książki w cenie jednej to nie jest coś, co widzi się codziennie."),
            @("Nous comprenons - three livres à succès pour le prix d'un n'est pas quelque chose que vous voyez tous les jours.", "Rozumiemy to – trzy bestsellerowe książki w cenie jednej to nie jest coś, co widzi się codziennie."),
            @("Voici la simple vérité : une fois par an, vers`r`n                    cette`r`n                    saison, nous organisons un événement spécial pour remercier nos lecteurs et rendre nos collections`r`n                    les plus populaires`r`n                    plus accessibles.", "Oto prosta prawda: raz w roku, mniej więcej o tej porze, organizujemy specjalne wydarzenie, aby podziękować naszym czytelnikom i sprawić, by nasze najpopularniejsze kolekcje były bardziej dostępne."),
            @("Voici la simple vérité : une fois par an, vers cette saison, nous organisons un événement spécial pour remercier nos lecteurs et rendre nos collections les plus populaires plus accessibles.", "Oto prosta prawda: raz w roku, mniej więcej o tej porze, organizujemy specjalne wydarzenie, aby podziękować naszym czytelnikom i sprawić, by nasze najpopularniejsze kolekcje były bardziej dostępne."),
            @("Parce que nous gérons tout directement — de`r`n                    l'impression à l'expédition — nous pouvons éviter les marges de vente au détail et proposer`r`n                    l'ensemble (normalement 59,70 €)`r`n                    pour seulement 19,90 €.", "Ponieważ zarządzamy wszystkim bezpośrednio – od druku po wysyłkę – możemy uniknąć marż detalicznych i zaoferować cały zestaw (zwykle 59,70 €) za jedyne 19,90 €."),
            @("Parce que nous gérons tout directement — de l'impression à l'expédition — nous pouvons éviter les marges de vente au détail et proposer l'ensemble (normalement 59,70 €) pour seulement 19,90 €.", "Ponieważ zarządzamy wszystkim bezpośrednio – od druku po wysyłkę – możemy uniknąć marż detalicznych i zaoferować cały zestaw (zwykle 59,70 €) za jedyne 19,90 €."),
            @("À la fin de l'événement, les prix`r`n                        redeviennent`r`n                        normaux.", "Po zakończeniu wydarzenia ceny wrócą do normy."),
            @("À la fin de l'événement, les prix redeviennent normaux.", "Po zakończeniu wydarzenia ceny wrócą do normy."),
            @("Le foie gras s'améliore`r`n                            quand…", "Stan stłuszczonej wątroby poprawia się, gdy..."),
            @("Le foie gras s'améliore quand…", "Stan stłuszczonej wątroby poprawia się, gdy..."),
            @("…l'inflammation diminue et la sensibilité à l'insuline`r`n                        s'améliore.", "...zmniejsza się stan zapalny i poprawia się wrażliwość na insulinę."),
            @("…l'inflammation diminue et la sensibilité à l'insuline s'améliore.", "...zmniejsza się stan zapalny i poprawia się wrażliwość na insulinę."),
            @("Cela`r`n                    se produit grâce à des repas équilibrés, satisfaisants et validés — pas par des`r`n                    restrictions ou des`r`n                    punitions.", "Dzieje się tak dzięki zbilansowanym, satysfakcjonującym i sprawdzonym posiłkom – a nie restrykcjom czy karom."),
            @("Cela se produit grâce à des repas équilibrés, satisfaisants et validés — pas par des restrictions ou des punitions.", "Dzieje się tak dzięki zbilansowanym, satysfakcjonującym i sprawdzonym posiłkom – a nie restrykcjom czy karom."),
            @("C'est pourquoi Le Pack Complet du Livre de Recettes pour le Foie Gras pour`r`n                        Débutants a été créé.", "Dlatego właśnie powstał Kompletny Pakiet Książki Kucharskiej na Stłuszczenie Wątroby dla Początkujących."),
            @("C'est pourquoi Le Pack Complet du Livre de Recettes pour le Foie Gras pour Débutants a été créé.", "Dlatego właśnie powstał Kompletny Pakiet Książki Kucharskiej na Stłuszczenie Wątroby dla Początkujących."),
            @("Au lieu d'un livre écrasant, vous obtenez trois guides soigneusement conçus qui fonctionnent`r`n                    ensemble pour vous`r`n                    donner :", "Zamiast jednej przytłaczającej książki otrzymujesz trzy starannie opracowane przewodniki, które współpracują ze sobą, aby dać Ci:"),
            @("Au lieu d'un livre écrasant, vous obtenez trois guides soigneusement conçus qui fonctionnent ensemble pour vous donner :", "Zamiast jednej przytłaczającej książki otrzymujesz trzy starannie opracowane przewodniki, które współpracują ze sobą, aby dać Ci:"),
            @("De la Clarté", "Jasność"),
            @("De la Confiance", "Pewność siebie"),
            @("Des repas que vous apprécierez vraiment", "Posiłki, które naprawdę polubisz"),
            @("Pas d'extrêmes. Pas de tactiques intimidantes. Juste une voie pratique et réaliste pour`r`n                        avancer.", "Bez skrajności. Bez zastraszania. Tylko praktyczna i realistyczna droga naprzód."),
            @("Pas d'extrêmes. Pas de tactiques intimidantes. Juste une voie pratique et réaliste pour avancer.", "Bez skrajności. Bez zastraszania. Tylko praktyczna i realistyczna droga naprzód."),
            @("Ce Qui Se Trouve Déans Ce Pack de 3 Livres Bestseller", "Co znajduje się w tym pakiecie 3 bestsellerowych książek"),
            @("Le Livre de Recettes Complet du Régime pour le Foie Gras (Édition 2026) comprend`r`n                            :", "Kompletna Książka Kucharska Diety na Stłuszczenie Wątroby (Edycja 2026) zawiera:"),
            @("Le Livre de Recettes Complet du Régime pour le Foie Gras (Édition 2026) comprend :", "Kompletna Książka Kucharska Diety na Stłuszczenie Wątroby (Edycja 2026) zawiera:"),
            @("Un guide nutritionnel sur le foie gras adapté aux débutants", "Przewodnik żywieniowy o stłuszczeniu wątroby dla początkujących"),
            @("Des explications claires sur ce qui aide votre foie — et ce qui joue contre lui en silence —`r`n                        sans`r`n                        jargon médical déroutant.", "Jasne wyjaśnienia, co pomaga Twojej wątrobie – a co po cichu jej szkodzi – bez skomplikowanego medycznego żargonu."),
            @("Des explications claires sur ce qui aide votre foie — et ce qui joue contre lui en silence — sans jargon médical déroutant.", "Jasne wyjaśnienia, co pomaga Twojej wątrobie – a co po cichu jej szkodzi – bez skomplikowanego medycznego żargonu."),
            @("+ de 100 recettes savoureuses et respectueuses de votre foie", "Ponad 100 smacznych i przyjaznych dla wątroby przepisów"),
            @("De vrais repas avec de vrais ingrédients. D'inspiration méditerranéenne, rassasiants et`r`n                        approuvés par toute la famille.", "Prawdziwe posiłki z prawdziwych składników. Inspirowane kuchnią śródziemnomorską, sycące i zatwierdzone przez całą rodzinę."),
            @("De vrais repas avec de vrais ingrédients. D'inspiration méditerranéenne, rassasiants et approuvés par toute la famille.", "Prawdziwe posiłki z prawdziwych składników. Inspirowane kuchnią śródziemnomorską, sycące i zatwierdzone przez całą rodzinę."),
            @("Un plan de repas structuré sur 28 jours", "Ustrukturyzowany 28-dniowy plan posiłków"),
            @("Plus de devinettes. Plus de fatigue décisionnelle. Suivez simplement le plan et reprenez le`r`n                        contrôle.", "Koniec ze zgadywaniem. Koniec ze zmęczeniem podejmowaniem decyzji. Po prostu postępuj zgodnie z planem i odzyskaj kontrolę."),
            @("Plus de devinettes. Plus de fatigue décisionnelle. Suivez simplement le plan et reprenez le contrôle.", "Koniec ze zgadywaniem. Koniec ze zmęczeniem podejmowaniem decyzji. Po prostu postępuj zgodnie z planem i odzyskaj kontrolę."),
            @("Stratégies alimentaires anti-inflammatoires", "Przeciwzapalne strategie żywieniowe"),
            @("Découvrez comment réduire l'inflammation de votre foie tout en continuant à profiter des`r`n                        aliments que vous aimez.", "Dowiedz się, jak zmniejszyć stan zapalny wątroby, wciąż ciesząc się jedzeniem, które lubisz."),
            @("Découvrez comment réduire l'inflammation de votre foie tout en continuant à profiter des aliments que vous aimez.", "Dowiedz się, jak zmniejszyć stan zapalny wątroby, wciąż ciesząc się jedzeniem, które lubisz."),
            @("Listes de courses hebdomadaires", "Cotygodniowe listy zakupów"),
            @("Conçues pour vous faire gagner du temps, de l'argent et éviter le stress au supermarché.", "Zaprojektowane, aby zaoszczędzić Twój czas, pieniądze i uniknąć stresu w supermarkecie."),
            @("Repas favorisant un bon poids corporel — sans régime draconien", "Posiłki wspierające odpowiednią wagę – bez drastycznych diet"),
            @("Créés pour encourager une perte de poids progressive et durable, pas des extrêmes à court terme.", "Stworzone, aby wspierać stopniową i trwałą utratę wagi, a nie krótkotrwałe skrajności."),
            @("Conseils et motivation pour créer de bonnes habitudes", "Wskazówki i motywacja do wyrobienia dobrych nawyków"),
            @("Pour que cela devienne un changement de mode de vie — pas juste un autre livre qui prend la`r`n                        poussière.", "Aby stało się to trwałą zmianą stylu życia – a nie kolejną książką kurzącą się na półce."),
            @("Pour que cela devienne un changement de mode de vie — pas juste un autre livre qui prend la poussière.", "Aby stało się to trwałą zmianą stylu życia – a nie kolejną książką kurzącą się na półce."),
            @("Si vous vous sentez :", "Jeśli czujesz się:"),
            @("anxieux concernant la santé de votre foie", "zaniepokojony stanem zdrowia swojej wątroby"),
            @("frustré par les conseils contradictoires", "sfrustrowany sprzecznymi radami"),
            @("dépassé à chaque fois qu'il faut cuisiner", "przytłoczony za każdym razem, gdy musisz gotować"),
            @("ou inquiet que les choses empirent si vous n'agissez pas", "lub martwisz się, że sytuacja się pogorszy, jeśli nie podejmiesz działań"),
            @("Ce pack a été créé <strong>pour vous</strong>.", "Ten pakiet został stworzony <strong>dla Ciebie</strong>."),
            @("Vous n'avez pas besoin d'être parfait(e).", "Nie musisz być idealny."),
            @("Vous n'avez pas besoin d'extrêmes.", "Nie potrzebujesz skrajności."),
            @("Vous avez juste besoin d'un <strong>plan clair et adapté</strong> qui s'intègre à la vraie vie.", "Potrzebujesz po prostu <strong>jasnego, dostosowanego planu</strong>, który wpasuje się w prawdziwe życie."),
            @("Pour un temps limité, vous pouvez obtenir le <strong>pack complet de 3 livres à 70 % de`r`n                            réduction</strong> — moins`r`n                        que le prix d'un repas à emporter, mais quelque chose qui peut vraiment changer comment vous`r`n                        vous sentez <em>tous`r`n                            les jours</em>. Téléchargement numérique direct et instantané (Après le paiement, vous aurez`r`n                        immédiatement l'option de télécharger votre commande sur la page finale et vous recevrez`r`n                        un e-mail de téléchargement peu de temps après).", "Przez ograniczony czas możesz kupić <strong>cały pakiet 3 książek z 70% zniżką</strong> — to mniej niż koszt posiłku na wynos, ale coś, co naprawdę może odmienić to, jak czujesz się <em>każdego dnia</em>. Bezpośrednie i natychmiastowe pobranie cyfrowe (Po dokonaniu płatności natychmiast otrzymasz możliwość pobrania zamówienia na stronie końcowej, a wkrótce potem otrzymasz e-mail z linkiem do pobrania)."),
            @("Pourquoi attendre ?", "Dlaczego czekać?"),
            @("Prenez le contrôle de la santé de votre foie dès aujourd'hui calmement, avec`r`n                            confiance, et sans`r`n                            renoncer</strong> <strong>au plaisir de manger.", "Przejmij kontrolę nad zdrowiem swojej wątroby już dziś — spokojnie, z pewnością siebie i bez rezygnacji</strong> <strong>z przyjemności jedzenia."),
            @("Prenez le contrôle de la santé de votre foie dès aujourd'hui calmement, avec confiance, et sans renoncer</strong> <strong>au plaisir de manger.", "Przejmij kontrolę nad zdrowiem swojej wątroby już dziś — spokojnie, z pewnością siebie i bez rezygnacji</strong> <strong>z przyjemności jedzenia."),
            @("Parce qu'il ne s'agit pas de restrictions.", "Ponieważ nie chodzi o restrykcje."),
            @("Il s'agit d'avoir enfin un plan qui a du sens.", "Chodzi o to, aby w końcu mieć plan, który ma sens."),
            @("Commandez maintenant </strong>et économisez 70 % avant que cette`r`n                                    offre limitée`r`n                                    ne disparaisse.", "Zamów teraz </strong>i zaoszczędź 70%, zanim ta ograniczona oferta wygaśnie."),
            @("Commandez maintenant </strong>et économisez 70 % avant que cette offre limitée ne disparaisse.", "Zamów teraz </strong>i zaoszczędź 70%, zanim ta ograniczona oferta wygaśnie."),
            @("Voici Ce Que`r`n                            Les Gens Disent De Nous", "Oto, co ludzie mówią o nas")
        )
    }
    "holandes" = @{
        lang = "nl"
        suffix = "NL"
        title = "FoieGras – Atlas Library"
        countdown_label = "LAATSTE UREN - 70% KORTING EINDIGT BINNENKORT"
        hours_label = "uren"
        minutes_label = "min"
        seconds_label = "sec"
        
        replacements = @(
            @("Retenez-vous`r`n                            votre respiration à chaque fois que votre médecin parle de votre foie... mais n'avez`r`n                            toujours aucune idée de ce que vous êtes censé manger ?", "Houdt u uw adem in telkens wanneer uw arts over uw lever spreekt... maar heeft u nog steeds geen idee wat u geacht wordt te eten?"),
            @("Retenez-vous votre respiration à chaque fois que votre médecin parle de votre foie... mais n'avez toujours aucune idée de ce que vous êtes censé manger ?", "Houdt u uw adem in telkens wanneer uw arts over uw lever spreekt... maar heeft u nog steeds geen idee wat u geacht wordt te eten?"),
            @("Vous n'êtes pas le seul.", "U bent niet de enige."),
            @("Et vous ne faites rien de mal.", "En u doet niets verkeerd."),
            @("La plupart des gens diagnostiqués avec un foie`r`n                    gras s'entendent dire :`r`n                    « Perdez du poids. Mangez plus sainement. »", "De meeste mensen bij wie een vette lever is vastgesteld, krijgen te horen: «Val af. Eet gezonder.»"),
            @("La plupart des gens diagnostiqués avec un foie gras s'entendent dire : « Perdez du poids. Mangez plus sainement. »", "De meeste mensen bij wie een vette lever is vastgesteld, krijgen te horen: «Val af. Eet gezonder.»"),
            @("Ensuite, ils sont renvoyés chez eux sans véritable`r`n                    plan. Aucun`r`n                    exemple de repas. Aucune structure étape par étape.", "Vervolgens worden ze naar huis gestuurd zonder echt plan. Geen voorbeeldmaaltijden. Geen stapsgewijze structuur."),
            @("Ensuite, ils sont renvoyés chez eux sans véritable plan. Aucun exemple de repas. Aucune structure étape par étape.", "Vervolgens worden ze naar huis gestuurd zonder echt plan. Geen voorbeeldmaaltijden. Geen stapsgewijze structuur."),
            @("Le Livre de Recettes Complet pour le Foie`r`n                                                Gras pour`r`n                                                Débutants + 2`r`n                                                BONUS", "Het Complete Kookboek voor de Vette Lever voor Beginners + 2 BONUS"),
            @("Le Livre de Recettes Complet pour le Foie Gras pour Débutants + 2 BONUS", "Het Complete Kookboek voor de Vette Lever voor Beginners + 2 BONUS"),
            @("Le Livre de Recettes Complet pour le Foie Gras pour`r`n                                            Débutants + 2 BONUS", "Het Complete Kookboek voor de Vette Lever voor Beginners + 2 BONUS"),
            @("Vous Économisez 70%", "U bespaart 70%"),
            @("ACHETER`r`n                                MAINTENANT", "NU KOPEN"),
            @("ACHETER MAINTENANT", "NU KOPEN"),
            @("ACHETEZ-EN 1, OBTENEZ-EN`r`n                            3", "KOOP 1, ONTVANG ER 3"),
            @("ACHETEZ-EN 1, OBTENEZ-EN 3", "KOOP 1, ONTVANG ER 3"),
            @("Pour un temps limité, voici ce que vous obtiendrez`r`n                    :", "Voor een beperkte tijd is dit wat u krijgt:"),
            @("Pour un temps limité, voici ce que vous obtiendrez :", "Voor een beperkte tijd is dit wat u krijgt:"),
            @("Pourquoi cette offre semble-t-elle`r`n                                trop belle`r`n                                pour être vraie ?", "Waarom lijkt deze aanbieding te mooi om waar te zijn?"),
            @("Pourquoi cette offre semble-t-elle trop belle pour être vraie ?", "Waarom lijkt deze aanbieding te mooi om waar te zijn?"),
            @("Nous comprenons - trois livres à succès`r`n                        pour`r`n                        le prix d'un n'est pas quelque chose que vous voyez tous les jours.", "We begrijpen het - drie bestsellerboeken voor de prijs van één is niet iets wat je elke dag ziet."),
            @("Nous comprenons - three livres à succès pour le prix d'un n'est pas quelque chose que vous voyez tous les jours.", "We begrijpen het - drie bestsellerboeken voor de prijs van één is niet iets wat je elke dag ziet."),
            @("Voici la simple vérité : une fois par an, vers`r`n                    cette`r`n                    saison, nous organisons un événement spécial pour remercier nos lecteurs et rendre nos collections`r`n                    les plus populaires`r`n                    plus accessibles.", "Hier is de simpele waarheid: eenmaal per jaar, rond dit seizoen, organiseren we een speciaal evenement om onze lezers te bedanken en onze meest populaire collecties toegankelijker te maken."),
            @("Voici la simple vérité : une fois par an, vers cette saison, nous organisons un événement spécial pour remercier nos lecteurs et rendre nos collections les plus populaires plus accessibles.", "Hier is de simpele waarheid: eenmaal per jaar, rond dit seizoen, organiseren we een speciaal evenement om onze lezers te bedanken en onze meest populaire collecties toegankelijker te maken."),
            @("Parce que nous gérons tout directement — de`r`n                    l'impression à l'expédition — nous pouvons éviter les marges de vente au détail et proposer`r`n                    l'ensemble (normalement 59,70 €)`r`n                    pour seulement 19,90 €.", "Omdat we alles direct beheren - van druk tot verzending - kunnen we retailmarges vermijden en het hele pakket (normaal € 59,70) aanbieden voor slechts € 19,90."),
            @("Parce que nous gérons tout directement — de l'impression à l'expédition — nous pouvons éviter les marges de vente au détail et proposer l'ensemble (normalement 59,70 €) pour seulement 19,90 €.", "Omdat we alles direct beheren - van druk tot verzending - kunnen we retailmarges vermijden og het hele pakket (normaal € 59,70) aanbieden voor slechts € 19,90."),
            @("À la fin de l'événement, les prix`r`n                        redeviennent`r`n                        normaux.", "Aan het einde van het evenement worden de prijzen weer normaal."),
            @("À la fin de l'événement, les prix redeviennent normaux.", "Aan het einde van het evenement worden de prijzen weer normaal."),
            @("Le foie gras s'améliore`r`n                            quand…", "De vette lever verbetert wanneer..."),
            @("Le foie gras s'améliore quand…", "De vette lever verbetert wanneer..."),
            @("…l'inflammation diminue et la sensibilité à l'insuline`r`n                        s'améliore.", "...de ontsteking afneemt en de insulinegevoeligheid verbetert."),
            @("…l'inflammation diminue et la sensibilité à l'insuline s'améliore.", "...de ontsteking afneemt en de insulinegevoeligheid verbetert."),
            @("Cela`r`n                    se produit grâce à des repas équilibrés, satisfaisants et validés — pas par des`r`n                    restrictions ou des`r`n                    punitions.", "Dit gebeurt door evenwichtige, bevredigende en geteste maaltijden - niet door beperkingen of straffen."),
            @("Cela se produit grâce à des repas équilibrés, satisfaisants et validés — pas par des restrictions ou des punitions.", "Dit gebeurt door evenwichtige, bevredigende en geteste maaltijden - niet door beperkingen of straffen."),
            @("C'est pourquoi Le Pack Complet du Livre de Recettes pour le Foie Gras pour`r`n                        Débutants a été créé.", "Daarom is Het Complete Pakket Kookboek voor de Vette Lever voor Beginners gecreëerd."),
            @("C'est pourquoi Le Pack Complet du Livre de Recettes pour le Foie Gras pour Débutants a été créé.", "Daarom is Het Complete Pakket Kookboek voor de Vette Lever voor Beginners gecreëerd."),
            @("Au lieu d'un livre écrasant, vous obtenez trois guides soigneusement conçus qui fonctionnent`r`n                    ensemble pour vous`r`n                    donner :", "In plaats van één overweldigend boek krijgt u drie zorgvuldig ontworpen gidsen die samenwerken om u te geven:"),
            @("Au lieu d'un livre écrasant, vous obtenez trois guides soigneusement conçus qui fonctionnent ensemble pour vous donner :", "In plaats van één overweldigend boek krijgt u drie zorgvuldig ontworpen gidsen die samenwerken om u te geven:"),
            @("De la Clarté", "Duidelijkheid"),
            @("De la Confiance", "Vertrouwen"),
            @("Des repas que vous apprécierez vraiment", "Maaltijden waar u echt van zult genieten"),
            @("Pas d'extrêmes. Pas de tactiques intimidantes. Juste une voie pratique et réaliste pour`r`n                        avancer.", "Geen extremen. Geen intimidatietactieken. Gewoon een praktische en realistische weg vooruit."),
            @("Pas d'extrêmes. Pas de tactiques intimidantes. Juste une voie pratique et réaliste pour avancer.", "Geen extremen. Geen intimidatietactieken. Gewoon een praktische en realistische weg vooruit."),
            @("Ce Qui Se Trouve Déans Ce Pack de 3 Livres Bestseller", "Wat zit er in dit pakket van 3 bestsellerboeken"),
            @("Le Livre de Recettes Complet du Régime pour le Foie Gras (Édition 2026) comprend`r`n                            :", "Het Complete Kookboek voor het Vette Lever Dieet (Editie 2026) bevat:"),
            @("Le Livre de Recettes Complet du Régime pour le Foie Gras (Édition 2026) comprend :", "Het Complete Kookboek voor het Vette Lever Dieet (Editie 2026) bevat:"),
            @("Un guide nutritionnel sur le foie gras adapté aux débutants", "Een levervriendelijke voedingsgids voor beginners"),
            @("Des explications claires sur ce qui aide votre foie — et ce qui joue contre lui en silence —`r`n                        sans`r`n                        jargon médical déroutant.", "Duidelijke uitleg over wat uw lever helpt — en wat er in stilte tegenwerkt — zonder verwarrend medisch jargon."),
            @("Des explications claires sur ce qui aide votre foie — et ce qui joue contre lui en silence — sans jargon médical déroutant.", "Duidelijke uitleg over wat uw lever helpt — en wat er in stilte tegenwerkt — zonder verwarrend medisch jargon."),
            @("+ de 100 recettes savoureuses et respectueuses de votre foie", "Meer dan 100 heerlijke en levervriendelijke recepten"),
            @("De vrais repas avec de vrais ingrédients. D'inspiration méditerranéenne, rassasiants et`r`n                        approuvés par toute la famille.", "Echte maaltijden met echte ingrediënten. Mediterraan geïnspireerd, vullend en goedgekeurd door het hele gezin."),
            @("De vrais repas avec de vrais ingrédients. D'inspiration méditerranéenne, rassasiants et approuvés par toute la famille.", "Echte maaltijden met echte ingrediënten. Mediterraan geïnspireerd, vullend en goedgekeurd door het hele gezin."),
            @("Un plan de repas structuré sur 28 jours", "Een gestructureerd 28-daags maaltijdplan"),
            @("Plus de devinettes. Plus de fatigue décisionnelle. Suivez simplement le plan et reprenez le`r`n                        contrôle.", "Geen giswerk meer. Geen beslissingsmoeheid meer. Volg gewoon het plan en neem weer de controle."),
            @("Plus de devinettes. Plus de fatigue décisionnelle. Suivez simplement le plan et reprenez le contrôle.", "Geen giswerk meer. Geen beslissingsmoeheid meer. Volg gewoon het plan en neem weer de controle."),
            @("Stratégies alimentaires anti-inflammatoires", "Ontstekingsremmende dieetstrategieën"),
            @("Découvrez comment réduire l'inflammation de votre foie tout en continuant à profiter des`r`n                        aliments que vous aimez.", "Ontdek hoe u ontstekingen in uw lever kunt verminderen terwijl u blijft genieten van het voedsel waar u van houdt."),
            @("Découvrez comment réduire l'inflammation de votre foie tout en continuant à profiter des aliments que vous aimez.", "Ontdek hoe u ontstekingen in uw lever kunt verminderen terwijl u blijft genieten van het voedsel waar u van houdt."),
            @("Listes de courses hebdomadaires", "Wekelijkse boodschappenlijstjes"),
            @("Conçues pour vous faire gagner du temps, de l'argent et éviter le stress au supermarché.", "Ontworpen om u tijd, geld en stress in de supermarkt te besparen."),
            @("Repas favorisant un bon poids corporel — sans régime draconien", "Maaltijden die een gezond lichaamsgewicht ondersteunen — zonder crashdiëten"),
            @("Créés pour encourager une perte de poids progressive et durable, pas des extrêmes à court terme.", "Gemaakt om geleidelijk en duurzaam gewichtsverlies aan te moedigen, geen korte-termijn extremen."),
            @("Conseils et motivation pour créer de bonnes habits", "Tips en motivatie om goede gewoonten te creëren"),
            @("Pour que cela devienne un changement de mode de vie — pas juste un autre livre qui prend la`r`n                        poussière.", "Zodat het een verandering van levensstijl wordt — niet zomaar een boek dat stof ligt te verzamelen."),
            @("Pour que cela devienne un changement de mode de vie — pas juste un autre livre qui prend la poussière.", "Zodat het een verandering van levensstijl wordt — niet zomaar een boek dat stof ligt te verzamelen."),
            @("Si vous vous sentez :", "Als u zich zo voelt:"),
            @("anxieux concernant la santé de votre foie", "bezorgd over de gezondheid van uw lever"),
            @("frustré par les conseils contradictoires", "gefrustreerd door tegenstrijdige adviezen"),
            @("dépassé à chaque fois qu'il faut cuisiner", "overweldigd telkens wanneer u moet koken"),
            @("ou inquiet que les choses empirent si vous n'agissez pas", "of bezorgd dat het erger wordt als u geen actie onderneemt"),
            @("Ce pack a été créé <strong>pour vous</strong>.", "Dit pakket is <strong>voor u</strong> gemaakt."),
            @("Vous n'avez pas besoin d'être parfait(e).", "U hoeft niet perfect te zijn."),
            @("Vous n'avez pas besoin d'extrêmes.", "U heeft geen extremen nodig."),
            @("Vous avez juste besoin d'un <strong>plan clair et adapté</strong> qui s'intègre à la vraie vie.", "U heeft gewoon een <strong>duidelijk en passend plan</strong> nodig dat past in het echte leven."),
            @("Pour un temps limité, vous pouvez obtenir le <strong>pack complet de 3 livres à 70 % de`r`n                            réduction</strong> — moins`r`n                        que le prix d'un repas à emporter, mais quelque chose qui peut vraiment changer comment vous`r`n                        vous sentez <em>tous`r`n                            les jours</em>. Téléchargement numérique direct et instantané (Après le paiement, vous aurez`r`n                        immédiatement l'option de télécharger votre commande sur la page finale et vous recevrez`r`n                        un e-mail de téléchargement peu de temps après).", "Voor een beperkte tijd kunt u het <strong>complete pakket van 3 boeken krijgen met 70% korting</strong> — minder dan de prijs van een afhaalmaaltijd, maar iets dat echt kan veranderen hoe u zich <em>elke dag</em> voelt. Directe en onmiddellijke digitale download (Na betaling heeft u direct de optie om uw bestelling te downloaden op de eindpagina en kort daarna ontvangt u een download-e-mail)."),
            @("Pourquoi attendre ?", "Waarom wachten?"),
            @("Prenez le contrôle de la santé de votre foie dès aujourd'hui calmement, avec`r`n                            confiance, et sans`r`n                            renoncer</strong> <strong>au plaisir de manger.", "Neem vandaag nog de controle over de gezondheid van uw lever — rustig, met vertrouwen en zonder het plezier in eten op te geven."),
            @("Prenez le contrôle de la santé de votre foie dès aujourd'hui calmement, avec confiance, et sans renoncer</strong> <strong>au plaisir de manger.", "Neem vandaag nog de controle over de gezondheid van uw lever — rustig, met vertrouwen en zonder het plezier in eten op te geven."),
            @("Parce qu'il ne s'agit pas de restrictions.", "Omdat het niet om beperkingen gaat."),
            @("Il s'agit d'avoir enfin un plan qui a du sens.", "Het gaat erom eindelijk een plan te hebben dat logisch is."),
            @("Commandez maintenant </strong>et économisez 70 % avant que cette`r`n                                    offre limitée`r`n                                    ne disparaisse.", "Bestel nu </strong>en bespaar 70% voordat deze beperkte aanbieding verdwijnt."),
            @("Commandez maintenant </strong>et économisez 70 % avant que cette offre limitée ne disparaisse.", "Bestel nu </strong>en bespaar 70% voordat deze beperkte aanbieding verdwijnt."),
            @("Voici Ce Que`r`n                            Les Gens Disent De Nous", "Dit is wat mensen over ons zeggen")
        )
    }
    "sueco" = @{
        lang = "sv"
        suffix = "SV"
        title = "FoieGras – Atlas Library"
        countdown_label = "SISTA TIMMARNA - 70% RABATT AVSLUTAS SNART"
        hours_label = "timmar"
        minutes_label = "min"
        seconds_label = "sek"
        
        replacements = @(
            @("Retenez-vous`r`n                            votre respiration à chaque fois que votre médecin parle de votre foie... mais n'avez`r`n                            toujours aucune idée de ce que vous êtes censé manger ?", "Håller du andan varje gång din läkare pratar om din lever... men har fortfarande ingen aning om vad du ska äta?"),
            @("Retenez-vous votre respiration à chaque fois que votre médecin parle de votre foie... mais n'avez toujours aucune idée de ce que vous êtes censé manger ?", "Håller du andan varje gång din läkare pratar om din lever... men har fortfarande ingen aning om vad du ska äta?"),
            @("Vous n'êtes pas le seul.", "Du är inte den enda."),
            @("Et vous ne faites rien de mal.", "Och du gör inget fel."),
            @("La plupart des gens diagnostiqués avec un foie`r`n                    gras s'entendent dire :`r`n                    « Perdez du poids. Mangez plus sainement. »", "De flesta som diagnostiseras med fettlever får höra: «Gå ner i vikt. Ät hälsosammare.»"),
            @("La plupart des gens diagnostiqués avec un foie gras s'entendent dire : « Perdez du poids. Mangez plus sainement. »", "De flesta som diagnostiseras med fettlever får höra: «Gå ner i vikt. Ät hälsosammare.»"),
            @("Ensuite, ils sont renvoyés chez eux sans véritable`r`n                    plan. Aucun`r`n                    exemple de repas. Aucune structure étape par étape.", "Sedan skickas de hem utan någon egentlig plan. Inga måltidsexempel. Ingen steg-för-steg-struktur."),
            @("Ensuite, ils sont renvoyés chez eux sans véritable plan. Aucun exemple de repas. Aucune structure étape par étape.", "Sedan skickas de hem utan någon egentlig plan. Inga måltidsexempel. Ingen steg-för-steg-struktur."),
            @("Le Livre de Recettes Complet pour le Foie`r`n                                                Gras pour`r`n                                                Débutants + 2`r`n                                                BONUS", "Den Kompletta Kokboken för Fettlever för Nybörjare + 2 BONUSAR"),
            @("Le Livre de Recettes Complet pour le Foie Gras pour Débutants + 2 BONUS", "Den Kompletta Kokboken för Fettlever för Nybörjare + 2 BONUSAR"),
            @("Le Livre de Recettes Complet pour le Foie Gras pour`r`n                                            Débutants + 2 BONUS", "Den Kompletta Kokboken för Fettlever för Nybörjare + 2 BONUSAR"),
            @("Vous Économisez 70%", "Du sparar 70%"),
            @("ACHETER`r`n                                MAINTENANT", "KÖP NU"),
            @("ACHETER MAINTENANT", "KÖP NU"),
            @("ACHETEZ-EN 1, OBTENEZ-EN`r`n                            3", "KÖP 1, FÅ 3"),
            @("ACHETEZ-EN 1, OBTENEZ-EN 3", "KÖP 1, FÅ 3"),
            @("Pour un temps limité, voici ce que vous obtiendrez`r`n                    :", "Under en begränsad tid får du följande:"),
            @("Pour un temps limité, voici ce que vous obtiendrez :", "Under en begränsad tid får du följande:"),
            @("Pourquoi cette offre semble-t-elle`r`n                                trop belle`r`n                                pour être vraie ?", "Varför verkar det här erbjudandet för bra för att vara sant?"),
            @("Pourquoi cette offre semble-t-elle trop belle pour être vraie ?", "Varför verkar det här erbjudandet för bra för att vara sant?"),
            @("Nous comprenons - trois livres à succès`r`n                        pour`r`n                        le prix d'un n'est pas quelque chose que vous voyez tous les jours.", "Vi förstår – tre bästsäljande böcker till priset av en är inget man ser varje dag."),
            @("Nous comprenons - three livres à succès pour le prix d'un n'est pas quelque chose que vous voyez tous les jours.", "Vi förstår – tre bästsäljande böcker till priset av en är inget man ser varje dag."),
            @("Voici la simple vérité : une fois par an, vers`r`n                    cette`r`n                    saison, nous organisons un événement spécial pour remercier nos lecteurs et rendre nos collections`r`n                    les plus populaires`r`n                    plus accessibles.", "Här är den enkla sanningen: en gång om året, runt den här tiden, anordnar vi ett speciellt evenement för att tacka våra läsare och göra våra mest populära samlingar mer tillgängliga."),
            @("Voici la simple vérité : une fois par an, vers cette saison, nous organisons un événement spécial pour remercier nos lecteurs et rendre nos collections les plus populaires plus accessibles.", "Här är den enkla sanningen: en gång om året, runt den här tiden, anordnar vi ett speciellt evenement för att tacka våra läsare och göra våra mest populära samlingar mer tillgängliga."),
            @("Parce que nous gérons tout directement — de`r`n                    l'impression à l'expédition — nous pouvons éviter les marges de vente au détail et proposer`r`n                    l'ensemble (normalement 59,70 €)`r`n                    pour seulement 19,90 €.", "Eftersom vi sköter allt direkt – från tryck till frakt – kan vi undvika detaljhandelsmarginaler och erbjuda hela paketet (normalt 59,70 €) för endast 19,90 €."),
            @("Parce que nous gérons tout directement — de l'impression à l'expédition — nous pouvons éviter les marges de vente au détail et proposer l'ensemble (normalement 59,70 €) pour seulement 19,90 €.", "Eftersom vi sköter allt direkt – från tryck till frakt – kan vi undvika detaljhandelsmarginaler och erbjuda hela paketet (normalt 59,70 €) för endast 19,90 €."),
            @("À la fin de l'événement, les prix`r`n                        redeviennent`r`n                        normaux.", "Efter evenemangets slut återgår priserna till det normala."),
            @("À la fin de l'événement, les prix redeviennent normaux.", "Efter evenemangets slut återgår priserna till det normala."),
            @("Le foie gras s'améliore`r`n                            quand…", "Fettlever förbättras när..."),
            @("Le foie gras s'améliore quand…", "Fettlever förbättras när..."),
            @("…l'inflammation diminue et la sensibilité à l'insuline`r`n                        s'améliore.", "...inflammationen minskar och insulinkänsligheten förbättras."),
            @("…l'inflammation diminue et la sensibilité à l'insuline s'améliore.", "...inflammationen minskar och insulinkänsligheten förbättras."),
            @("Cela`r`n                    se produit grâce à des repas équilibrés, satisfaisants et validés — pas par des`r`n                    restrictions ou des`r`n                    punitions.", "Detta sker genom balanserade, tillfredsställande och beprövade måltider – inte genom restriktioner eller straff."),
            @("Cela se produit grâce à des repas équilibrés, satisfaisants et validés — pas par des restrictions ou des punitions.", "Detta sker genom balanserade, tillfredsställande och beprövade måltider – inte genom restriktioner eller straff."),
            @("C'est pourquoi Le Pack Complet du Livre de Recettes pour le Foie Gras pour`r`n                        Débutants a été créé.", "Det är därför Det Kompletta Paketet med Kokboken för Fettlever för Nybörjare skapades."),
            @("C'est pourquoi Le Pack Complet du Livre de Recettes pour le Foie Gras pour Débutants a été créé.", "Det är därför Det Kompletta Paketet med Kokboken för Fettlever för Nybörjare skapades."),
            @("Au lieu d'un livre écrasant, vous obtenez trois guides soigneusement conçus qui fonctionnent`r`n                    ensemble pour vous`r`n                    donner :", "Istället för en överväldigande bok får du tre noggrant utformade guider som samverkar för att ge dig:"),
            @("Au lieu d'un livre écrasant, vous obtenez trois guides soigneusement conçus qui fonctionnent ensemble pour vous donner :", "Istället för en överväldigande bok får du tre noggrant utformade guider som samverkar för att ge dig:"),
            @("De la Clarté", "Klarhet"),
            @("De la Confiance", "Självförtroende"),
            @("Des repas que vous apprécierez vraiment", "Måltider som du verkligen kommer att uppskatta"),
            @("Pas d'extrêmes. Pas de tactiques intimidantes. Juste une voie pratique et réaliste pour`r`n                        avancer.", "Inga ytterligheter. Inga skrämseltaktiker. Bara en praktisk och realistisk väg framåt."),
            @("Pas d'extrêmes. Pas de tactiques intimidantes. Juste une voie pratique et réaliste pour avancer.", "Inga ytterligheter. Inga skrämseltaktiker. Bara en praktisk och realistisk väg framåt."),
            @("Ce Qui Se Trouve Déans Ce Pack de 3 Livres Bestseller", "Vad som ingår i detta paket med 3 bästsäljande böcker"),
            @("Le Livre de Recettes Complet du Régime pour le Foie Gras (Édition 2026) comprend`r`n                            :", "Den Kompletta Kokboken för Fettlever (Utgåva 2026) innehåller:"),
            @("Le Livre de Recettes Complet du Régime pour le Foie Gras (Édition 2026) comprend :", "Den Kompletta Kokboken för Fettlever (Utgåva 2026) innehåller:"),
            @("Un guide nutritionnel sur le foie gras adapté aux débutants", "En näringsguide för fettlever anpassad för nybörjare"),
            @("Des explications claires sur ce qui aide votre foie — et ce qui joue contre lui en silence —`r`n                        sans`r`n                        jargon médical déroutant.", "Tydliga förklaringar om vad som hjälper din lever – och vad som tyst motverkar den – utan förvirrande medicinsk jargong."),
            @("Des explications claires sur ce qui aide votre foie — et ce qui joue contre lui en silence — sans jargon médical déroutant.", "Tydliga förklaringar om vad som hjälper din lever – och vad som tyst motverkar den – utan förvirrande medicinsk jargong."),
            @("+ de 100 recettes savoureuses et respectueuses de votre foie", "Mer än 100 välsmakande och levervänliga recept"),
            @("De vrais repas avec de vrais ingrédients. D'inspiration méditerranéenne, rassasiants et`r`n                        approuvés par toute la famille.", "Riktiga måltider med riktiga ingredienser. Medelhavsinspirerade, mättande och godkända av hela familjen."),
            @("De vrais repas avec de vrais ingrédients. D'inspiration méditerranéenne, rassasiants et approuvés par toute la famille.", "Riktiga måltider med riktiga ingredienser. Medelhavsinspirerade, mättande och godkända av hela familjen."),
            @("Un plan de repas structuré sur 28 jours", "Ett strukturerat 28-dagars måltidsschema"),
            @("Plus de devinettes. Plus de fatigue décisionnelle. Suivez simplement le plan et reprenez le`r`n                        contrôle.", "Inga fler gissningar. Ingen mer beslutsångest. Följ bara schemat och ta tillbaka kontrollen."),
            @("Plus de devinettes. Plus de fatigue décisionnelle. Suivez simplement le plan et reprenez le contrôle.", "Inga fler gissningar. Ingen mer beslutsångest. Följ bara schemat och ta tillbaka kontrollen."),
            @("Stratégies alimentaires anti-inflammatoires", "Antiinflammatoriska koststrategier"),
            @("Découvrez comment réduire l'inflammation de votre foie tout en continuant à profiter des`r`n                        aliments que vous aimez.", "Lär dig hur du minskar inflammationen i din lever samtidigt som du fortsätter att njuta av maten du älskar."),
            @("Découvrez comment réduire l'inflammation de votre foie tout en continuant à profiter des aliments que vous aimez.", "Lär dig hur du minskar inflammationen i din lever samtidigt som du fortsätter att njuta av maten du älskar."),
            @("Listes de courses hebdomadaires", "Veckovisa inköpslistor"),
            @("Conçues pour vous faire gagner du temps, de l'argent et éviter le stress au supermarché.", "Utformade för att spara tid, pengar och undvika stress i mataffären."),
            @("Repas favorisant un bon poids corporel — sans régime draconien", "Måltider som främjar en hälsosam kroppsvikt – utan svältdieter"),
            @("Créés pour encourager une perte de poids progressive et durable, pas des extrêmes à court terme.", "Skapade för att uppmuntra en gradvis och hållbar viktnedgång, inte kortvariga ytterligheter."),
            @("Conseils et motivation pour créer de bonnes habits", "Tips och motivation för att skapa goda vanor"),
            @("Pour que cela devienne un changement de mode de vie — pas juste un autre livre qui prend la`r`n                        poussière.", "Så att det blir en livsstilsförändring – inte bara ännu en bok som samlar damm."),
            @("Pour que cela devienne un changement de mode de vie — pas juste un autre livre qui prend la poussière.", "Så att det blir en livsstilsförändring – inte bara ännu en bok som samlar damm."),
            @("Si vous vous sentez :", "Om du känner dig:"),
            @("anxieux concernant la santé de votre foie", "orolig för din leverhälsa"),
            @("frustré par les conseils contradictoires", "frustrerad över motsägelsefulla råd"),
            @("dépassé à chaque fois qu'il faut cuisiner", "överväldigad varje gång det är dags att laga mat"),
            @("ou inquiet que les choses empirent si vous n'agissez pas", "eller orolig för att det ska bli värre om du inte agerar"),
            @("Ce pack a été créé <strong>pour vous</strong>.", "Detta paket skapades <strong>för dig</strong>."),
            @("Vous n'avez pas besoin d'être parfait(e).", "Du behöver inte vara perfekt."),
            @("Vous n'avez pas besoin d'extrêmes.", "Du behöver inga ytterligheter."),
            @("Vous avez juste besoin d'un <strong>plan clair et adapté</strong> qui s'intègre à la vraie vie.", "Du behöver bara en <strong>tydlig och anpassad plan</strong> som fungerar i det verkliga livet."),
            @("Pour un temps limité, vous pouvez obtenir le <strong>pack complet de 3 livres à 70 % de`r`n                            réduction</strong> — moins`r`n                        que le prix d'un repas à emporter, mais quelque chose qui peut vraiment changer comment vous`r`n                        vous sentez <em>tous`r`n                            les jours</em>. Téléchargement numérique direct et instantané (Après le paiement, vous aurez`r`n                        immédiatement l'option de télécharger votre commande sur la page finale et vous recevrez`r`n                        un e-mail de téléchargement peu de temps après).", "Under en begränsad tid kan du få <strong>hela paketet med 3 böcker till 70 % rabatt</strong> – mindre än priset för en hämtmat, men något som verkligen kan förändra hur du mår <em>varje dag</em>. Direkt och omedelbar digital nedladdning (Efter betalning har du omedelbart möjlighet att ladda ner din beställning på sista sidan, och du kommer att få ett e-postmeddelande med nedladdningslänk kort därefter)."),
            @("Pourquoi attendre ?", "Varför vänta?"),
            @("Prenez le contrôle de la santé de votre foie dès aujourd'hui calmement, avec`r`n                            confiance, et sans`r`n                            renoncer</strong> <strong>au plaisir de manger.", "Ta kontroll över din leverhälsa idag – lugnt, med tillförsikt och utan att ge upp glädjen i att äta."),
            @("Prenez le contrôle de la santé de votre foie dès aujourd'hui calmement, avec confiance, et sans renoncer</strong> <strong>au plaisir de manger.", "Ta kontroll över din leverhälsa idag – lugnt, med tillförsikt och utan att ge upp glädjen i att äta."),
            @("Parce qu'il ne s'agit pas de restrictions.", "Eftersom det inte handlar om restriktioner."),
            @("Il s'agit d'avoir enfin un plan qui a du sens.", "Det handlar om att äntligen ha en plan som är vettig."),
            @("Commandez maintenant </strong>et économisez 70 % avant que cette`r`n                                    offre limitée`r`n                                    ne disparaisse.", "Beställ nu </strong>och spara 70% innan detta tidsbegränsade erbjudande försvinner."),
            @("Commandez maintenant </strong>et économisez 70 % avant que cette offre limitée ne disparaisse.", "Beställ nu </strong>och spara 70% innan detta tidsbegränsade erbjudande försvinner."),
            @("Voici Ce Que`r`n                            Les Gens Disent De Nous", "Här är vad folk säger om oss")
        )
    }
    "dinamarques" = @{
        lang = "da"
        suffix = "DA"
        title = "FoieGras – Atlas Library"
        countdown_label = "SIDSTE TIMER - 70% RABAT SLUTTER SNART"
        hours_label = "timer"
        minutes_label = "min"
        seconds_label = "sek"
        
        replacements = @(
            @("Retenez-vous`r`n                            votre respiration à chaque fois que votre médecin parle de votre foie... mais n'avez`r`n                            toujours aucune idée de ce que vous êtes censé manger ?", "Holder du vejret hver gang din læge taler om din lever... men har stadig ingen idé om, hvad du skal spise?"),
            @("Retenez-vous votre respiration à chaque fois que votre médecin parle de votre foie... mais n'avez toujours aucune idée de ce que vous êtes censé manger ?", "Holder du vejret hver gang din læge taler om din lever... men har stadig ingen idé om, hvad du skal spise?"),
            @("Vous n'êtes pas le seul.", "Du er ikke den eneste."),
            @("Et vous ne faites rien de mal.", "Og du gør ikke noget forkert."),
            @("La plupart des gens diagnostiqués avec un foie`r`n                    gras s'entendent dire :`r`n                    « Perdez du poids. Mangez plus sainement. »", "De fleste mennesker diagnosticeret med en fedtlever får at vide: «Tab dig. Spis sundere.»"),
            @("La plupart des gens diagnostiqués avec un foie gras s'entendent dire : « Perdez du poids. Mangez plus sainement. »", "De fleste mennesker diagnosticeret med en fedtlever får at vide: «Tab dig. Spis sundere.»"),
            @("Ensuite, ils sont renvoyés chez eux sans véritable`r`n                    plan. Aucun`r`n                    exemple de repas. Aucune structure étape par étape.", "Derefter sendes de hjem uden en reel plan. Ingen måltidseksempler. Ingen trin-for-trin struktur."),
            @("Ensuite, ils sont renvoyés chez eux sans véritable plan. Aucun exemple de repas. Aucune structure étape par étape.", "Derefter sendes de hjem uden en reel plan. Ingen måltidseksempler. Ingen trin-for-trin struktur."),
            @("Le Livre de Recettes Complet pour le Foie`r`n                                                Gras pour`r`n                                                Débutants + 2`r`n                                                BONUS", "Den Komplette Kogebog til Fedtlever for Begyndere + 2 BONUSSER"),
            @("Le Livre de Recettes Complet pour le Foie Gras pour Débutants + 2 BONUS", "Den Komplette Kogebog til Fedtlever for Begyndere + 2 BONUSSER"),
            @("Le Livre de Recettes Complet pour le Foie Gras pour`r`n                                            Débutants + 2 BONUS", "Den Komplette Kogebog til Fedtlever for Begyndere + 2 BONUSSER"),
            @("Vous Économisez 70%", "Du sparer 70%"),
            @("ACHETER`r`n                                MAINTENANT", "KØB NU"),
            @("ACHETER MAINTENANT", "KØB NU"),
            @("ACHETEZ-EN 1, OBTENEZ-EN`r`n                            3", "KØB 1, FÅ 3"),
            @("ACHETEZ-EN 1, OBTENEZ-EN 3", "KØB 1, FÅ 3"),
            @("Pour un temps limité, voici ce que vous obtiendrez`r`n                    :", "I en begrænset periode får du følgende:"),
            @("Pour un temps limité, voici ce que vous obtiendrez :", "I en begrænset periode får du følgende:"),
            @("Pourquoi cette offre semble-t-elle`r`n                                trop belle`r`n                                pour être vraie ?", "Hvorfor lyder dette tilbud for godt til at være sandt?"),
            @("Pourquoi cette offre semble-t-elle trop belle pour être vraie ?", "Hvorfor lyder dette tilbud for godt til at være sandt?"),
            @("Nous comprenons - trois livres à succès`r`n                        pour`r`n                        le prix d'un n'est pas quelque chose que vous voyez tous les jours.", "Vi forstår det godt - tre bestsellerbøger til én bogs pris er ikke noget, man ser hver dag."),
            @("Nous comprenons - three livres à succès pour le prix d'un n'est pas quelque chose que vous voyez tous les jours.", "Vi forstår det godt - tre bestsellerbøger til én bogs pris er ikke noget, man ser hver dag."),
            @("Voici la simple vérité : une fois par an, vers`r`n                    cette`r`n                    saison, nous organisons un événement spécial pour remercier nos lecteurs et rendre nos collections`r`n                    les plus populaires`r`n                    plus accessibles.", "Her er den enkle sandhed: En gang om året, omkring denne tid, afholder vi en særlig begivenhed for at takke vores læsere og gøre vores mest populære samlinger mere tilgængelige."),
            @("Voici la simple vérité : une fois par an, vers cette saison, nous organisons un événement spécial pour remercier nos lecteurs et rendre nos collections les plus populaires plus accessibles.", "Her er den enkle sandhed: En gang om året, omkring denne tid, afholder vi en særlig begivenhed for at takke vores læsere og gøre vores mest populære samlinger mere tilgængelige."),
            @("Parce que nous gérons tout directement — de`r`n                    l'impression à l'expédition — nous pouvons éviter les marges de vente au détail et proposer`r`n                    l'ensemble (normalement 59,70 €)`r`n                    pour seulement 19,90 €.", "Da vi administrerer alt direkte - fra trykning til forsendelse - kan vi undgå detailavancer og tilbyde hele sættet (normalt 59,70 €) for kun 19,90 €."),
            @("Parce que nous gérons tout directement — de l'impression à l'expédition — nous pouvons éviter les marges de vente au détail et proposer l'ensemble (normalement 59,70 €) pour seulement 19,90 €.", "Da vi administrerer alt direkte - fra trykning til forsendelse - kan vi undgå detailavancer og tilbyde hele sættet (normalt 59,70 €) for kun 19,90 €."),
            @("À la fin de l'événement, les prix`r`n                        redeviennent`r`n                        normaux.", "Når begivenheden slutter, vender priserne tilbage til det normale."),
            @("À la fin de l'événement, les prix redeviennent normaux.", "Når begivenheden slutter, vender priserne tilbage til det normale."),
            @("Le foie gras s'améliore`r`n                            quand…", "Fedtlever forbedres når..."),
            @("Le foie gras s'améliore quand…", "Fedtlever forbedres når..."),
            @("…l'inflammation diminue et la sensibilité à l'insuline`r`n                        s'améliore.", "...inflammationen mindskes og insulinfølsomheden forbedres."),
            @("…l'inflammation diminue et la sensibilité à l'insuline s'améliore.", "...inflammationen mindskes og insulinfølsomheden forbedres."),
            @("Cela`r`n                    se produit grâce à des repas équilibrés, satisfaisants et validés — pas par des`r`n                    restrictions ou des`r`n                    punitions.", "Dette sker gennem afbalancerede, tilfredsstillende og godkendte måltider – ikke ved restriktioner eller straf."),
            @("Cela se produit grâce à des repas équilibrés, satisfaisants et validés — pas par des restrictions ou des punitions.", "Dette sker gennem afbalancerede, tilfredsstillende og godkendte måltider – ikke ved restriktioner eller straf."),
            @("C'est pourquoi Le Pack Complet du Livre de Recettes pour le Foie Gras pour`r`n                        Débutants a été créé.", "Det er derfor Den Komplette Pakke Kogebog til Fedtlever for Begyndere blev skabt."),
            @("C'est pourquoi Le Pack Complet du Livre de Recettes pour le Foie Gras pour Débutants a été créé.", "Det er derfor Den Komplette Pakke Kogebog til Fedtlever for Begyndere blev skabt."),
            @("Au lieu d'un livre écrasant, vous obtenez trois guides soigneusement conçus qui fonctionnent`r`n                    ensemble pour vous`r`n                    donner :", "I stedet for én overvældende bog får du tre omhyggeligt designede guider, der arbejder sammen for at give dig:"),
            @("Au lieu d'un livre écrasant, vous obtenez trois guides soigneusement conçus qui fonctionnent ensemble pour vous donner :", "I stedet for én overvældende bog får du tre omhyggeligt designede guider, der arbejder sammen for at give dig:"),
            @("De la Clarté", "Klarhed"),
            @("De la Confiance", "Tillid"),
            @("Des repas que vous apprécierez vraiment", "Måltider, som du virkelig vil nyde"),
            @("Pas d'extrêmes. Pas de tactiques intimidantes. Juste une voie pratique et réaliste pour`r`n                        avancer.", "Ingen ekstremer. Ingen skræmmetaktik. Bare en praktisk og realistisk vej fremad."),
            @("Pas d'extrêmes. Pas de tactiques intimidantes. Juste une voie pratique et réaliste pour avancer.", "Ingen ekstremer. Ingen skræmmetaktik. Bare en praktisk og realistisk vej fremad."),
            @("Ce Qui Se Trouve Déans Ce Pack de 3 Livres Bestseller", "Hvad der er i denne pakke med 3 bestsellerboeger"),
            @("Le Livre de Recettes Complet du Régime pour le Foie Gras (Édition 2026) comprend`r`n                            :", "Den Komplette Kogebog til Fedtleverdiæt (2026-udgave) indeholder:"),
            @("Le Livre de Recettes Complet du Régime pour le Foie Gras (Édition 2026) comprend :", "Den Komplette Kogebog til Fedtleverdiæt (2026-udgave) indeholder:"),
            @("Un guide nutritionnel sur le foie gras adapté aux débutants", "En ernæringsguide til fedtlever for begyndere"),
            @("Des explications claires sur ce qui aide votre foie — et ce qui joue contre lui en silence —`r`n                        sans`r`n                        jargon médical déroutant.", "Klare forklaringer på, hvad der hjælper din lever - og hvad der lydløst modarbejder den - uden forvirrende medicinsk jargon."),
            @("Des explications claires sur ce qui aide votre foie — et ce qui joue contre lui en silence — sans jargon médical déroutant.", "Klare forklaringer på, hvad der hjælper din lever - og hvad der lydløst modarbejder den - uden forvirrende medicinsk jargon."),
            @("+ de 100 recettes savoureuses et respectueuses de votre foie", "Over 100 velsmagende og levervenlige opskrifter"),
            @("De vrais repas avec de vrais ingrédients. D'inspiration méditerranéenne, rassasiants et`r`n                        approuvés par toute la famille.", "Reelle måltider med rigtige ingredienser. Middelhavsinspireret, mættende og godkendt af hele familien."),
            @("De vrais repas avec de vrais ingrédients. D'inspiration méditerranéenne, rassasiants et approuvés par toute la famille.", "Reelle måltider med rigtige ingredienser. Middelhavsinspireret, mættende og godkendt af hele familien."),
            @("Un plan de repas structuré sur 28 jours", "En struktureret 28-dages måltidsplan"),
            @("Plus de devinettes. Plus de fatigue décisionnelle. Suivez simplement le plan et reprenez le`r`n                        contrôle.", "Ikke mere gætteri. Ikke mere beslutningstræthed. Følg blot planen og tag kontrollen tilbage."),
            @("Plus de devinettes. Plus de fatigue décisionnelle. Suivez simplement le plan et reprenez le contrôle.", "Ikke mere gætteri. Ikke mere beslutningstræthed. Følg blot planen og tag kontrollen tilbage."),
            @("Stratégies alimentaires anti-inflammatoires", "Antiinflammatoriske koststrategier"),
            @("Découvrez comment réduire l'inflammation de votre foie tout en continuant à profiter des`r`n                        aliments que vous aimez.", "Find ud af, hvordan du reducerer inflammation i din lever, mens du fortsætter med at nyde den mad, du elsker."),
            @("Découvrez comment réduire l'inflammation de votre foie tout en continuant à profiter des aliments que vous aimez.", "Find ud af, hvordan du reducerer inflammation i din lever, mens du fortsætter med at nyde den mad, du elsker."),
            @("Listes de courses hebdomadaires", "Ugentlige indkøbslister"),
            @("Conçues pour vous faire gagner du temps, de l'argent et éviter le stress au supermarché.", "Designet til at spare dig tid, penge og undgå stress i supermarkedet."),
            @("Repas favorisant un bon poids corporel — sans régime draconien", "Måltider, der understøtter en sund kropsvægt - uden crashdiæter"),
            @("Créés pour encourager une perte de poids progressive et durable, pas des extrêmes à court terme.", "Skabt til at fremme et gradvist og bæredygtigt vægttab, ikke kortsigtede ekstremer."),
            @("Conseils et motivation pour créer de bonnes habits", "Tips og motivation til at skabe gode vaner"),
            @("Pour que cela devienne un changement de mode de vie — pas juste un autre livre qui prend la`r`n                        poussière.", "Så det bliver en livsstilsændring - ikke bare endnu en bog, der samler støv."),
            @("Pour que cela devienne un changement de mode de vie — pas juste un autre livre qui prend la poussière.", "Så det bliver en livsstilsændring - ikke bare endnu en bog, der samler støv."),
            @("Si vous vous sentez :", "Hvis du føler dig:"),
            @("anxieux concernant la santé de votre foie", "bekymret over din levers sundhed"),
            @("frustré par les conseils contradictoires", "frustreret over modstridende råd"),
            @("dépassé à chaque fois qu'il faut cuisiner", "overvældet hver gang der skal laves mad"),
            @("ou inquiet que les choses empirent si vous n'agissez pas", "eller bekymret for, at det bliver værre, hvis du ikke gør noget"),
            @("Ce pack a été créé <strong>pour vous</strong>.", "Denne pakke blev skabt <strong>til dig</strong>."),
            @("Vous n'avez pas besoin d'être parfait(e).", "Du behøver ikke at være perfekt."),
            @("Vous n'avez pas besoin d'extrêmes.", "Du har ikke brug for ekstremer."),
            @("Vous avez juste besoin d'un <strong>plan clair et adapté</strong> qui s'intègre à la vraie vie.", "Du har bare brug for en <strong>klar og passende plan</strong>, der passer ind i det virkelige liv."),
            @("Pour un temps limité, vous pouvez obtenir le <strong>pack complet de 3 livres à 70 % de`r`n                            réduction</strong> — moins`r`n                        que le prix d'un repas à emporter, mais quelque chose qui peut vraiment changer comment vous`r`n                        vous sentez <em>tous`r`n                            les jours</em>. Téléchargement numérique direct et instantané (Après le paiement, vous aurez`r`n                        immédiatement l'option de télécharger votre commande sur la page finale et vous recevrez`r`n                        un e-mail de téléchargement peu de temps après).", "I en begrænset periode kan du få <strong>den komplette pakke med 3 bøger med 70% rabat</strong> – mindre end prisen på en take-away, men noget, der virkelig kan ændre, hvordan du har det <em>hver dag</em>. Direkte og øjeblikkelig digital download (Efter betaling vil du straks have mulighed for at downloade din ordre på slutsiden, og du vil modtage en download-e-mail kort efter)."),
            @("Pourquoi attendre ?", "Hvorfor vente?"),
            @("Prenez le contrôle de la santé de votre foie dès aujourd'hui calmement, avec`r`n                            confiance, et sans`r`n                            renoncer</strong> <strong>au plaisir de manger.", "Tag kontrollen over din levers sundhed i dag - roligt, med tillid og uden at give afkald på glæden ved at spise."),
            @("Prenez le contrôle de la santé de votre foie dès aujourd'hui calmement, avec confiance, et sans renoncer</strong> <strong>au plaisir de manger.", "Tag kontrollen over din levers sundhed i dag - roligt, med tillid og uden at give afkald på glæden ved at spise."),
            @("Parce qu'il ne s'agit pas de restrictions.", "Fordi det ikke handler om restriktioner."),
            @("Il s'agit d'avoir enfin un plan qui a du sens.", "Det handler om endelig at have en plan, der giver mening."),
            @("Commandez maintenant </strong>et économisez 70 % avant que cette`r`n                                    offre limitée`r`n                                    ne disparaisse.", "Bestil nu </strong>og spar 70% før dette tidsbegrænsede tilbud forsvinder."),
            @("Commandez maintenant </strong>et économisez 70 % avant que cette offre limitée ne disparaisse.", "Bestil nu </strong>og spar 70% før dette tidsbegrænsede tilbud forsvinder."),
            @("Voici Ce Que`r`n                            Les Gens Disent De Nous", "Her er hvad folk siger om os")
        )
    }
    "noruegues" = @{
        lang = "no"
        suffix = "NO"
        title = "FoieGras – Atlas Library"
        countdown_label = "SISTE TIMER - 70% RABATT ENDER SNART"
        hours_label = "timer"
        minutes_label = "min"
        seconds_label = "sek"
        
        replacements = @(
            @("Retenez-vous`r`n                            votre respiration à chaque fois que votre médecin parle de votre foie... mais n'avez`r`n                            toujours aucune idée de ce que vous êtes censé manger ?", "Holder du pusten hver gang legen din snakker om leveren din... men har fortsatt ingen aning om hva du skal spise?"),
            @("Retenez-vous votre respiration à chaque fois que votre médecin parle de votre foie... mais n'avez toujours aucune idée de ce que vous êtes censé manger ?", "Holder du pusten hver gang legen din snakker om leveren din... men har fortsatt ingen aning om hva du skal spise?"),
            @("Vous n'êtes pas le seul.", "Du er ikke den eneste."),
            @("Et vous ne faites rien de mal.", "Og du gjør ingenting galt."),
            @("La plupart des gens diagnostiqués avec un foie`r`n                    gras s'entendent dire :`r`n                    « Perdez du poids. Mangez plus sainement. »", "De fleste som diagnostiseras med fettlever får høre: «Gå ned i vekt. Spis sunnere.»"),
            @("La plupart des gens diagnostiqués avec un foie gras s'entendent dire : « Perdez du poids. Mangez plus sainement. »", "De fleste som diagnostiseras med fettlever får høre: «Gå ned i vekt. Spis sunnere.»"),
            @("Ensuite, ils sont renvoyés chez eux sans véritable`r`n                    plan. Aucun`r`n                    exemple de repas. Aucune structure étape par étape.", "Deretter blir de sendt hjem uten noen reell plan. Ingen måltidseksempler. Ingen trinn-for-trinn struktur."),
            @("Ensuite, ils sont renvoyés chez eux sans véritable plan. Aucun exemple de repas. Aucune structure étape par étape.", "Deretter blir de sendt hjem uten noen reell plan. Ingen måltidseksempler. Ingen trinn-for-trinn struktur."),
            @("Le Livre de Recettes Complet pour le Foie`r`n                                                Gras pour`r`n                                                Débutants + 2`r`n                                                BONUS", "Den Komplette Kokeboken for Fettlever for Begynnere + 2 BONUSER"),
            @("Le Livre de Recettes Complet pour le Foie Gras pour Débutants + 2 BONUS", "Den Komplette Kokeboken for Fettlever for Begynnere + 2 BONUSER"),
            @("Le Livre de Recettes Complet pour le Foie Gras pour`r`n                                            Débutants + 2 BONUS", "Den Komplette Kokeboken for Fettlever for Begynnere + 2 BONUSER"),
            @("Vous Économisez 70%", "Du sparer 70%"),
            @("ACHETER`r`n                                MAINTENANT", "KJØP NÅ"),
            @("ACHETER MAINTENANT", "KJØP NÅ"),
            @("ACHETEZ-EN 1, OBTENEZ-EN`r`n                            3", "KJØP 1, FÅ 3"),
            @("ACHETEZ-EN 1, OBTENEZ-EN 3", "KJØP 1, FÅ 3"),
            @("Pour un temps limité, voici ce que vous obtiendrez`r`n                    :", "I en begrenset periode er dette hva du får:"),
            @("Pour un temps limité, voici ce que vous obtiendrez :", "I en begrenset periode er dette hva du får:"),
            @("Pourquoi cette offre semble-t-elle`r`n                                trop belle`r`n                                pour être vraie ?", "Hvorfor virker dette tilbudet for godt til å være sant?"),
            @("Pourquoi cette offre semble-t-elle trop belle pour être vraie ?", "Hvorfor virker dette tilbudet for godt til å være sant?"),
            @("Nous comprenons - trois livres à succès`r`n                        pour`r`n                        le prix d'un n'est pas quelque chose que vous voyez tous les jours.", "Vi forstår – tre bestselgende bøker til prisen av én er ikke noe du ser hver dag."),
            @("Nous comprenons - three livres à succès pour le prix d'un n'est pas quelque chose que vous voyez tous les jours.", "Vi forstår – tre bestselgende bøker til prisen av én er ikke noe du ser hver dag."),
            @("Voici la simple vérité : une fois par an, vers`r`n                    cette`r`n                    saison, nous organisons un événement spécial pour remercier nos lecteurs et rendre nos collections`r`n                    les plus populaires`r`n                    plus accessibles.", "Her er den enkle sannheten: Én gang i året, rundt denne sesongen, arrangerer vi et spesielt arrangement for å takke leserne våre og gjøre våre mest populære samlinger mer tilgjengelige."),
            @("Voici la simple vérité : une fois par an, vers cette saison, nous organisons un événement spécial pour remercier nos lecteurs et rendre nos collections les plus populaires plus accessibles.", "Her er den enkle sannheten: Én gang i året, rundt denne sesongen, arrangerer vi et spesielt arrangement for å takke leserne våre og gjøre våre mest populære samlinger mer tilgjengelige."),
            @("Parce que nous gérons tout directement — de`r`n                    l'impression à l'expédition — nous pouvons éviter les marges de vente au détail et proposer`r`n                    l'ensemble (normalement 59,70 €)`r`n                    pour seulement 19,90 €.", "Fordi vi administrerer alt direkte – fra trykking til frakt – kan vi unngå forhandlermarginer og tilby hele pakken (normalt 59,70 €) for bare 19,90 €."),
            @("Parce que nous gérons tout directement — de l'impression à l'expédition — nous pouvons éviter les marges de vente au détail et proposer l'ensemble (normalement 59,70 €) pour seulement 19,90 €.", "Fordi vi administrerer alt direkte – fra trykking til frakt – kan vi unngå forhandlermarginer og tilby hele pakken (normalt 59,70 €) for bare 19,90 €."),
            @("À la fin de l'événement, les prix`r`n                        redeviennent`r`n                        normaux.", "Etter at arrangementet er over, vil prisene gå tilbake til det normale."),
            @("À la fin de l'événement, les prix redeviennent normaux.", "Etter at arrangementet er over, vil prisene gå tilbake til det normale."),
            @("Le foie gras s'améliore`r`n                            quand…", "Fettlever forbedres når..."),
            @("Le foie gras s'améliore quand…", "Fettlever forbedres når..."),
            @("…l'inflammation diminue et la sensibilité à l'insuline`r`n                        s'améliore.", "...betennelsen avtar og insulinfølsomheten forbedres."),
            @("…l'inflammation diminue et la sensibilité à l'insuline s'améliore.", "...betennelsen avtar og insulinfølsomheten forbedres."),
            @("Cela`r`n                    se produit grâce à des repas équilibrés, satisfaisants et validés — pas par des`r`n                    restrictions ou des`r`n                    punitions.", "Dette skjer gjennom balanserte, tilfredsstillende og godkjente måltider – ikke ved restriksjoner eller straff."),
            @("Cela se produit grâce à des repas équilibrés, satisfaisants et validés — pas par des restrictions ou des punitions.", "Dette skjer conveyor gjennom balanserte, tilfredsstillende og godkjente måltider – ikke ved restriksjoner eller straff."),
            @("C'est pourquoi Le Pack Complet du Livre de Recettes pour le Foie Gras pour`r`n                        Débutants a été créé.", "Det er derfor Den Komplette Pakken med Kokeboken for Fettlever for Begynnere ble skapt."),
            @("C'est pourquoi Le Pack Complet du Livre de Recettes pour le Foie Gras pour Débutants a été créé.", "Det er derfor Den Komplette Pakken med Kokeboken for Fettlever for Begynnere ble skapt."),
            @("Au lieu d'un livre écrasant, vous obtenez trois guides soigneusement conçus qui fonctionnent`r`n                    ensemble pour vous`r`n                    donner :", "I stedet for en overveldende bok får du tre nøye utformede guider som fungerer sammen for å gi deg:"),
            @("Au lieu d'un livre écrasant, vous obtenez trois guides soigneusement conçus qui fonctionnent ensemble pour vous donner :", "I stedet for en overveldende bok får du tre nøye utformede guider som fungerer sammen for å gi deg:"),
            @("De la Clarté", "Klarhet"),
            @("De la Confiance", "Selvtillit"),
            @("Des repas que vous apprécierez vraiment", "Måltider som du virkelig vil like"),
            @("Pas d'extrêmes. Pas de tactiques intimidantes. Juste une voie pratique et réaliste pour`r`n                        avancer.", "Ingen ekstreme dietter. Ingen skremselstaktikk. Bare en praktisk og realistisk vei fremover."),
            @("Pas d'extrêmes. Pas de tactiques intimidantes. Juste une voie pratique et réaliste pour avancer.", "Ingen ekstreme dietter. Ingen skremselstaktikk. Bare en praktisk og realistisk vei fremover."),
            @("Ce Qui Se Trouve Déans Ce Pack de 3 Livres Bestseller", "Hva som finnes i denne pakken med 3 bestselgende boeker"),
            @("Le Livre de Recettes Complet du Régime pour le Foie Gras (Édition 2026) comprend`r`n                            :", "Den Komplette Kokeboken for Fettleverdiett (2026-utgave) inneholder:"),
            @("Le Livre de Recettes Complet du Régime pour le Foie Gras (Édition 2026) comprend :", "Den Komplette Kokeboken for Fettleverdiett (2026-utgave) inneholder:"),
            @("Un guide nutritionnel sur le foie gras adapté aux débutants", "En ernæringsguide for fettlever tilpasset nybegynnere"),
            @("Des explications claires sur ce qui aide votre foie — et ce qui joue contre lui en silence —`r`n                        sans`r`n                        jargon médical déroutant.", "Tydelige forklaringer på hva som hjelper leveren din – og hva som jobber mot den i det stille – uten confusing medisinsk fagspråk."),
            @("Des explications claires sur ce qui aide votre foie — et ce qui joue contre lui en silence — sans jargon médical déroutant.", "Tydelige forklainer på hva som hjelper leveren din – og hva som jobber mot den i det stille – uten forvirrende medisinsk fagspråk."),
            @("+ de 100 recettes savoureuses et respectueuses de votre foie", "Over 100 velsmakende og levervennlige oppskrifter"),
            @("De vrais repas avec de vrais ingrédients. D'inspiration méditerranéenne, rassasiants et`r`n                        approuvés par toute la famille.", "Ekte måltider med ekte ingredienser. Middelhavsinspirert, mettende og godkjent av hele familien."),
            @("De vrais repas avec de vrais ingrédients. D'inspiration méditerranéenne, rassasiants et approuvés par toute la famille.", "Ekte måltider med ekte ingredienser. Middelhavsinspirert, mettende og godkjent av hele familien."),
            @("Un plan de repas structuré sur 28 jours", "En strukturert 28-dagers måltidsplan"),
            @("Plus de devinettes. Plus de fatigue décisionnelle. Suivez simplement le plan et reprenez le`r`n                        contrôle.", "Ingen mer gjetting. Ingen mer beslutningstretthet. Følg planen og ta kontrollen tilbake."),
            @("Plus de devinettes. Plus de fatigue décisionnelle. Suivez simplement le plan et reprenez le contrôle.", "Ingen mer gjetting. Ingen mer beslutningstretthet. Følg planen og ta kontrollen tilbake."),
            @("Stratégies alimentaires anti-inflammatoires", "Betennelsesdempende kostholdsstrategier"),
            @("Découvrez comment réduire l'inflammation de votre foie tout en continuant à profiter des`r`n                        aliments que vous aimez.", "Finn ut hvordan du reduserer betennelse i leveren din samtidig som du fortsetter å nyde maten du elsker."),
            @("Découvrez comment réduire l'inflammation de votre foie tout en continuant à profiter des aliments que vous aimez.", "Finn ut hvordan du reduserer betennelse i leveren din samtidig som du fortsetter å nyte maten du elsker."),
            @("Listes de courses hebdomadaires", "Ukentlige handlelister"),
            @("Conçues pour vous faire gagner du temps, de l'argent et éviter le stress au supermarché.", "Designet for å spare deg for tid, penger og unngå stress i butikken."),
            @("Repas favorisant un bon poids corporel — sans régime draconien", "Måltider som fremmer en sunn kroppsvekt – uten ekstremdietter"),
            @("Créés pour encourager une perte de poids progressive et durable, pas des extrêmes à court terme.", "Laget for å oppmuntre til gradvis og bærekraftig vekttap, ikke kortsiktige ekstreme løsninger."),
            @("Conseils et motivation pour créer de bonnes habits", "Tips og motivasjon til å skape gode vaner"),
            @("Pour que cela devienne un changement de mode de vie — pas juste un autre livre qui prend la`r`n                        poussière.", "Slik at det blir en livsstilsendring – ikke bare en ny bok som samler støv."),
            @("Pour que cela devienne un changement de mode de vie — pas juste un autre livre qui prend la poussière.", "Slik at det blir en livsstilsendring – ikke bare en ny bok som samler støv."),
            @("Si vous vous sentez :", "Hvis du føler deg:"),
            @("anxieux concernant la santé de votre foie", "bekymret for leverhelsen din"),
            @("frustré par les conseils contradictoires", "frustrert over motstridende råd"),
            @("dépassé à chaque fois qu'il faut cuisiner", "overveldet hver gang du skal lage mat"),
            @("ou inquiet que les choses empirent si vous n'agissez pas", "eller bekymret for at ting vil bli verre hvis du ikke gjør noe"),
            @("Ce pack a été créé <strong>pour vous</strong>.", "Denne pakken ble laget <strong>for deg</strong>."),
            @("Vous n'avez pas besoin d'être parfait(e).", "Du trenger ikke å være perfekt."),
            @("Vous n'avez pas besoin d'extrêmes.", "Du trenger ikke ekstreme dietter."),
            @("Vous avez juste besoin d'un <strong>plan clair et adapté</strong> qui s'intègre à la vraie vie.", "Du trenger bare en <strong>tydelig og tilpasset plan</strong> som fungerer i hverdagen."),
            @("Pour un temps limité, vous pouvez obtenir le <strong>pack complet de 3 livres à 70 % de`r`n                            réduction</strong> — moins`r`n                        que le prix d'un repas à emporter, mais quelque chose qui peut vraiment changer comment vous`r`n                        vous sentez <em>tous`r`n                            les jours</em>. Téléchargement numérique direct et instantané (Après le paiement, vous aurez`r`n                        immédiatement l'option de télécharger votre commande sur la page finale et vous recevrez`r`n                        un e-mail de téléchargement peu de temps après).", "I en begrenset periode kan du få <strong>hele pakken med 3 bøker med 70 % rabatt</strong> – mindre enn prisen på en take-away, men noe som virkelig kan endre hvordan du føler deg <em>hver dag</em>. Direkte og umiddelbar digital nedlasting (Etter betaling vil du umiddelbart få muligheten til å laste ned bestillingen din på bekreftelsessiden, og du vil motta en e-post med nedlastingslenke kort tid etter)."),
            @("Pourquoi attendre ?", "Hvorfor vente?"),
            @("Prenez le contrôle de la santé de votre foie dès aujourd'hui calmement, avec`r`n                            confiance, et sans`r`n                            renoncer</strong> <strong>au plaisir de manger.", "Ta kontroll over leverhelsen din i dag – rolig, med selvtillit og uten å gi opp glädjen ved å spise."),
            @("Prenez le contrôle de la santé de votre foie dès aujourd'hui calmement, avec confiance, et sans renoncer</strong> <strong>au plaisir de manger.", "Ta kontroll over leverhelsen din i dag – rolig, med selvtillit og uten å gi opp glæden ved å spise."),
            @("Parce qu'il ne s'agit pas de restrictions.", "Fordi det handler ikke om restriksjoner."),
            @("Il s'agit d'avoir enfin un plan qui a du sens.", "Det handler om å endelig ha en plan som gir mening."),
            @("Commandez maintenant </strong>et économisez 70 % avant que cette`r`n                                    offre limitée`r`n                                    ne disparaisse.", "Bestill nå </strong>og spar 70 % før dette tidsbegrensede tilbudet forsvinner."),
            @("Commandez maintenant </strong>et économisez 70 % avant que cette offre limitée ne disparaisse.", "Bestill nå </strong>og spar 70 % før dette tidsbegrensede tilbudet forsvinner."),
            @("Voici Ce Que`r`n                            Les Gens Disent De Nous", "Her er hva folk sier om oss")
        )
    }
}

foreach ($lang_key in $translations.Keys) {
    $info = $translations[$lang_key]
    $dest_dir = "gorduranofigado${lang_key}shopify"
    
    if (-not (Test-Path $dest_dir)) {
        New-Item -Path $dest_dir -ItemType Directory | Out-Null
    }
    
    $html = $fr_html
    
    # Replace basic headers and language tags
    $html = $html.Replace('lang="fr"', 'lang="' + $info.lang + '"')
    
    # Replace countdown sticky and labels
    $html = $html.Replace("DERNIERES HEURES - 70% DE REDUCTION SE TERMINE BIENTOT", $info.countdown_label)
    $html = $html.Replace("heures", $info.hours_label)
    $html = $html.Replace("min", $info.minutes_label)
    $html = $html.Replace("sec", $info.seconds_label)
    
    # Replace variant ID references with a placeholder
    $html = [System.Text.RegularExpressions.Regex]::Replace($html, "/fr/cart/43049184428109:1", "/" + $info.lang + "/cart/TODO_VARIANT_ID:1")
    
    # Replace image suffixes
    $html = $html.Replace("_FR.png", "_" + $info.suffix + ".png")
    
    # Perform translation replacements
    foreach ($rep in $info.replacements) {
        $from = $rep[0]
        $to = $rep[1]
        $html = $html.Replace($from, $to)
    }
    
    $dest_file = Join-Path $dest_dir "index.html"
    [System.IO.File]::WriteAllText($dest_file, $html, [System.Text.Encoding]::UTF8)
    Write-Host "Generated page for $lang_key"
}

