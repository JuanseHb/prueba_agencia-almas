# SEO Técnico – Soluciones

Este documento contiene las soluciones desarrolladas para la sección de SEO Técnico de la prueba Desarrollador Full Stack MarkTech Junior.

---

# 10. Análisis y corrección del archivo robots.txt

## Errores identificados

1. La instrucción `Disallow: /` bloquea por completo el rastreo del sitio y evita que cualquier motor de búsqueda indexe el contenido.
2. El archivo contenía reglas contradictorias, permitiendo algunas rutas después de haber bloqueado todo el sitio.
3. Existían dos declaraciones de sitemap, una de ellas mal estructurada.
4. El orden del archivo no era coherente, lo que podía generar interpretaciones ambiguas para los motores de búsqueda.

## robots.txt corregido

```
User-agent: *
Disallow: /wp-admin/
Allow: /wp-admin/admin-ajax.php
Allow: /wp-content/uploads/

Sitemap: https://almasagencia.com/sitemapindex.xml
```

## Impacto en la indexación

El archivo original habría bloqueado la indexación completa del sitio, impidiendo que las páginas aparecieran en Google y generando pérdida total de visibilidad orgánica. La versión corregida permite un rastreo adecuado del sitio, limita únicamente el acceso al área administrativa y especifica la ubicación del sitemap, lo cual optimiza la indexación y el uso del crawl budget.

# 11. Corrección del HTML

## HTML original

```
<div> <h1>Seguros baratos en Bogotá</h3> <p><strong>Seguros baratos</strong> mejores precios <img src="seguro.png"></p> <h2>Comparar precios seguros Bogotá</h4> </div> ```
```
Problemas identificados

    Etiquetas de encabezado incorrectamente cerradas.
    Repetición innecesaria de palabras clave que puede interpretarse como keyword stuffing.
    La imagen no contiene un atributo alt, necesario para accesibilidad y SEO.
    Falta de estructura semántica clara.

## Versión corregida

```
<div>
  <h1>Seguros económicos en Bogotá</h1>

  <p>
    Encuentra precios competitivos en pólizas y seguros según tus necesidades.
  </p>
  
  <figure>
    <img src="seguro.png" alt="Seguro económico en Bogotá" loading="lazy">
  </figure>
  
  <h2>Comparar precios de seguros en Bogotá</h2>
</div>
```

### Justificación de cambios

La jerarquía de encabezados fue corregida para asegurar coherencia semántica. Se eliminó la repetición forzada de palabras clave para evitar sobreoptimización. Se añadió el atributo alt para mejorar accesibilidad y SEO en imágenes. El texto fue reescrito para mantener naturalidad y claridad sin comprometer la intención de búsqueda.


# 12. Data estructurada JSON-LD para mejorar la indexación

JSON-LD adecuado para un sitio corporativo como https://softland.com/co/

```
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "Softland Colombia",
  "url": "https://softland.com/co/",
  "logo": "https://softland.com/wp-content/uploads/2022/03/logo-softland.png",
  "description": "Software ERP, soluciones empresariales y servicios en la nube para pequeñas, medianas y grandes empresas en Colombia.",
  "sameAs": [
    "https://www.facebook.com/SoftlandLatam",
    "https://twitter.com/SoftlandLatam",
    "https://www.linkedin.com/company/softlandlatam/"
  ],
  "contactPoint": [{
    "@type": "ContactPoint",
    "telephone": "+57 601 1234567",
    "contactType": "customer service",
    "availableLanguage": ["es"],
    "areaServed": "CO"
  }]
}
</script>

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "url": "https://softland.com/co/",
  "potentialAction": {
    "@type": "SearchAction",
    "target": "https://softland.com/co/?s={search_term_string}",
    "query-input": "required name=search_term_string"
  }
}
</script>
```

## Justificación 

El uso de Organization y WebSite permite mejorar la comprensión de la entidad por parte de Google, mientras que SearchAction facilita la aparición del cuadro de búsqueda del sitio directamente en los resultados de Google, lo cual mejora la experiencia del usuario y la visibilidad.

La información incluida es suficiente y apropiada para un sitio corporativo. Agregar datos no mostrados directamente en la página podría causar inconsistencias o rechazo del schema por parte de Google. Este enfoque balancea visibilidad, precisión y cumplimiento de buenas prácticas en SEO técnico.
