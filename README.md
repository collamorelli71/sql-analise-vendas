<div align="center">

<img src="https://capsule-render.vercel.app/api?type=rect&color=64B5F6,F48FB1&height=2&section=header" width="100%"/>

# 📊 Sales Analysis — SQL Portfolio Project

[![Live Demo](https://img.shields.io/badge/▶_Interactive_Demo-64B5F6?style=for-the-badge&logo=googlechrome&logoColor=white)](https://SEU-USERNAME.github.io/sql-analise-vendas)
[![Docker](https://img.shields.io/badge/Docker_Ready-2496ED?style=for-the-badge&logo=docker&logoColor=white)](#-run-locally-with-docker)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)](#)

<br/>

*Analyzing sales performance with real SQL techniques: CTEs, Window Functions, Aggregations, and Subqueries.*

<img src="https://capsule-render.vercel.app/api?type=rect&color=64B5F6,F48FB1&height=2&section=header" width="100%"/>

</div>

<br/>

<a href="#-sobre-o-projeto"><img src="https://img.shields.io/badge/🇧🇷_Leia_em_Português-F48FB1?style=flat-square" alt="Português"/></a>

## 🎯 About

This project demonstrates practical SQL skills through a **fictional e-commerce sales dataset**. Each query solves a real business question — from identifying top-performing products to detecting revenue trends over time.

**What makes it different:** You can explore the queries in two ways:
- **🌐 Interactive Demo** → [Click here](https://SEU-USERNAME.github.io/sql-analise-vendas) to run queries in the browser with mock results
- **🐳 Docker** → Clone, `docker-compose up`, and execute real queries on a live PostgreSQL database

## 📋 Business Questions Answered

| # | Question | SQL Techniques |
|---|----------|---------------|
| 1 | What are the top 10 products by revenue? | `GROUP BY`, `ORDER BY`, `SUM` |
| 2 | Monthly revenue trend over the last 12 months? | `DATE_TRUNC`, `CTE`, aggregation |
| 3 | Revenue contribution by category (% of total)? | `Window Functions`, `SUM() OVER()` |
| 4 | Which sellers consistently beat their monthly average? | `CTE`, `AVG() OVER()`, `HAVING` |
| 5 | Running total of revenue per region? | `SUM() OVER(ORDER BY)`, `PARTITION BY` |
| 6 | Customer cohort analysis — retention by signup month? | `CTE`, `DATE_TRUNC`, `COUNT DISTINCT` |

## 🗄️ Database Schema

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│  customers   │     │   orders     │     │  products    │
├──────────────┤     ├──────────────┤     ├──────────────┤
│ id (PK)      │◄────│ customer_id  │     │ id (PK)      │
│ name         │     │ id (PK)      │     │ name         │
│ email        │     │ order_date   │     │ category     │
│ city         │     │ total_amount │     │ price        │
│ region       │     │ seller_id    │     │ cost         │
│ signup_date  │     └──────┬───────┘     └──────┬───────┘
└──────────────┘            │                    │
                    ┌───────┴───────┐            │
                    │  order_items  │            │
                    ├───────────────┤            │
                    │ id (PK)       │            │
                    │ order_id (FK) │            │
                    │ product_id(FK)├────────────┘
                    │ quantity      │
                    │ unit_price    │
                    └───────────────┘
    ┌──────────────┐
    │   sellers    │
    ├──────────────┤
    │ id (PK)      │
    │ name         │
    │ region       │
    │ hire_date    │
    └──────────────┘
```

## 🐳 Run Locally with Docker

```bash
# Clone the repo
git clone https://github.com/SEU-USERNAME/sql-analise-vendas.git
cd sql-analise-vendas

# Start PostgreSQL with seed data
docker-compose up -d

# Connect and run queries
docker exec -it sales-db psql -U analyst -d sales

# Run a specific query
docker exec -it sales-db psql -U analyst -d sales -f /queries/01-top-products.sql

# Stop
docker-compose down
```

## 📂 Project Structure

```
sql-analise-vendas/
├── index.html              ← Interactive demo (GitHub Pages)
├── docker-compose.yml      ← One-command database setup
├── seed.sql                ← Schema + 500 rows of realistic data
├── queries/
│   ├── 01-top-products.sql
│   ├── 02-monthly-revenue.sql
│   ├── 03-category-share.sql
│   ├── 04-top-sellers.sql
│   ├── 05-running-total.sql
│   └── 06-cohort-analysis.sql
└── README.md
```

---

## 🇧🇷 Sobre o Projeto

Este projeto demonstra habilidades práticas de SQL através de um **dataset fictício de vendas e-commerce**. Cada query resolve uma pergunta real de negócio — desde identificar produtos mais vendidos até detectar tendências de receita ao longo do tempo.

**O diferencial:** Você pode explorar as queries de duas formas:
- **🌐 Demo Interativa** → [Clique aqui](https://SEU-USERNAME.github.io/sql-analise-vendas) para executar queries no browser com resultados mockados
- **🐳 Docker** → Clone, `docker-compose up`, e execute queries reais num PostgreSQL

---

<div align="center">
<sub>Made with ☕ and SQL — <a href="https://github.com/SEU-USERNAME">Back to profile</a></sub>
</div>
