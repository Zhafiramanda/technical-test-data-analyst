# technical-test-data-analyst
Submission for Technical Test 1 - Data Analyst

## 📂 Dataset
Terdapat 3 dataset terkait perilaku pengguna:
1. **users_data.csv** → berisi profil pengguna  
   - Kolom: id, current_age, gender, yearly_income, credit_score, dll  
2. **cards_data.csv** → berisi informasi kartu yang dimiliki user  
   - Kolom: id, client_id, card_type, provider, credit_limit, acct_open_date, dll  
3. **transactions_data.csv** → berisi riwayat transaksi pengguna  
   - Kolom: id, date, client_id, card_id, amount, merchant_city, merchant_state, dll  

Relasi antar tabel:
- users_data.id = cards_data.client_id = transactions_data.client_id
- cards_data.id = transactions_data.card_id

---

## 🛠 Tools yang Digunakan
- **MySQL 8.0** → untuk query SQL & analisis data  
- **MySQL Workbench** → untuk manajemen database  
- **Google Looker Studio** → untuk visualisasi & dashboard  
- **PowerPoint** → untuk presentasi (export PDF)
  
---

## ▶️ Cara Menjalankan

### 1. Membuat Database 
```sql
CREATE DATABASE user_behavior;
USE user_behavior;
```
### 2. Import Dataset (CSV) ke Database
Gunakan **MySQL Workbench → Table Data Import Wizard** untuk mengimpor file CSV.  
- **users_data.csv**
- **cards_data.csv**
- **transactions_data.csv**
  
### 3. Menjalankan Query Analisis
Salin atau jalankan query yang ada di file **queries.sql** untuk melakukan analisis. 

1. **Melihat total user unik & duplikasi**
2. **Analisis proporsi user yang pernah / belum bertransaksi**
3. **Menghitung Monthly Active Users (MAU)**
4. **Analisis jenis kartu terpopuler**
5. **Top 20 Spenders**
6. **Analisis kategori merchant (MCC)**
7. **Analisis kota dengan spending tertinggi**
8. **Scorecards**

## 📊 Visualisasi (Looker Studio)
Dashboard berisi:
1. **Monthly Active Users (MAU)**
2. **Card Type Popularity**
3. **Top 20 Spenders**
4. **Top MCC Categories**

Link Dashboard: *[https://lookerstudio.google.com/reporting/3ea18bb7-b3e7-4a36-86d6-a4b438bcfb44]*

---

## 📑 Deliverables
- **queries.sql → kumpulan query SQL analisis**
- **User Behavior Presentation.pdf → presentasi hasil analisis & insight**
- **Dashboard (Looker Studio) → visualisasi**

---

