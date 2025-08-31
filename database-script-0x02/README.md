# 🧪 Sample Data: Airbnb Database

This directory contains SQL scripts to populate the database schema with sample data for testing and development purposes.

---

## 📁 Files

- **seed.sql**: SQL `INSERT` statements for Users, Properties, Bookings, Payments, Reviews, and Messages.  
- **README.md**: This file.  

---

## 🚀 How to Use

1. Create the Database Schema:
    First, ensure the schema is created by running the schema script (from `../database-script-0x01/`):
   ```sql
    \i path/to/schema.sql

2. Load the Sample Data:
   ```sql
    \i path/to/seed.sql

## ✅ Notes

- The sample data is for testing and demonstration only.
- UUIDs are pre-generated for simplicity.
- You can extend or replace this dataset as needed for your use case.