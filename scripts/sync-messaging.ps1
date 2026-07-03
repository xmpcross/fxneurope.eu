# Sync non-EN locales to AI ecommerce framework messaging (v1 static export patch)
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent

$locales = @{
  de = @{
    tagline = 'KI-E-Commerce-Frameworks für jede Plattform.'
    description = 'FXN Europe entwickelt KI-gestützte E-Commerce-Frameworks, die mehrere Produktquellen verbinden, Katalogprozesse automatisieren und Storefronts plattformübergreifend bereitstellen — mit Basis in Tallinn, Estland.'
    oldTagline = 'Wir bauen Europas nächste Generation digitaler Handelsmarken.'
    oldDescription = 'FXN Europe baut, betreibt und skaliert Online-Handels-, Lifestyle- und Reiseunternehmungen auf dem europäischen Markt — von einem Standort in Tallinn, Estland.'
    heroH1Old = '"children":["Wir bauen Europas nächste Generation ",["$","span",null,{"className":"text-brand-300","children":"digitaler Handelsmarken"}],"."]'
    heroH1New = '"children":["KI-E-Commerce-",["$","span",null,{"className":"text-brand-300","children":"Frameworks"}]," für jede Plattform."]'
    badgeOld = 'Tallinn, Estland · Europäische digitale Unternehmungen'
    badgeNew = 'Tallinn, Estland · KI-E-Commerce-Infrastruktur'
    aboutH1Old = 'Ein europäisches Unternehmen, das digitale Marken aufbaut und betreibt.'
    aboutH1New = 'Ein europäisches Unternehmen, das KI-gestützte E-Commerce-Infrastruktur entwickelt.'
  }
  es = @{
    tagline = 'Frameworks de comercio electrónico con IA para cada plataforma.'
    description = 'FXN Europe desarrolla frameworks de comercio electrónico impulsados por IA que conectan múltiples fuentes de productos, automatizan operaciones de catálogo y despliegan tiendas en todas las plataformas, desde su base en Tallin, Estonia.'
    oldTagline = 'Construyendo la próxima generación de marcas de comercio digital de Europa.'
    oldDescription = 'FXN Europe crea, opera y escala negocios de comercio minorista, estilo de vida y viajes en línea en todo el mercado europeo, desde su base en Tallin, Estonia.'
    heroH1Old = '"children":["Construyendo la próxima generación de marcas de ",["$","span",null,{"className":"text-brand-300","children":"comercio digital"}],"."]'
    heroH1New = '"children":["Frameworks de comercio electrónico con ",["$","span",null,{"className":"text-brand-300","children":"IA"}]," para cada plataforma."]'
    badgeOld = 'Tallin, Estonia · Iniciativas digitales europeas'
    badgeNew = 'Tallin, Estonia · Infraestructura de comercio electrónico con IA'
    aboutH1Old = 'Una empresa europea que crea y opera marcas digitales.'
    aboutH1New = 'Una empresa europea que desarrolla infraestructura de comercio electrónico con IA.'
  }
  et = @{
    tagline = 'Tehisintellektil põhinevad e-kaubanduse raamistikud igale platvormile.'
    description = 'FXN Europe arendab tehisintellektil põhinevaid e-kaubanduse raamistikke, mis ühendavad mitmeid tooteallikaid, automatiseerivad kataloogitoiminguid ja rakendavad poe-esindusi platvormideülenevalt — baasiga Tallinnas, Eestis.'
    oldTagline = 'Euroopa järgmise põlvkonna digitaalse kaubanduse brändide loomine.'
    oldDescription = 'FXN Europe loob, opereerib ja skaleerib veebipõhiseid jaekaubanduse, elustiili- ja reisiettevõtmisi kogu Euroopa turul — baasiga Tallinnas, Eestis.'
    heroH1Old = '"children":["Euroopa järgmise põlvkonna ",["$","span",null,{"className":"text-brand-300","children":"digitaalse kaubanduse"}]," brändide loomine."]'
    heroH1New = '"children":["Tehisintellektil põhinevad ",["$","span",null,{"className":"text-brand-300","children":"e-kaubanduse raamistikud"}]," igale platvormile."]'
    badgeOld = 'Tallinn, Eesti · Euroopa digitaalsed ettevõtmised'
    badgeNew = 'Tallinn, Eesti · Tehisintellektil põhinev e-kaubanduse taristu'
    aboutH1Old = 'Euroopa ettevõte, mis loob ja juhib digitaalseid brände.'
    aboutH1New = 'Euroopa ettevõte, mis arendab tehisintellektil põhinevat e-kaubanduse taristut.'
  }
  fr = @{
    tagline = 'Frameworks e-commerce IA pour chaque plateforme.'
    description = 'FXN Europe conçoit des frameworks e-commerce alimentés par l''IA qui connectent plusieurs sources de produits, automatisent les opérations catalogue et déploient des vitrines sur toutes les plateformes — depuis sa base à Tallinn, en Estonie.'
    oldTagline = 'Bâtir la nouvelle génération de marques de commerce numérique en Europe.'
    oldDescription = 'FXN Europe crée, exploite et développe des activités de vente en ligne, de lifestyle et de voyage sur le marché européen — depuis sa base à Tallinn, en Estonie.'
    heroH1Old = '"children":["Bâtir la nouvelle génération de marques de ",["$","span",null,{"className":"text-brand-300","children":"commerce numérique"}]," en Europe."]'
    heroH1New = '"children":["Frameworks e-commerce ",["$","span",null,{"className":"text-brand-300","children":"IA"}]," pour chaque plateforme."]'
    badgeOld = 'Tallinn, Estonie · Initiatives numériques européennes'
    badgeNew = 'Tallinn, Estonie · Infrastructure e-commerce IA'
    aboutH1Old = 'Une entreprise européenne qui crée et exploite des marques numériques.'
    aboutH1New = 'Une entreprise européenne qui développe une infrastructure e-commerce alimentée par l''IA.'
  }
}

$utf8 = New-Object System.Text.UTF8Encoding $false
$totalFiles = 0
$totalReplacements = 0

foreach ($lang in $locales.Keys) {
  $cfg = $locales[$lang]
  $dir = Join-Path $root $lang
  if (-not (Test-Path $dir)) { continue }

  $pairs = @(
    @{ Old = $cfg.oldTagline; New = $cfg.tagline },
    @{ Old = $cfg.oldDescription; New = $cfg.description },
    @{ Old = ('FXN Europe ' + [char]0x2014 + ' ' + $cfg.oldTagline); New = ('FXN Europe ' + [char]0x2014 + ' ' + $cfg.tagline) },
    @{ Old = $cfg.heroH1Old; New = $cfg.heroH1New },
    @{ Old = $cfg.badgeOld; New = $cfg.badgeNew },
    @{ Old = $cfg.aboutH1Old; New = $cfg.aboutH1New }
  )

  Get-ChildItem -Path $dir -Recurse -File | ForEach-Object {
    $content = [System.IO.File]::ReadAllText($_.FullName)
    $original = $content
    foreach ($pair in $pairs) {
      if ($content.Contains($pair.Old)) {
        $count = ([regex]::Matches($content, [regex]::Escape($pair.Old))).Count
        $content = $content.Replace($pair.Old, $pair.New)
        $totalReplacements += $count
      }
    }
    if ($content -ne $original) {
      [System.IO.File]::WriteAllText($_.FullName, $content, $utf8)
      $totalFiles++
    }
  }
}

Write-Output "Updated $totalFiles files with $totalReplacements replacements."
