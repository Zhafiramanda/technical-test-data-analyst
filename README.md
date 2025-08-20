# technical-test-data-analyst
Submission for Technical Test 1 - Data Analyst

## 📂 Dataset
Tes ini menggunakan 3 dataset publik terkait perilaku pengguna:
1. **users_data.csv** → berisi profil pengguna  
   - Kolom: id, current_age, gender, yearly_income, credit_score, dll  
2. **cards_data.csv** → berisi informasi kartu yang dimiliki user  
   - Kolom: id, client_id, card_type, provider, credit_limit, acct_open_date, dll  
3. **transactions_data.csv** → berisi riwayat transaksi pengguna  
   - Kolom: id, date, client_id, card_id, amount, merchant_city, merchant_state, dll  

Relasi antar tabel:
users_data.id = cards_data.client_id = transactions_data.client_id
cards_data.id = transactions_data.card_id

