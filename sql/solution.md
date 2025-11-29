# SQL – Soluciones

Este documento contiene todas las consultas utilizadas para responder la sección SQL de la prueba Full Stack Martech.

---

## `Creación de tabla y carga de datos`

### Tabla: `leads`

```
CREATE TABLE leads (
    id INT PRIMARY KEY,
    source VARCHAR(50),
    created_at DATE,
    status VARCHAR(20),
    budget INT
);

INSERT INTO leads (id, source, created_at, status, budget) VALUES
(1, 'Meta Ads', '2025-10-10', 'new', 1200),
(2, 'Google Ads', '2025-10-05', 'won', 900),
(3, 'Facebook Ads', '2025-09-28', 'lost', 300),
(4, 'Meta Ads', '2025-10-01', 'won', 2500),
(5, 'Referral', '2025-10-12', 'new', 400);
```

<img width="705" height="454" alt="imagen" src="https://github.com/user-attachments/assets/a6e60eef-3e56-42b4-8edf-a9a7f0497cf0" />

## Solución Pregunta 6

```
SELECT id, source, budget
FROM leads
WHERE source = 'Meta Ads'
  AND created_at BETWEEN '2025-10-01' AND '2025-10-31'
  AND budget > 1000;
```

<img width="702" height="470" alt="imagen" src="https://github.com/user-attachments/assets/62df73c9-b71e-4836-8f4d-d7e010508b40" />

## Solución Pregunta 7

```
SELECT AVG(budget) AS promedio_budget
FROM (
    SELECT budget
    FROM leads
    WHERE source = 'Meta Ads'
      AND created_at BETWEEN '2025-10-01' AND '2025-10-31'
      AND budget > 1000
) AS filtros;
```
  
<img width="697" height="391" alt="imagen" src="https://github.com/user-attachments/assets/ba220b99-7cdd-4f01-90c6-e85e33fcba00" />

## `Creación de tabla y carga de datos`

### Tabla: `events`

```
CREATE TABLE events (
    id INT PRIMARY KEY,
    event_name VARCHAR(50),
    platform VARCHAR(50),
    created_at DATE
);

INSERT INTO events (id, event_name, platform, created_at) VALUES
(1, 'purchase', 'web', '2025-10-01'),
(2, 'view_item', 'ios', '2025-10-01'),
(3, 'add_to_cart', 'web', '2025-10-02'),
(4, 'purchase', 'android', '2025-10-02'),
(5, 'purchase', 'web', '2025-10-03');
```

<img width="709" height="478" alt="imagen" src="https://github.com/user-attachments/assets/e3c4192c-edda-409d-ad19-36ae4aba5ea9" />

## Solución Pregunta 8

```
SELECT event_name, COUNT(*) AS total_eventos
FROM events
GROUP BY event_name
ORDER BY total_eventos DESC;
```

<img width="693" height="402" alt="imagen" src="https://github.com/user-attachments/assets/64e64490-c22b-45d1-bf66-07da41e7bef2" />

### Tabla: `wp_users`

```
CREATE TABLE wp_users (
  ID bigint(20) unsigned NOT NULL,
  user_login varchar(60) NOT NULL,
  user_pass varchar(255) NOT NULL,
  user_nicename varchar(100) NOT NULL,
  user_email varchar(100) DEFAULT '',
  PRIMARY KEY (ID)
);

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
```

## Solución Pregunta 9

```
UPDATE wp_users
SET user_pass = MD5('NuevaClave123')
WHERE user_login = 'ceo';
```
<img width="696" height="744" alt="imagen" src="https://github.com/user-attachments/assets/3a0bc74b-d9bd-4ba3-a9cf-6183d32e61d7" />


