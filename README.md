 FILM PRODUCTION DATABASE MANAGEMENT SYSTEM

##  PROJECT OVERVIEW

This project is a  "FILM PRODUCTION DATABASE MANAGEMENT SYSTEM" developed using Java (Swing GUI) and Supabase PostgreSQL. It allows users to manage film production data including films, actors, and crew members through a graphical interface.

The system demonstrates core database concepts such as:

* Relational schema design
* CRUD operations (Create, Read, Update, Delete)
* SQL queries and transactions
* Database connectivity using JDBC

---

## TECHNOLOGIES USED

* Java (Swing)– G UI development
* PostgreSQL (Supabase) – Cloud database
* JDBC – Database connectivity
* Maven – Dependency management
* IntelliJ IDEA – Development environment
* Git & GitHub – Version control

---

##  PROJECT STRUCTURE

```
film-production-dbms/
│
├── src/
│   ├── db/
│   │   └── DBConnection.java
│   │
│   ├── ui/
│   │   ├── LoginScreen.java
│   │   ├── Dashboard.java
│   │   ├── FilmScreen.java
│   │   ├── ActorScreen.java
│   │   └── CrewScreen.java
│   │
│   └── Main.java
│
├── database.sql
├── pom.xml
├── .gitignore
└── README.md
```

---

##  FEATURES

*  Login screen
*  Dashboard navigation
*  Film management (Insert, Update, Delete, View)
*  Actor management (Insert, Delete, View)
*  Crew management (Insert, Delete, View)
*  Cloud database integration (Supabase)
*  Real-time database updates

---

## DATABASE DESIGN

The system uses a relational database with tables such as:

* `films`
* `actors`
* `crew`
* `film_cast`
* `film_crew`

📄 Full schema and sample data are included in:

```
database.sql
```

---

##  DATABASE CONNECTION

The application connects to Supabase using JDBC with SSL enabled.

Example configuration:

```java
String url = "jdbc:postgresql://<host>:6543/postgres?sslmode=require";
String user = "postgres.<project_ref>";
String password = System.getenv("DB_PASSWORD");
```

---

##  HOW TO RUN THE PROJECT

### 1. Clone Repository

```
git clone https://github.com/YOUR_USERNAME/film-production-dbms.git
```

---

### 2. Open in IntelliJ

* Open the project folder
* Wait for Maven dependencies to load

---

### 3. Configure Environment Variable

Set your database password:

**In IntelliJ Run Configuration:**

```
DB_PASSWORD=your_database_password
```

---

### 4. Run Application

Run:

```
Main.java
```

---

##  Usage

1. Login to the system
2. Navigate using dashboard
3. Perform CRUD operations:

   * Add films, actors, crew
   * Update film details
   * Delete records
   * View stored data

---


##  Security

* Database credentials are NOT HARDCODED
* Uses environment variables for secure access

---

