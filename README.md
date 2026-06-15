# 🎬 Movie Ticket Booking System Database

## 📌 Project Overview

The **Movie Ticket Booking System** is a SQL-based database project that manages an online movie ticket booking platform.

This system allows users to browse movies, theatres, screens, shows, seats and book movie tickets. It also manages user details, payments, seat availability and booking history.

---

## 🛠️ Technologies Used

- SQL
- MySQL / Relational Database Management System (RDBMS)

### Concepts Used

- Database Design
- Primary Keys
- Foreign Keys
- Normalization
- Entity Relationships
- SQL Joins
- Aggregate Functions
- Transactions

---

## 📂 Project Structure


Movie-Ticket-Booking-System/

│
├── Movie_Booking.sql
│
└── README.md


---

# 🗄️ Database Tables

## 🏙️ Cities Table

Stores city details.

Columns:

- city_id
- name
- state
- zip_code

Relationship:


City 1 ---- N Theatres


---

## 🏢 Theatres Table

Stores theatre information.

Columns:

- theatre_id
- name
- address
- city_id

A city can have multiple theatres.

---

## 🎦 Screens Table

Stores screen details.

Columns:

- screen_id
- theatre_id
- screen_number
- total_seats

Relationship:


Theatre 1 ---- N Screens


---

## 🎞️ Movies Table

Stores movie details.

Columns:

- movie_id
- title
- duration_mins
- release_date
- description

---

## 🎭 Genres Table

Stores movie categories.

Examples:

- Action
- Drama
- Thriller

Relationship:


Movies N ---- N Genres


---

## 🕒 Shows Table

Stores movie show timings.

Contains:

- show_id
- movie_id
- screen_id
- start_time
- end_time
- date

---

## 💺 Seats Table

Stores seat details.

Example:


A1 - Gold
A2 - Gold
B1 - Silver


Contains:

- seat_id
- screen_id
- seat_number
- row_label
- seat_type

---

## 🎟️ Show_Seats Table

Maintains seat availability.

Status:


Available
Booked


Contains:

- show_seat_id
- show_id
- seat_id
- price
- status

---

## 👤 Users Table

Stores customer information.

Contains:

- user_id
- name
- email
- phone
- password_hash

---

## 📖 Bookings Table

Stores ticket booking information.

Contains:

- booking_id
- user_id
- show_id
- booking_time
- total_amount
- status

---

## 💳 Payments Table

Stores payment details.

Contains:

- payment_id
- booking_id
- amount
- payment_method
- transaction_id
- status

---

# 🔗 Database Relationships


Cities
|
|
Theatres
|
|
Screens
|
|
Shows
|
|
Bookings
|
|
Payments

Movies ---- Genres

Users ---- Bookings ---- Seats


---

# ⭐ Features

✅ Add and manage cities  
✅ Manage theatres and screens  
✅ Store movie information  
✅ Assign movie genres  
✅ Create movie shows  
✅ Manage seat availability  
✅ Book movie tickets  
✅ Store user details  
✅ Store payment information  
✅ View booking history  
✅ Handle transactions safely  

---

# 🔍 SQL Queries Included

## User Booking History

Displays:

- Booking ID
- Movie Name
- Theatre Name
- Show Time
- Seats Booked

Uses:

- JOIN
- GROUP BY

---

## Most Popular Movie

Finds the movie with maximum bookings.

Uses:

- COUNT()
- GROUP BY
- ORDER BY

---

## Seat Availability Report

Shows:

- Total booked seats
- Available seats

---

## Transaction Based Booking

Booking process:


Check Seat Availability
|
↓
Create Booking
|
↓
Assign Seats
|
↓
Update Seat Status
|
↓
Commit Transaction


SQL:

```sql
BEGIN TRANSACTION;

-- Booking operations

COMMIT;
🚀 How To Run
Step 1

Open MySQL.

Step 2

Create Database:

CREATE DATABASE MovieBooking;
Step 3

Select Database:

USE MovieBooking;
Step 4

Run the SQL file:

Movie_Booking.sql
🎯 Learning Objectives
Design a real-world database system
Understand relational databases
Implement primary and foreign keys
Apply normalization concepts
Write complex SQL queries
Use joins and transactions
👨‍💻 Author

Prathamesh V Shenoy

📜 License

This project is developed for educational purposes.
