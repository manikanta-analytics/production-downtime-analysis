# Production Downtime Analysis

## 📌 Project Overview

This project analyzes production downtime data to understand machine performance, downtime patterns, failure counts, downtime causes, and shift-wise trends.

The project follows an end-to-end data analytics workflow:

**Excel → MySQL → SQL Analysis → Power BI Dashboard**

---

## 🎯 Business Problem

Production downtime can reduce productivity and increase operational costs.

The objective of this analysis is to:

- Identify machines with high downtime
- Analyze downtime across different shifts
- Identify major failure and downtime causes
- Understand production downtime trends
- Present the findings through an interactive Power BI dashboard

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Excel | Data cleaning and preparation |
| MySQL | Data storage and SQL analysis |
| SQL | Data analysis and extracting insights |
| Power BI | Data visualization and dashboard creation |

---

## 🔄 Project Workflow

### 1. Data Collection
Started with the raw production downtime dataset.

### 2. Data Cleaning
Cleaned and prepared the data in Excel by checking data quality, formatting, missing/inconsistent values, and duplicate records.

### 3. SQL Analysis
Imported the cleaned dataset into MySQL and used SQL queries to analyze:

- Machine-wise downtime
- Shift-wise downtime
- Failure counts
- Downtime causes
- Production-related metrics

### 4. Power BI Dashboard
Created an interactive dashboard to visualize the main production downtime metrics and trends.

### 5. Insights
Used the analysis and dashboard to identify important patterns in production downtime.

---

## 📊 Dashboard

### Dashboard Preview

#### Main Dashboard

![Production Downtime Dashboard](screenshots/production-downtime-analysis.png)

#### Machine Analysis

![Machine Analysis](screenshots/Machine_Analysis.png)

#### Shift Analysis

![Shift Analysis](screenshots/Shift_Analysis.png)

---

## 🔍 Key Insights

- Total recorded downtime was **13,309.50 hours** across **13,104 production records**.
- The analysis recorded **3,590 failures** across **8 machines**.
- **PRS-03** recorded the highest downtime among the machines analyzed.
- Downtime was distributed across the **Morning, Evening, and Night shifts**, with the Evening and Night shifts showing higher downtime than the Morning shift.
- **Motor, Bearing, and Hydraulic** issues were among the major downtime causes in the dataset.
- The dashboard provides machine-wise, shift-wise, cause-wise, and time-based views to support production downtime analysis.
---

## 📁 Repository Structure

```text
production-downtime-analysis/
│
├── README.md
│
├── data/
│   └── Cleaned dataset
│
├── sql/
│   └── SQL analysis queries
│
├── powerbi/
│   └── Power BI dashboard files
│
└── screenshots/
    └── Dashboard screenshots
