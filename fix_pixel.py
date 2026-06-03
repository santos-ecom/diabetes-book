import re

new_block = """<!-- Meta Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');

// PIXELS
fbq('init', '1073542434958133');

// EVENTO
fbq('track', 'PageView');
</script>

<noscript>
<img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=1073542434958133&ev=PageView&noscript=1"/>
</noscript>
<!-- End Meta Pixel Code -->"""

files = [
    'airfryeralemao/index.html',
    'airfryerfrances/index.html',
    'airfryerportugues/index.html',
    'diabetes/index.html',
    'diabetesepanhol/index.html',
    'diabetesfrances/index.html',
    'diabetespaginanova/index.html',
    'diabetesteste.html',
    'diabetestestehtml/index.html',
]

pattern = re.compile(r'<!-- Meta Pixel Code -->.*?<!-- End Meta Pixel Code -->', re.DOTALL)

for f in files:
    content = open(f, encoding='utf-8').read()
    if '<!-- Meta Pixel Code -->' not in content:
        print('SEM META PIXEL: ' + f)
        continue
    new_content = pattern.sub(new_block, content)
    open(f, 'w', encoding='utf-8').write(new_content)
    print('OK: ' + f)

print('Feito!')
