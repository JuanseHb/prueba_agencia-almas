# Google tag manager – Soluciones

Este documento contiene todas las consultas utilizadas para responder la sección Google tag manager de la prueba Desarollador Full Stack Martech Junior.

---
## Pregunta 3

 Se trabajó con el código HTML suministrado y se configuraron las variables necesarias dentro del contenedor GTM para capturar información proveniente de elementos del DOM. Finalmente, se responden las preguntas teóricas incluidas en el ejercicio.


## 1. Configuración realizada en Google Tag Manager
3.1 Activación de variables de clic

Para permitir la creación de activadores y obtener información de los elementos clicados en la página, se activaron las variables integradas de clic en:

Variables > Configurar > Variables integradas


Se habilitaron las siguientes:

Click Element

Click Classes

Click ID

Click Target

Click URL

Click Text

## 2. Creación de Variables DOM


#### 2.1 Variable titulo_imagen

Tipo de variable:

Elemento DOM


Método de selección:

Selector de CSS


Selector del elemento:

#content_left img


Atributo capturado:

title


Descripción:
Captura automáticamente el texto contenido en el atributo title del elemento <img> ubicado dentro del contenedor #content_left.

<img width="1288" height="762" alt="imagen" src="https://github.com/user-attachments/assets/29093f68-4d8f-4a2e-9422-29273509d197" />

#### 2.2 Variable url_imagen

Tipo de variable:

Elemento DOM


Método de selección:

Selector de CSS


Selector del elemento:

#content_left img


Atributo capturado:

src


Descripción:
Obtiene la ruta (URL) del recurso de imagen contenida en la etiqueta <img> ubicada dentro de #content_left.

<img width="1340" height="746" alt="imagen" src="https://github.com/user-attachments/assets/35db416f-5df5-44a1-85a0-f48cc17cb01b" />


#### 2.3 Activador click_imagen_trigger

Ubicación en GTM:
Activadores > Nuevo

Configuración:

Tipo de activador:
Clic – Todos los elementos

Este activador se activa en:
Algunos clics

Condición:

Variable: Click Element

Operador: matches CSS selector

Valor:

#content_left img

Descripción:
El activador se dispara únicamente cuando el usuario hace clic sobre un elemento <img> dentro del contenedor #content_left. Esto permite que la etiqueta GA4 solo se ejecute cuando se interactúa con la imagen relevante del ejercicio.

<img width="1354" height="636" alt="imagen" src="https://github.com/user-attachments/assets/1c2add11-9868-4dd1-b85f-7fc772ee550c" />

#### 2.4. Etiqueta GA4 GA4 – click_imagen

Ubicación en GTM:
Etiquetas > Nuevo

Tipo de etiqueta:
Google Analytics: GA4 Event

Configuración principal:

Configuration tag / ID de medición:
G-FJ4232L0
(Id de flujo de datos proporcionado en el enunciado)

Event name (Nombre del evento):

click_imagen


Parámetros del evento:

Nombre del parámetro	Valor (variable de GTM)
titulo_imagen	{{titulo_imagen}}
url_imagen	{{url_imagen}}

Activación de la etiqueta:

Activadores asociados:
click_imagen_trigger

Descripción:
Cuando el usuario hace clic en la imagen del contenedor #content_left, el activador click_imagen_trigger se dispara y ejecuta la etiqueta GA4 – click_imagen. El evento enviado a GA4 se llama click_imagen e incluye como parámetros el título de la imagen (titulo_imagen) y su URL (url_imagen), capturados dinámicamente desde el DOM.

<img width="1419" height="908" alt="imagen" src="https://github.com/user-attachments/assets/ac99a203-154f-4fef-9d32-95f869133732" />

## Ejercicio 4
## ¿Para qué sirven los dataLayer en Tag Manager?

El dataLayer es una estructura basada en un arreglo de JavaScript que sirve como puente entre el sitio web y Google Tag Manager. Permite enviar información ordenada y estructurada hacia GTM para que este:

Active etiquetas en momentos específicos

Reciba datos personalizados del usuario

Proporcione valores que no están disponibles directamente en el DOM

Registre eventos personalizados (por ejemplo: compras, registros, clics)

Alimente configuraciones avanzadas de analítica, como e-commerce o conversiones

Ejemplo de dataLayer:

```
<script>
dataLayer.push({
    "event": "registro_exitoso",
    "usuario_id": "52431",
    "plan": "premium",
    "timestamp": "2025-11-29 10:45:00"
});
</script>
```

Este evento puede ser usado dentro de Google Tag Manager como activador, y los valores incluidos pueden utilizarse como variables en etiquetas avanzadas.

## Ejercicio 5
## ¿Qué tipo de tag se utilizaría para implementar los píxeles de Facebook y Google Ads?

Facebook Pixel:
Debe implementarse mediante una etiqueta de tipo:

HTML Personalizado

Meta proporciona un script que debe copiarse íntegramente dentro del tag de HTML personalizado dentro de GTM.

Google Ads (Conversiones o Remarketing):
Se utiliza una plantilla nativa de Google Tag Manager:

Etiqueta de Conversión de Google Ads

o

Etiqueta de Remarketing de Google Ads


Estas etiquetas permiten registrar conversiones, audiencias, clics y eventos relevantes dentro de la plataforma de Google Ads.
