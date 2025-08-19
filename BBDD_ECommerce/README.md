# 🛒 Ecommerce Database Project

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue?logo=postgresql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Compose-blue?logo=docker&logoColor=white)
[![TablePlus](https://img.shields.io/badge/TablePlus-–yourColor?logo=tableplus&logoColor=white)](https://tableplus.com/)

Este proyecto contiene una base de datos de un **E-commerce** creada en **PostgreSQL 15**, desplegada con **Docker**, y acompañada de un conjunto de **consultas analíticas** para demostrar habilidades en SQL.

---

## 🗂️ Esquema de la base de datos

La base de datos contiene tablas relacionadas con usuarios, productos, pedidos y pagos.

### 📌 Tablas principales

- **users** 👤 → Información de clientes (nombre, email, fecha de creación).
- **products** 📦 → Catálogo de productos (nombre, precio. categoría).
- **categories** 🏷️ → Clasificación de productos (Ej: Electrónica, Ropa).
- **orders** 🧾 → Pedidos realizados por los usuarios.
- **order_details** 🛍️ → Detalle de cada pedido (producto, cantidad).
- **reviews** 🔍 → Opiniones de los clientes con puntuación(1 a 5) y comentarios.

---

## 📊 Consultas analíticas incluidas

El archivo [`queries/analysis_queries.sql`](../queries/analysis_queries.sql) contiene **20 consultas** que permiten analizar los datos.

Ejemplos:

- 🔝 **Top 10 productos más vendidos**
- 👥 **Clientes con mayor gasto total**
- 📈 **Evolución de ingresos por mes**
- 🛒 **Carrito promedio por cliente**
- 📦 **Productos sin ventas registradas**

---

## 📂 Estructura del proyecto

```
ecommerce-project/
│── data/
│   └── backup/                 # Backup limpio de la base de datos
│   └── dataCsv/                # Contiene los csv con los datos de las tablas
│
│── diagrama_ER/                # Contiene el diagrama de Entidad-Relación
│── queries/
│   └── creation_queries.sql    # Queries usadas para crear las tablas
│   └── analysis_queries.sql    # 20 consultas analíticas en SQL
│
│── .gitignore                  # Archivos y carpetas ignoradas por Git
│── docker-compose.yml          # Configuración de PostgreSQL con Docker
│── README.md                   # Documentación del proyecto
```

---

## 📐 Diagrama entidad-relación

---

## 👤 Autor

**ChristianCV**

- 📧 Email: [atinare.dev@gmail.com](atinare.dev@gmail.com)
- 💼 LinkedIn: [https://www.linkedin.com/in/christian-cazorla/](https://www.linkedin.com/in/christian-cazorla/)

• [Portfolio](https://github.com/AtinareDev/PORTFOLIO_Data_Science)

---
