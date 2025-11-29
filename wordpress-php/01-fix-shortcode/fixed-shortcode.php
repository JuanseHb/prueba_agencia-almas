<?php
/**
 * Shortcode: [titulo_post]
 * Output: título del post actual.
 */

add_shortcode('titulo_post', 'titulo_post_fn');

function titulo_post_fn($atts) {
    global $post;

    if (!isset($post->ID)) {
        return '';
    }

    return get_the_title($post->ID);
}
