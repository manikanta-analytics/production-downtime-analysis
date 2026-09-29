# Production Downtime Dataset

This folder contains the cleaned production downtime dataset used for the Production Downtime Analysis project.

## Dataset Information

- **Records:** 13,104
- **Format:** Excel
- **File:** `Production_Downtime_Cleaned.xlsx`

## Main Columns

| Column | Description |
|---|---|
| `date` | Production record date |
| `machine_id` | Unique machine identifier |
| `shift` | Production shift |
| `planned_hours` | Planned operating hours |
| `downtime_hours` | Machine downtime in hours |
| `operating_hours` | Actual operating hours |
| `production_qty` | Production quantity |
| `failure_type` | Type of machine failure |
| `maintenance_cost` | Maintenance cost |
| `Downtime%` | Downtime percentage |
| `Utilization%` | Machine utilization percentage |
| `Deprtment` | Department associated with the machine |

## Data Preparation

The dataset was cleaned and prepared in Excel before being imported into MySQL for SQL analysis and Power BI for dashboard development.
