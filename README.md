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

### 1. Import Dataset ke Database
**MySQL**
```sql
CREATE DATABASE user_behavior;
USE user_behavior;

-- Import masing-masing CSV via Workbench: Table Data Import Wizard
