-- Untuk membuat database baru dengan nama 'user_behavior'
CREATE DATABASE user_behavior;

-- Memilih atau menggunakan database 'user_behavior' agar semua query dibawah ini bisa di running
USE user_behavior;

-- 1.a Total user unik
SELECT COUNT(DISTINCT id) AS total_unique_users
FROM users_data;

-- 1.b Duplikat user_id
SELECT id AS user_id, COUNT(*) AS freq
FROM users_data
GROUP BY id
HAVING COUNT(*) > 1
ORDER BY freq DESC;

-- 1.c Jumlah user yang pernah dan belum pernah bertransaksi
SELECT 
  COUNT(DISTINCT u.id) AS total_users,
  COUNT(DISTINCT CASE WHEN t.client_id IS NOT NULL THEN u.id END) AS users_with_tx,
  COUNT(DISTINCT CASE WHEN t.client_id IS NULL THEN u.id END) AS users_without_tx
FROM users_data u
LEFT JOIN transactions_data t 
  ON t.client_id = u.id;

-- 1.d Distribusi nilai per-gender
SELECT gender, COUNT(*) AS cnt
FROM users_data
GROUP BY gender
ORDER BY cnt DESC;

-- 2) USER AKTIF PER BULAN (MAU)
SELECT
  DATE_FORMAT(t.date, '%Y-%m-01') AS month_start,
  COUNT(DISTINCT t.client_id) AS mau
FROM transactions_data t
GROUP BY month_start
ORDER BY month_start;

-- 3) JENIS KARTU TERPOPULER (pemakaian & nilai) 
SELECT
  c.card_type,
  COUNT(t.id) AS tx_count,
  SUM(CAST(REPLACE(REPLACE(t.amount,'$',''),',','') AS DECIMAL(18,2))) AS total_spend,
  AVG(CAST(REPLACE(REPLACE(t.amount,'$',''),',','') AS DECIMAL(18,2))) AS avg_ticket
FROM transactions_data t
JOIN cards_data c ON t.card_id = c.id
GROUP BY c.card_type
ORDER BY tx_count DESC;

-- 4) TOP SPENDER USERS
SELECT
  u.id AS user_id,
  MAX(u.current_age) AS current_age,
  MAX(u.gender) AS gender,
  MAX(CAST(REPLACE(REPLACE(u.yearly_income,'$',''),',','') AS DECIMAL(18,2))) AS yearly_income,
  SUM(CAST(REPLACE(REPLACE(t.amount,'$',''),',','') AS DECIMAL(18,2))) AS total_spend,
  COUNT(t.id) AS tx_count,
  AVG(CAST(REPLACE(REPLACE(t.amount,'$',''),',','') AS DECIMAL(18,2))) AS avg_ticket
FROM transactions_data t
JOIN users_data u ON t.client_id = u.id
GROUP BY u.id
ORDER BY total_spend DESC
LIMIT 20;

-- 5) MCC (kategori merchant) paling populer
SELECT 
  t.mcc,
  COUNT(t.id) AS tx_count,
  SUM(CAST(REPLACE(REPLACE(t.amount,'$',''),',','') AS DECIMAL(18,2))) AS total_spend
FROM transactions_data t
GROUP BY t.mcc
ORDER BY tx_count DESC
LIMIT 10;

-- 6) Kota dengan spending tertinggi
SELECT 
  t.merchant_city,
  COUNT(t.id) AS tx_count,
  SUM(CAST(REPLACE(REPLACE(t.amount,'$',''),',','') AS DECIMAL(18,2))) AS total_spend
FROM transactions_data t
GROUP BY t.merchant_city
ORDER BY total_spend DESC
LIMIT 10;

-- 7) SUMMARY (untuk SCORECARDS)
SELECT
  COUNT(DISTINCT u.id) AS total_users,
  COUNT(t.id) AS total_transactions,
  COALESCE(SUM(CAST(REPLACE(REPLACE(t.amount,'$',''),',','') AS DECIMAL(18,2))),0) AS total_spend,
  COALESCE(AVG(CAST(REPLACE(REPLACE(t.amount,'$',''),',','') AS DECIMAL(18,2))),0) AS overall_avg_ticket
FROM users_data u
LEFT JOIN transactions_data t ON t.client_id = u.id;

