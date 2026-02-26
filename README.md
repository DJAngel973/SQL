# Database Practice - MySQL, PostgreSQL and MongoDB

This repository is a comprehensive educational resource for learning and practicing different database systems. It includes practical scripts, Docker configurations, and real-world examples for MySQL, PostgreSQL, and MongoDB.

**Knowledge Source:** This MySQL material is based on concepts and examples acquired from the **Java Engineer Professional** course on Coursera, adapted and expanded for hands-on practice.

---

## Contents

- **MySQL**: Basic to advanced SQL scripts (DDL, DML, JOINs, Window Functions, CTEs)
- **PostgreSQL**: (Coming soon)
- **MongoDB**: (Coming soon)

---

## Technologies

- **MySQL 8.0** - Relational database
- **PostgreSQL 15** - Advanced relational database
- **MongoDB 7** - NoSQL document database
- **Docker & Docker Compose** - Containerization

---

## Database Comparison

| Feature | MySQL | PostgreSQL | MongoDB |
|---------|-------|------------|---------|
| **Type** | Relational (SQL) | Relational (SQL) | NoSQL (Documents) |
| **Best for** | Web apps, CRUD operations | Complex analytics, data integrity | Unstructured data, horizontal scaling |
| **ACID** | ✅ | ✅ | ✅ (since v4.0) |
| **Use cases** | WordPress, e-commerce | Financial apps, geospatial | Real-time apps, IoT |

### **Real-World Examples:**

#### 🐬 **MySQL**
**Companies:** Facebook, Twitter, YouTube, Netflix, Uber, Airbnb
- Content management systems
- E-commerce platforms
- User authentication systems

#### 🐘 **PostgreSQL**
**Companies:** Apple, Reddit, Instagram, Spotify, Twitch
- Financial transaction systems
- Geospatial applications (maps, location data)
- Data analytics platforms

#### �� **MongoDB**
**Companies:** Adobe, Cisco, eBay, Forbes, Bosch
- Real-time analytics
- IoT data collection
- Content management with flexible schemas

---

## Docker Setup

### **Prerequisites**

- Docker installed ([Install Docker](https://docs.docker.com/get-docker/))
- Docker Compose installed

### **Quick Start**

```bash
# Clone the repository
git clone https://github.com/DJAngel973/SQL.git
cd SQL

# Copy environment variables
cp .env.example .env
# Edit .env with your passwords

# Start all database containers
docker compose up -d

# Verify containers are running
docker ps
```

### **Access Databases**

```bash
# MySQL
docker exec -it inicio-mysql-coursera mysql -u root -p

# PostgreSQL (coming soon)
docker exec -it inicio-postgresql-coursera psql -U postgres

# MongoDB (coming soon)
docker exec -it inicio-mongodb-coursera mongosh
```

### **Stop Containers**

```bash
# Stop without deleting data
docker compose down

# Stop AND delete volumes (⚠️ careful - deletes all data!)
docker compose down -v
```

---

### **Security Best Practices**

```bash
# ✅ Use environment variables
docker exec -i container mysql -u root -p${PASSWORD} < script.sql

# ⚠️ Visible password (only for local development)
docker exec -i container mysql -u root -pPASSWORDEXAMPLE < script.sql
```

---


## Learning Path

Each database folder contains numbered scripts that progress from basic to advanced topics. Start with script `01_` and work your way up!

See each folder's README for specific topics:
- [MySQL Learning Path](./MySQL/README.md)
- PostgreSQL Learning Path (coming soon)
- MongoDB Learning Path (coming soon)

---

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](./CONTRIBUTING.md) for details.

---