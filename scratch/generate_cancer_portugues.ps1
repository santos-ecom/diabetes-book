# Read the template
$fr_html = Get-Content -Path 'cancerfrances/index.html' -Raw -Encoding UTF8

$dest_dir = "cancerportugues"

if (-not (Test-Path $dest_dir)) {
    New-Item -Path $dest_dir -ItemType Directory | Out-Null
}

$replacements = @(
    @("lang=`"fr`"", "lang=`"pt`""),
    @("Nutrition Anticancéreuse – Bibliothèque de la Vie et de l'Espoir", "Nutrição Anticancer – Biblioteca da Vida e da Esperança"),
    @("Fournissez à votre corps une abondance de nutriments essentiels pour le réparer, le régénérer, le détoxifier et le guérir. Parfait pour lutter contre le cancer et mener une vie saine pour toute la famille !", "Forneça ao seu corpo uma abundância de nutrientes essenciais para repará-lo, regenerá-lo, desintoxá-lo e curá-lo. Perfeito para combater o câncer e levar uma vida saudável para toda a família!"),
    @("Fournissez à votre corps une abondance de nutriments vitaux pour réparer, régénérer, détoxifier et guérir. Parfait pour lutter contre le cancer et poursuivre un mode de vie sain pour toute la famille !", "Forneça ao seu corpo uma abundância de nutrientes vitais para reparar, regenerar, desintoxicar e curar. Perfeito para combater o câncer e seguir um estilo de vida saudável para toda a família!"),
    @("La nourriture est un remède. Aucune expérience complexe n'est requise.", "A comida é um remédio. Nenhuma experiência complexa é necessária."),
    @("Vous voulez lutter contre le cancer, mais vous ne savez pas quoi manger ni par où commencer ?", "Você quer combater o câncer, mas não sabe o que comer nem por onde começar?"),
    @("Frustré par des recherches fastidieuses pour savoir quels aliments fonctionnent le mieux contre diverses maladies ?", "Frustrado por pesquisas cansativas para saber quais alimentos funcionam melhor contra várias doenças?"),
    @("Voici des recettes et des histoires soigneusement sélectionnées parmi trois ouvrages innovants pour vous aider à guérir et à protéger votre corps. Découvrez les aliments idéaux !", "Aqui estão receitas e histórias cuidadosamente selecionadas de três obras inovadoras para ajudar você a curar e proteger seu corpo. Descubra os alimentos ideais!"),
    @("Régime Anticancer : Comment mieux manger pour protéger le corps", "Dieta Anticancer: Como comer melhor para proteger o corpo"),
    @("Vous économisez 70%", "Você economiza 70%"),
    @("ACHETER MAINTENANT", "COMPRAR AGORA"),
    @("ACHETEZ-EN 1, RECEVEZ-EN 3", "COMPRE 1, LEVE 3"),
    @("Voici un aperçu des améliorations dans votre vie :", "Aqui está uma prévia das melhorias na sua vida:"),
    @("Pourquoi tout le contenu de ce matériel semble-t-il si vital et en même temps si accessible ?", "Por que todo o conteúdo deste material parece tão vital e ao mesmo tempo tão acessível?"),
    @("Nous comprenons – il est rare de trouver trois ouvrages mondiaux contre le cancer résumés dans un recueil approfondi.", "Nós entendemos – é raro encontrar três obras mundiais contra o câncer resumidas em um compêndio aprofundado."),
    @("Le principe est simple : cette compilation joue un rôle éducatif important, car elle rassemble des histoires vraies et des recherches approfondies. Nous voulons élargir votre accès dès maintenant.", "O princípio é simples: esta compilação desempenha um papel educativo importante, pois reúne histórias reais e pesquisas detalhadas. Queremos expandir seu acesso agora mesmo."),
    @("Comme nous ne sommes pas une organisation orientée vers les profits éditoriaux les plus élevés des livres physiques, nous avons réussi à réduire ce package entier à quelque chose de pratiquement symbolique.", "Como não somos uma organização voltada para os maiores lucros editoriais de livros físicos, conseguimos reduzir todo este pacote para algo praticamente simbólico."),
    @("Cependant, une fois la capacité dépassée, l'accès promotionnel sera gelé.", "No entanto, assim que o limite for ultrapassado, o acesso promocional será congelado."),
    @("Fortifiez-vous. Mangez bien. Guérissez.", "Fortaleça-se. Coma bem. Cure-se."),
    @("...grâce à des protocoles nutritionnels éprouvés qui protègent votre santé à long terme.", "...graças a protocolos nutricionais comprovados que protegem a sua saúde a longo prazo."),
    @("Cela se traduit par un programme bien structuré, qui explore toutes les rémissions et transformations émotionales ou alimentaires.", "Isso se traduz em um programa bem estruturado, que explora todas as remissões e transformações emocionais ou alimentares."),
    @("Cela se traduit par un programme bien structuré, qui explore toutes les rémissions et transformations émotionnelles ou alimentaires.", "Isso se traduz em um programa bem estruturado, que explora todas as remissões e transformações emocionais ou alimentares."),
    @("C'est pourquoi Le Guide Ultime de la Lutte contre le Cancer a été créé.", "Por isso foi criado o Guia Definitivo de Combate ao Câncer."),
    @("C'est pourquoi <strong>Le Guide Ultime de la Lutte contre le Cancer</strong> a été créé.", "Por isso o <strong>Guia Definitivo de Combate ao Câncer</strong> foi criado."),
    @("Au lieu d'être laissé(e) dans l'ignorance, ce contenu complet vous apportera les avantages suivants :", "Em vez de ficar no escuro, este conteúdo completo lhe trará os seguintes benefícios:"),
    @("Orientation et clarté absolues", "Orientação e clareza absolutas"),
    @("Confiance renouvelée", "Confiança renovada"),
    @("Nutrition pour votre âme", "Nutrição para sua alma"),
    @("Pas d'extrêmes. Pas d'alarmisme. Seulement un chemin pratique et réaliste dans la lutte pour la vie.", "Sem extremos. Sem alarmismo. Apenas um caminho prático e realista na luta pela vida."),
    @("Qu'y a-t-il exactement dans ce pack de 3 livres ?", "O que exatamente está neste pacote de 3 livros?"),
    @("Cet extraordinaire pack de 3 livres comprend :", "Este extraordinário pacote de 3 livros inclui:"),
    @("Livre 1 : Le régime anticancer de Sarah", "Livro 1: A dieta anticancer de Sarah"),
    @("Des recettes simples et riches en nutriments à base de plantes. Utilisez des fruits, des légumes et des herbes pour la réparation et la guérison dans la pratique.", "Receitas simples e ricas em nutrientes à base de plantas. Use frutas, vegetais e ervas para reparação e cura na prática."),
    @("Livre 2 : Libéré du cancer grâce à l'alimentation naturelle", "Livro 2: Livre do câncer graças à alimentação natural"),
    @("Les meilleurs aliments pour différents types de cancer, compilés à partir de recettes riches testées par l'expérience de Sarah Jerkins.", "Os melhores alimentos para diferentes tipos de câncer, compilados a partir de receitas ricas testadas pela experiência de Sarah Jerkins."),
    @("Livre 3 : Rémission radicale par Sarah Jerkins", "Livro 3: Remissão Radical por Sarah Jerkins"),
    @("La chercheuse Sarah Jerkins documente des histoires de guérison remarquables et présente les 9 changements alimentaires et émotionnels fondamentaux.", "A pesquisadora Sarah Jerkins documenta histórias de cura notáveis e apresenta as 9 mudanças dietéticas e emocionais fundamentais."),
    @("Stratégies pour différents types de cancer", "Estratégias para diferentes tipos de câncer"),
    @("Des plans adaptables pour vous aider à gérer spécifiquement le cancer, également adaptés aux régimes sans gluten, végétaliens et paléo.", "Planos adaptáveis para ajudar você a gerenciar especificamente o câncer, também adequados para dietas sem glúten, veganas e paleo."),
    @("Changements et facteurs de guérison supplémentaires", "Mudanças e fatores de cura adicionais"),
    @("Adopter les changements de vie, y compris le controle émotionnel des sentiments systémiques et un esprit clair.", "Adotar mudanças de vida, incluindo o controle emocional dos sentimentos sistêmicos e uma mente clara."),
    @("Adopter les changements de vie, y compris le contrôle émotionnel des sentiments systémiques et un esprit clair.", "Adotar mudanças de vida, incluindo o controle emocional dos sentimentos sistêmicos e uma mente clara."),
    @("Conseils abondants et histoires réelles", "Conselhos abundantes e histórias reais"),
    @("Des photos en couleur, des recettes du quotidien, des jus et des desserts qui nourrissent votre corps, accompagnés de preuves et de rémissions radicales.", "Fotos coloridas, receitas do dia a dia, sucos e sobremesas que nutrem seu corpo, acompanhados de evidências e remissões radicais."),
    @("Connexion esprit-corps pour l'avenir et les émotions", "Conexão mente-corpo para o futuro e as emoções"),
    @("Utilisez les recherches approfondies de Sarah Jerkins. Tout est prêt pour porter votre plan oncologique et spirituel à un niveau supérieur en toute simplicité.", "Use as pesquisas detalhadas de Sarah Jerkins. Tudo pronto para levar seu plano oncológico e espiritual a um nível superior com facilidade."),
    @("70% DE RÉDUCTION", "70% DE DESCONTO"),
    @("SE TERMINE AUJOURD'HUI", "TERMINA HOJE"),
    @("Si vous vous sentez comme ça ces derniers temps ou souvent :", "Se você tem se sentido assim ultimamente ou com frequência:"),
    @("anxiété ou désespoir face à votre santé aujourd'hui et à un diagnostic imprévisible", "ansiedade ou desespero com sua saúde hoje e um diagnóstico imprevisível"),
    @("fatigue après avoir lu des conseils médicaux extrêmement difficiles ou sans compassion", "cansaço após ler conselhos médicos extremamente difíceis ou sem compaixão"),
    @("la surcharge immense liée aux recherches constantes sur l'alimentation anticancer", "a sobrecarga imensa com pesquisas constantes sobre a dieta anticancer"),
    @("beaucoup de doutes quant à savoir si un faux pas ou un mauvais repas nuira à votre traitement", "muitas dúvidas se um passo em falso ou uma refeição errada prejudicará seu tratamento"),
    @("Cet ouvrage littéraire a été conçu exclusivement pour vous aider.", "Esta obra literária foi criada exclusivamente para ajudar você."),
    @("Cet ouvrage littéraire <strong>a été conçu exclusivement pour vous aider</strong>.", "Esta obra literária <strong>foi criada exclusivamente para ajudar você</strong>."),
    @("Ce n'est pas seulement un guide, c'est une nouvelle vision axée sur une santé pleine.", "Não é apenas um guia, é uma nova visão focada em uma saúde plena."),
    @("C'est la véritable évolution naturelle vers la guérison,", "É a verdadeira evolução natural para a cura,"),
    @("que votre esprit réclame – le plan dont vous pourriez avoir besoin ou que vous recherchez de toute urgence en ce moment, sans avoir à dépenser une fortune.", "que sua mente pede – o plano que você pode precisar ou estar procurando urgentemente agora, sem ter que gastar uma fortuna."),
    @("que votre esprit réclame – le plan <strong>dont vous pourriez avoir besoin ou que vous recherchez de toute urgence en ce moment,</strong> sans avoir à dépenser une fortune.", "que sua mente pede – o plano <strong>que você pode precisar ou estar procurando urgentemente agora,</strong> sem ter que gastar uma fortuna."),
    @("Pour une durée limitée, recevez ce magnifique pack de 3 guides avec une réduction massive — un investissement infiniment moindre que le prix d'un dîner au restaurant, capable de changer radicalement le cours de votre santé ! Pour la vie. Téléchargement numérique immédiat (Après le paiement, vous pouvez télécharger les produits et vous recevrez également l'accès par e-mail).", "Por tempo limitado, receba este maravilhoso pacote de 3 guias com um desconto enorme — um investimento infinitamente menor que o preço de um jantar em um restaurante, capaz de mudar drasticamente o rumo da sua saúde! Para a vida toda. Download digital imediato (Após o pagamento, você poderá baixar os produtos e também receberá o acesso por e-mail)."),
    @("Pour une durée limitée, recevez ce <strong>magnifique pack de 3 guides avec une réduction massive</strong> — un investissement infiniment moindre que le prix d'un dîner au restaurant, capable de changer radicalement le cours de votre santé ! <em>Pour la vie</em>. Téléchargement numérique immédiat (Après le paiement, vous pouvez télécharger les produits et vous recevrez également l'accès par e-mail).", "Por tempo limitado, receba este <strong>maravilhoso pacote de 3 guias com um desconto enorme</strong> — um investimento infinitamente menor que o preço de um jantar em um restaurante, capaz de mudar drasticamente o rumo da sua saúde! <em>Para a vida toda</em>. Download digital imediato (Após o pagamento, você poderá baixar os produtos e também receberá o acesso por e-mail)."),
    @("Qu'attendez-vous ?", "O que você está esperando?"),
    @("Ne renoncez plus jamais à espérer le meilleur en renforçant les défenses de votre corps, sans vous sentir durement réprimé par des restrictions qui n'aident pas.", "Nunca mais desista de esperar o melhor fortalecendo as defesas do seu corpo, sem se sentir duramente reprimido por restrições que não ajudam."),
    @("👉 <strong>Ne renoncez plus jamais à espérer le meilleur en renforçant les défenses de votre corps, sans</strong> <strong>vous sentir durement réprimé par des restrictions qui n'aident pas.</strong>", "👉 <strong>Nunca mais desista de esperar o melhor fortalecendo as defesas do seu corpo, sem</strong> <strong>se sentir duramente reprimido por restrições que não ajudam.</strong>"),
    @("Parce que vous n'avez pas besoin d'extrêmes alimentaires douloureux.", "Porque você não precisa de extremos alimentares dolorosos."),
    @("Cela signifie, enfin, avoir un plan pratique pour la santé et la vraie vie.", "Isso significa, finalmente, ter um plano prático para a saúde e para a vida real."),
    @("Passer ma commande et profitez de votre réduction spéciale avant la fin de l'offre.", "Fazer meu pedido e aproveitar seu desconto especial antes do fim da oferta."),
    @("<strong><strong><em><strong>Passer ma commande </strong>et profitez de votre réduction spéciale avant la fin de l'offre. </em></strong></strong>", "<strong><strong><em><strong>Fazer meu pedido </strong>e aproveitar seu desconto especial antes do fim da oferta. </em></strong></strong>"),
    @("Avis des lecteurs :", "Opinião dos leitores:"),
    @("Contact", "Contato"),
    @("Confidentialité", "Privacidade"),
    @("Retours & Remboursements", "Retornos & Reembolsos"),
    @("Conditions Générales", "Termos & Condições"),
    @("Bibliothèque", "Biblioteca"),
    @("€19.90", "19.90 €"),
    @("€59.70", "59.70 €"),
    @("€ 19.90", "19.90 €"),
    @("€ 59.70", "59.70 €"),
    @("Aller au contenu", "Ir para o conteúdo"),
    @("skipLink.innerText = 'Aller au contenu';", "skipLink.innerText = 'Ir para o conteúdo';"),
    @("⏰ DERNIÈRES HEURES - L'INSCRIPTION SE TERMINE DANS", "⏰ ÚLTIMAS HORAS - A INSCRIÇÃO TERMINA EM"),
    @("Désolé, ce produit n'est pas disponible. Veuillez choisir une autre combinaison.", "Desculpe, este produto não está disponível. Por favor, escolha outra combinação.")
)

# Helper function for whitespace-insensitive replacement
function Replace-Normalized($html, $from, $to) {
    $temp = [System.Text.RegularExpressions.Regex]::Replace($from, "\s+", "___WS___")
    $escaped = [System.Text.RegularExpressions.Regex]::Escape($temp)
    $pattern = $escaped.Replace("___WS___", "\s+")
    try {
        return [System.Text.RegularExpressions.Regex]::Replace($html, $pattern, $to)
    } catch {
        return $html.Replace($from, $to)
    }
}

$html = $fr_html

# Perform translations
foreach ($rep in $replacements) {
    $from = $rep[0]
    $to = $rep[1]
    $html = Replace-Normalized $html $from $to
}

# Write output
$dest_file = Join-Path $dest_dir "index.html"
[System.IO.File]::WriteAllText($dest_file, $html, [System.Text.Encoding]::UTF8)
Write-Host "Generated page cancerportugues successfully."
