

# 🌾 Farmers Marketplace Node.js Backend

A backend system built with Node.js and SQLite to simulate a real-world agricultural marketplace. This project manages farmers, crops, supplies, and transactions, offering RESTful APIs and SQL-powered insights for rural commerce.

---

## 📦 Project Structure 

farmers-marketplace-node/ ├── README.md ├── package.json ├── .env ├── LICENSE ├── /schema │ └── create_tables.sql ├── /data │ ├── sample_farmers.csv │ ├── sample_crops.csv │ ├── sample_supplies.csv │ ├── sample_orders.csv │ └── sample_sales.csv ├── /scripts │ └── seed_data.sql ├── /diagrams │ └── ER_diagram.png ├── /queries │ ├── basic_queries.sql │ ├── advanced_queries.sql │ └── insights_queries.sql ├── /db │ └── database.js ├── /routes │ └── auth.js ├── /controllers │ └── authController.js └── index.js



 
---

## 🚀 Features

- 🧑‍🌾 Farmer registration and login (JWT-based)
- 🌱 Crop and supply inventory tracking
- 💰 Sales and order management
- 📊 SQL queries for analytics and insights
- 🔐 Secure password handling with bcrypt
- 📁 Modular architecture for scalability

---

## 🛠️ Technologies Used

- Node.js + Express
- SQLite + SQL
- JWT Authentication
- RESTful API Design
- ER Modeling & Relational Schema

---

## 📋 Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/farmers-marketplace-node.git
   cd farmers-marketplace-node

Install dependencies 
npm install
Create .env file 
JWT_SECRET=your_secret_key
PORT=3000
Initialize the database Run the SQL scripts in /schema/create_tables.sql and /scripts/seed_data.sql using a SQLite client or CLI.

Start the server 
node index.js
API Endpoints
POST /auth/register
Register a new farmer account.

POST /auth/login
Login and receive a JWT token.

More endpoints for crops, supplies, and transactions coming soon.

📈 SQL Insights
Explore powerful queries in /queries/:

Farmers with zero sales

Equipment and fertilizer purchases

Crop quantity tracking

Sales and supply trends over time 
🤝 Contributing
Pull requests are welcome! For major changes, please open an issue first to discuss what you’d like to change.

📄 License
This project is licensed under the MIT License.


---

Let me know if you'd like to add API documentation, Postman collection, or deployment instructions next.
