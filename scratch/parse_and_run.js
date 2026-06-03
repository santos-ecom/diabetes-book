const fs = require('fs');
const path = require('path');

function parsePs1Translations(filePath) {
    const content = fs.readFileSync(filePath, 'utf8');
    const languages = ["polones", "holandes", "sueco", "dinamarques", "noruegues"];
    const translations = {};
    
    for (const lang of languages) {
        const pattern = new RegExp(`"${lang}"\\s*=\\s*@\\{([\\s\\S]*?)\\n\\s*\\}`);
        const match = content.match(pattern);
        if (!match) {
            console.log(`Could not find translation block for ${lang}`);
            continue;
        }
        
        const block = match[1];
        
        const getValue = (key) => {
            const m = block.match(new RegExp(`${key}\\s*=\\s*"([^"]*)"`));
            return m ? m[1] : "";
        };
        
        const langCode = getValue("lang");
        const suffix = getValue("suffix");
        const title = getValue("title");
        const countdownLabel = getValue("countdown_label");
        const hoursLabel = getValue("hours_label");
        const minutesLabel = getValue("minutes_label");
        const secondsLabel = getValue("seconds_label");
        
        const replacements = [];
        const repBlockMatch = block.match(/replacements\s*=\s*@\(([\s\S]*?)\)/);
        if (repBlockMatch) {
            const repBlock = repBlockMatch[1];
            // Match @("from", "to") pairs
            // The match needs to be careful of double quotes. We can split by @( and parse or use regex.
            const pairRegex = /@\("([\s\S]*?)",\s*"([\s\S]*?)"\)(?=\r?\n|,|$)/g;
            let pairMatch;
            while ((pairMatch = pairRegex.exec(repBlock)) !== null) {
                let fromStr = pairMatch[1].replace(/`r/g, '\r').replace(/`n/g, '\n');
                let toStr = pairMatch[2].replace(/`r/g, '\r').replace(/`n/g, '\n');
                replacements.push([fromStr, toStr]);
            }
        }
        
        translations[lang] = {
            lang: langCode,
            suffix: suffix,
            title: title,
            countdown_label: countdownLabel,
            hours_label: hoursLabel,
            minutes_label: minutesLabel,
            seconds_label: secondsLabel,
            replacements: replacements
        };
    }
    
    return translations;
}

function main() {
    const templatePath = 'gorduranofigadofrancesshopify/index.html';
    if (!fs.existsSync(templatePath)) {
        console.log(`Template path ${templatePath} not found.`);
        return;
    }
    
    const frHtml = fs.readFileSync(templatePath, 'utf8');
    const translations = parsePs1Translations('scratch/generate_gordura.ps1');
    
    for (const [langKey, info] of Object.entries(translations)) {
        const destDir = `gorduranofigado${langKey}shopify`;
        if (!fs.existsSync(destDir)) {
            fs.mkdirSync(destDir, { recursive: true });
        }
        
        let html = frHtml;
        
        // Replace basic headers and language tags
        html = html.replace('lang="fr"', `lang="${info.lang}"`);
        
        // Replace countdown sticky and labels
        html = html.replace("DERNIERES HEURES - 70% DE REDUCTION SE TERMINE BIENTOT", info.countdown_label);
        html = html.replace("heures", info.hours_label);
        html = html.replace("min", info.minutes_label);
        html = html.replace("sec", info.seconds_label);
        
        // Replace variant ID references with a placeholder
        html = html.replace(/\/fr\/cart\/43049184428109:1/g, `/${info.lang}/cart/TODO_VARIANT_ID:1`);
        
        // Replace image suffixes
        html = html.replace(/_FR\.png/g, `_${info.suffix}.png`);
        html = html.replace(/_FR\.jpg/g, `_${info.suffix}.jpg`);
        
        // Perform translation replacements
        for (const [fromStr, toStr] of info.replacements) {
            html = html.replace(fromStr, toStr);
        }
        
        const destFile = path.join(destDir, "index.html");
        fs.writeFileSync(destFile, html, 'utf8');
        console.log(`Generated page for ${langKey}`);
    }
}

main();
