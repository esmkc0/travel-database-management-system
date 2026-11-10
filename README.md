# Travel Database Management System

A relational database project developed using Oracle SQL to organize and manage travel-related information, including trips, destinations, accommodations, transportation, expenses, and travel companions.

## Technologies Used

- Oracle SQL
- Oracle Database
- JetBrains DataGrip
- Relational Database Design

## Project Overview

The project consists of 14 interconnected relational tables designed to store and organize travel information.

The database uses primary keys, foreign keys, composite primary keys, and data integrity constraints to establish relationships between entities.

## Database Structure

The database includes the following tables:

- **APP_USER:** Stores user information.
- **COUNTRY:** Stores country information.
- **CITY:** Stores cities and their associated countries.
- **TRIP:** Stores travel plans and dates.
- **TRIP_CITY:** Connects trips with destinations.
- **PLACE:** Stores attractions and places of interest.
- **TRIP_PLACE:** Records visited places, dates, ratings, and comments.
- **DAILY_NOTE:** Stores travel notes.
- **PHOTO:** Stores photo references and descriptions.
- **ACCOMMODATION:** Stores accommodation information.
- **TRANSPORTATION:** Stores transportation details.
- **EXPENSE:** Records travel expenses.
- **COMPANION:** Stores travel companion information.
- **TRIP_COMPANION:** Connects companions with trips.

## SQL Features

The project demonstrates:

- Relational database design
- Primary and foreign key relationships
- Many-to-many relationships
- Data insertion using INSERT statements
- Data filtering using WHERE
- Multi-table JOIN operations
- GROUP BY and aggregate functions (COUNT, SUM, MAX)
- Nested queries and subqueries
- Data integrity constraints

## Project Files

**01_create_table.sql** — Creates the relational database tables and defines their relationships.

**02_insert_data.sql** — Inserts sample travel-related data into the database.

**03_queries.sql** — Contains SQL queries for retrieving, filtering, joining, and analyzing travel information.

## How to Run

1. Connect to an Oracle database using JetBrains DataGrip or another Oracle-compatible SQL client.
2. Execute `01_create_table.sql` to create the database tables in a schema where they do not already exist.
3. Execute `02_insert_data.sql` to insert sample records.
4. Execute individual queries from `03_queries.sql` to explore and analyze the data.

## Author

Esma Koc

GitHub: https://github.com/esmkc0
