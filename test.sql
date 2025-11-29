/* ============================================================
   SQL – Soluciones Prueba Full Stack Martech
   Este archivo contiene todas las consultas y creación de tablas
   utilizadas para resolver los puntos de SQL.
   ============================================================ */


/* ============================================================
   Creación de tabla y carga de datos: LEADS
   ============================================================ */

-- Crear tabla leads
CREATE TABLE leads (
    id INT PRIMARY KEY,
    source VARCHAR(50),
    created_at DATE,
    status VARCHAR(20),
    budget INT
);

-- Insertar datos
INSERT INTO leads (id, source, created_at, status, budget) VALUES
(1, 'Meta Ads', '2025-10-10', 'new', 1200),
(2, 'Google Ads', '2025-10-05', 'won', 900),
(3, 'Facebook Ads', '2025-09-28', 'lost', 300),
(4, 'Meta Ads', '2025-10-01', 'won', 2500),
(5, 'Referral', '2025-10-12', 'new', 400);


/* ============================================================
   Solución Pregunta 6
   Filtrar leads de Meta Ads en octubre 2025 y budget > 1000
   ============================================================ */

SELECT id, source, budget
FROM leads
WHERE source = 'Meta Ads'
  AND created_at BETWEEN '2025-10-01' AND '2025-10-31'
  AND budget > 1000;


/* ============================================================
   Solución Pregunta 7
   Calcular el promedio de budget de los leads filtrados
   ============================================================ */

SELECT AVG(budget) AS promedio_budget
FROM (
    SELECT budget
    FROM leads
    WHERE source = 'Meta Ads'
      AND created_at BETWEEN '2025-10-01' AND '2025-10-31'
      AND budget > 1000
) AS filtros;


/* ============================================================
   Creación de tabla y carga de datos: EVENTS
   ============================================================ */

-- Crear tabla events
CREATE TABLE events (
    id INT PRIMARY KEY,
    event_name VARCHAR(50),
    platform VARCHAR(50),
    created_at DATE
);

-- Insertar datos
INSERT INTO events (id, event_name, platform, created_at) VALUES
(1, 'purchase', 'web', '2025-10-01'),
(2, 'view_item', 'ios', '2025-10-01'),
(3, 'add_to_cart', 'web', '2025-10-02'),
(4, 'purchase', 'android', '2025-10-02'),
(5, 'purchase', 'web', '2025-10-03');


/* ============================================================
   Solución Pregunta 8
   Contar eventos por tipo y ordenar de mayor a menor
   ============================================================ */

SELECT event_name, COUNT(*) AS total_eventos
FROM events
GROUP BY event_name
ORDER BY total_eventos DESC;


/* ============================================================
   Creación de tabla y carga de datos: WP_USERS
   ============================================================ */

-- Crear tabla wp_users reducida
CREATE TABLE wp_users (
  ID bigint(20) unsigned NOT NULL,
  user_login varchar(60) NOT NULL,
  user_pass varchar(255) NOT NULL,
  user_nicename varchar(100) NOT NULL,
  user_email varchar(100) DEFAULT '',
  PRIMARY KEY (ID)
);

-- Insertar datos
INSERT INTO wp_users (ID, user_login, user_pass, user_nicename, user_email)
VALUES
(1, 'admin_charlotte1', '$wp$2y$10$R6EnvrF9m9eP2HDU5DGCV3V2OkcI3pU.DWh90XJg4r...', 'admin_charlotte1', ''),
(28, 'lorna', '$P$B0tnXe6D4mG5Hc..DB7J.07pzag1Dg.', 'lorna', ''),
(29, 'blairfitzwater', '$P$BSw0sijuw/SqNOGJH1J/CmjjDDdQdn/', 'blairfitzwater', ''),
(30, 'mrsrozellajacobsphd1004', '$P$Bk0l85lh13f.0osfJ0X1RR6KnPm2D1gg/', 'mrsrozellajacobsphd1004', ''),
(31, 'briyioperdomo50', '$P$Byl/NPmnbitN5VPCEfqKphfYhnvzU0', 'briyioperdomo50', ''),
(32, 'alexislozada50', '$P$BsvoboxmbCzpL5WX1P8VnrKHq6CAHsk/', 'alexislozada50', ''),
(24, 'drwalkersteubeirv796', '$P$BbizOmlLXYcG19R1.Xwc2VzW35FWU7i0', 'drwalkersteubeirv796', ''),
(25, 'b-escortgirls4fun.com', '$P$B8oE6vgSogf4l5S326T50P08QEOpc/', 'b-escortgirls4fun.com', ''),
(26, 'ceo', '$P$B8G0N2erL1cLNJigC14qMz.e4cGc.y.', 'ceo', ''),
(27, 'bonitagran1769', '$P$BchiXBP4bmwNXq0Xy7NKDHK8T7vLI1I', 'bonitagran1769', '');


/* ============================================================
   Solución Pregunta 9
   Cambiar la contraseña del usuario "ceo"
   ============================================================ */

UPDATE wp_users
SET user_pass = MD5('NuevaClaveCeo')
WHERE user_login = 'ceo';
