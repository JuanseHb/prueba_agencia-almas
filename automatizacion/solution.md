# Conexiones y Automatización – Zapier + Brevo

## Objetivo
Integrar una fuente de datos externa (API pública), almacenar un contacto en un archivo Excel y automatizar el envío de correos en Brevo, utilizando Zapier como orquestador. Adicionalmente, aplicar lógica condicional según el dominio del correo electrónico.

## 1. Zapier – Integración con API y Excel

### 1.1. Trigger (premium) – Webhooks by Zapier

Se creó un Zap con el siguiente disparador:

- App: **Webhooks by Zapier** (trigger premium).
- Evento: **GET / Retrieve Poll** sobre la URL:
  `https://jsonplaceholder.typicode.com/users`.
- La respuesta devuelve un listado de usuarios con campos tales como `name`, `email`, `phone` y `website`.
- Para la prueba se seleccionó un usuario de la respuesta como “sample record”.

### 1.2. Acción – Guardar datos en Excel

Se configuró una acción de:

- App: **Microsoft Excel**
- Evento: **Add Row**

El archivo se creó en OneDrive con el nombre:

- `zapier_brevo_contactos.xlsx`

Dentro del archivo se definió una tabla con las columnas:

- `Nombre`
- `Email`
- `Telefono`
- `Website`

En Zapier se mapearon los campos:

- `Nombre`  ← `name` (API)
- `Email`   ← `email`
- `Telefono`← `phone`
- `Website` ← `website`

Al ejecutar el test del Zap, se añadió correctamente una fila al Excel con los datos del usuario seleccionado. Este archivo se compartió mediante un enlace de solo lectura, tal como lo solicita la prueba.

### 1.3. Acción – Crear/actualizar contacto en Brevo

Se añadió una segunda acción en el mismo Zap:

- App: **Brevo**
- Evento: **Create or Update Contact**

Campos mapeados:

- Email: `email` de la API
- First Name: `name`
- Phone: `phone`
- Atributo personalizado (opcional): `WEBSITE` = `website`
- Lista de destino: `Zapier Contacts`

Al ejecutar el test, el contacto se creó correctamente en la cuenta de Brevo y quedó asociado a la lista `Zapier Contacts`.

## 2. Brevo – Automatización de correos y etiquetado

### 2.1. Creación del workflow

En Brevo se creó un workflow llamado `Workflow – Zapier Onboarding` con el siguiente disparador:

- **Start when:** el contacto es añadido a la lista `Zapier Contacts`.

### 2.2. Etiquetado del contacto

Primer paso del workflow:

- Acción: **Add a tag**
- Tag aplicada: `zapier`

De esta manera, todos los contactos que llegan desde Zapier quedan identificados con la etiqueta `zapier`.

### 2.3. Envío de correos

Secuencia de acciones configurada:

1. **Correo inmediato**
   - Acción: **Send an email**
   - Plantilla: `Zapier – Bienvenida`
   - Se envía en cuanto el contacto entra al workflow.

2. **Correo al día siguiente**
   - Acción: **Wait 1 day**
   - Acción siguiente: **Send an email**
   - Plantilla: `Zapier – Día 2`

3. **Correo adicional para dominio `karina.biz`**
   - Acción: **If/Else Condition**
     - Condición: el campo `email` contiene `@karina.biz`.
   - Rama **verdadera**:
     - Acción: **Wait 3 days**
     - Acción: **Send an email**
       - Plantilla: `Zapier – Día 5 (Dominio karina.biz)`
   - Rama **falsa**:
     - El contacto no recibe el tercer correo y termina el flujo.

## 3. Pruebas realizadas

<img width="1441" height="700" alt="imagen" src="https://github.com/user-attachments/assets/063e22b4-8a32-4759-8c75-d6686638273e" />


Se ejecutó una prueba en Zapier con un solo contacto proveniente de la API pública y se verificó que:

- Los datos se almacenan correctamente en el archivo Excel (Nombre, Email, Teléfono, Website).
- El contacto se crea en Brevo dentro de la lista `Zapier Contacts`.
- El workflow se activa, aplicando la etiqueta `zapier`.
- Se envía el correo inmediato y el correo al día siguiente.
- Para un contacto con dominio `@karina.biz`, se dispara correctamente el tercer correo a los 3 días adicionales.

Se adjunta el pantallazo del Zap configurado y el enlace al archivo Excel compartido, tal como lo solicita el ejercicio.
