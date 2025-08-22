# technical-test-data-analyst
Submission for **Technical Test 1 - Data Analyst**

---

## 📂 Dataset
There are 3 datasets related to user behavior:

1. **users_data.csv** → contains user profile information  
   - Columns: `id`, `current_age`, `gender`, `yearly_income`, `credit_score`, etc.  

2. **cards_data.csv** → contains information about the cards owned by users  
   - Columns: `id`, `client_id`, `card_type`, `provider`, `credit_limit`, `acct_open_date`, etc.  

3. **transactions_data.csv** → contains users’ transaction history  
   - Columns: `id`, `date`, `client_id`, `card_id`, `amount`, `merchant_city`, `merchant_state`, etc.  

🔗 **Table Relationships**:  
- `users_data.id = cards_data.client_id = transactions_data.client_id`  
- `cards_data.id = transactions_data.card_id`  

---

## 🛠 Tools Used
- **MySQL 8.0** → for SQL queries & data analysis  
- **MySQL Workbench** → for database management  
- **Google Looker Studio** → for visualization & dashboard  
- **PowerPoint** → for presenting results (export to PDF)  

---

## ▶️ How to Run

### 1. Create Database
```sql
CREATE DATABASE user_behavior;
USE user_behavior;
```
### 2. Import Dataset (CSV) ke Database
Use MySQL Workbench → Table Data Import Wizard to import the CSV files:
- **users_data.csv**
- **cards_data.csv**
- **transactions_data.csv**
  
### 3. Run Analysis Queries
Copy or execute the queries provided in queries.sql to perform the analysis:. 

1. **Check total unique users & duplicates**
2. **Analyze proportion of users who have / have not transacted**
3. **Calculate Monthly Active Users (MAU)**
4. **Analyze most popular card types**
5. **Top 20 Spenders**
6. **Analyze merchant categories (MCC)**
7. **Analyze top cities by spending**
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
- **queries.sql → collection of SQL analysis queries**
- **User Behavior Presentation.pdf → presentation of analysis & insights**
- **Dashboard (Looker Studio) → visualization**

---

