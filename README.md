# DBMS
# 🏥 Hospital Management System — DBMS Project

This project implements a comprehensive **Hospital Management System (HMS)** using **MySQL**, showcasing key **Relational Database Management System (RDBMS)** concepts such as normalization, relationships, foreign keys, and queries.

---

## 📌 Problem Statement

Design a complete database schema for a hospital that captures real-world data and interactions between patients, doctors, departments, appointments, billing, and more — using properly structured tables and foreign key relationships.

---

## 🗃️ Database Schema Overview

The system consists of **15+ tables**, including:

- `patients`, `doctors`, `departments`, `appointments`
- `bills`, `medical_records`, `prescriptions`, `pharmacy`
- `rooms`, `admissions`, `lab_tests`, `lab_results`
- `staff`, `users`, `diseases`

Each table includes timestamps and primary/foreign key relationships to enforce data integrity.

---

## 🔗 Relationships Covered

- Patients ↔ Appointments ↔ Doctors  
- Doctors ↔ Medical Records ↔ Prescriptions  
- Patients ↔ Admissions ↔ Rooms  
- Lab Tests ↔ Lab Results ↔ Patients ↔ Doctors  
- Users table manages roles: Admin, Doctor, Patient, Staff  

---

## 🛠️ Features Implemented

- Full schema creation with SQL `CREATE TABLE` scripts
- `INSERT INTO` scripts with **realistic dummy data**
- Logical table filling order to maintain foreign key constraints
- `JOIN`-ready schema for advanced queries
- Basic billing, lab results, and prescription simulation

---

## 🔄 Future Enhancements

- Stored procedures and triggers  
- Query optimization and indexing  
- Frontend interface (e.g., using PHP or Python Flask)  
- Role-based access system  
- Real-time hospital dashboard

---

## 💾 Technologies Used

- MySQL (via **XAMPP**)
- SQL DDL & DML
- Excel (for data population)
- Notepad++ / VS Code

---

## 📁 Files Included

- `schema.sql` – Table creation scripts  
- `sample_data.sql` – INSERT statements with realistic data  
- `README.md` – Project overview  
- `project_report.docx` – Detailed documentation (this file)

---

## 📸 Screenshots / ER Diagram

*(Optional: Add ER diagram or schema screenshots if available)*

---

## 👨‍💻 Author

**B. Muktheswara Reddy**  
NIT Warangal | Electrical and Electronics Engineering (2022–26)  
Email: muktheswaraboreddy@email.com

---

## 📜 License

This project is for educational purposes only.

