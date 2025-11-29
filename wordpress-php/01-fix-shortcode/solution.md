## Ejercicio 1

En el archivo functions.php hay un shortcode que debería mostrar el título del post actual, pero no funciona. Corrige el error y explica qué estaba fallando.

**
// Shortcode que debe mostrar el título del post actual
add_shortcode('titulo_post', 'titulo_post_fn');


function titulo_post_fn($atts) {
   global $post;
   return get_the_title($posts->ID);
}
**

### Respuesta corta

El shortcode fallaba porque usaba la variable inexistente $posts en lugar de $post.
La corrección consiste en usar get_the_title( $post->ID )

**
add_shortcode('titulo_post', 'titulo_post_fn');

function titulo_post_fn($atts) {
    global $post;

    // Validación: evitar errores si no hay un post en contexto
    if (!isset($post->ID)) {
        return '';
    }

    return get_the_title($post->ID);
}
**
