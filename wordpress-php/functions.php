<?php
setlocale(LC_TIME, 'es_ES.UTF-8', 'es_ES', 'spanish');
// Cargar estilos
add_action('wp_enqueue_scripts', function() {
    wp_enqueue_style('martech-style', get_template_directory_uri() . '/assets/css/styles.css', [], '1.0');
});

// Registrar menús
add_action('after_setup_theme', function() {
    add_theme_support('menus');
    register_nav_menu('header_menu', 'Menú Principal');
    add_theme_support('post-thumbnails');
});

// Shortcode: título del post actual
add_shortcode('titulo_post', function() {
    global $post;

    if (!isset($post->ID)) {
        return '';
    }

    return get_the_title($post->ID);
});

// Popup dinámico en footer
// Popup solicitado en la prueba técnica
add_action('wp_footer', function() {

    setlocale(LC_TIME, 'es_ES.UTF-8', 'es_ES', 'spanish');
    // Fecha dinámica con formato: "1 de marzo"
    $fecha = date_i18n('j \d\e F');

    ?>
    <style>
        #popup-acacias-overlay {
            display: none;
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.55);
            justify-content: center;
            align-items: center;
            z-index: 99999;
        }

        #popup-acacias {
            background: white;
            padding: 30px;
            max-width: 420px;
            width: 90%;
            border-radius: 12px;
            position: relative;
            box-shadow: 0 10px 30px rgba(0,0,0,.25);
            font-family: Arial, sans-serif;
            animation: fadeIn .3s ease;
        }

        #popup-acacias h2 {
            margin-top: 0;
            font-size: 24px;
            font-weight: bold;
            color: #222;
        }

        #popup-acacias p {
            font-size: 15px;
            line-height: 1.4;
            color: #333;
        }

        #popup-acacias button.close-popup {
            position: absolute;
            top: 10px; right: 12px;
            border: none;
            background: none;
            font-size: 20px;
            cursor: pointer;
        }

        #popup-acacias a.popup-btn {
            display: inline-block;
            padding: 10px 18px;
            margin-top: 15px;
            background: #111;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 500;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(.95); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>

    <div id="popup-acacias-overlay">
        <div id="popup-acacias">

            <button class="close-popup" onclick="document.getElementById('popup-acacias-overlay').style.display='none'">
                ×
            </button>

            <h2>Bienvenido a Acacias</h2>

            <p>
                El día de hoy <strong><?php echo esc_html($fecha); ?></strong> obtén un 10% en tu primera consulta.
                Déjanos tus datos.
            </p>

            <a href="#" class="popup-btn">Quiero registrarme</a>
        </div>
    </div>

    <script>
        // Muestra el popup 1 segundo después de cargar el sitio
        window.addEventListener("load", function() {
            setTimeout(function() {
                var overlay = document.getElementById("popup-acacias-overlay");
                if (overlay) overlay.style.display = "flex";
            }, 1000);
        });
    </script>
    <?php
});


// Hook para insertar contenedor de Google Tag Manager en <head>
add_action('wp_head', function() {
    ?>
    <!-- Google Tag Manager (head) -->
    <!-- Reemplazar con el código real de GTM -->
    <?php
});
