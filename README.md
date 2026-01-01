Consumer Credit Risk & Borrower Segmentation Analysis

**Project Overview**

This project delivers an end-to-end consumer credit risk analysis designed to reflect real-world credit risk and underwriting workflows. Using LendingClub loan data, the analysis applies machine learning–based borrower segmentation, risk analytics, and executive reporting to evaluate default behavior, pricing effectiveness, and underwriting outcomes.

**Business Questions**

Which borrower segments exhibit the highest probability of default?

How do utilization and income-to-debt ratios influence default risk?

Which loan products contribute the most to expected loss?

How does portfolio risk concentration change under economic stress scenarios?

**Data Sources**

LendingClub Accepted Loans Dataset (2007–2018)

LendingClub Rejected Applications Dataset

Public, industry-recognized datasets commonly used in credit risk research.

**Methodology**
Data Preparation & Feature Engineering (Python)

Cleaned and standardized borrower attributes

Engineered key risk features (employment length, leverage proxies, log income)

Created default flags based on realized credit loss events

**Borrower Segmentation**

Applied K-Means clustering to segment borrowers into interpretable risk profiles

Determined optimal cluster count using inertia (elbow) analysis

Validated segmentation structure using PCA visualization

**Risk & Pricing Analysis**

Evaluated default rates and exposure concentration by borrower segment

Assessed alignment between interest rate pricing and observed default risk

Used loan term as a proxy for product-level risk comparison

**Underwriting Validation**

Compared accepted and rejected applicants using available risk indicators

Validated underwriting decisions through employment stability separation

Acknowledged real-world data limitations for rejected applicants

**Executive Reporting**

Built interactive Power BI dashboards for portfolio risk, segmentation, and underwriting validation

**Key Insights**

Default risk is concentrated within specific borrower segments rather than evenly distributed

Higher leverage and weaker income stability are associated with increased default risk

Longer-term loan products contribute disproportionately to expected loss

Underwriting decisions are directionally effective based on observable risk separation

Segment-level monitoring provides stronger risk visibility than aggregate portfolio metrics

## Data Availability

Due to GitHub file size limitations, raw LendingClub datasets
(`accepted_2007_to_2018Q4.csv.gz`, `rejected_2007_to_2018Q4.csv.gz`)
are not included in this repository.

The analysis uses processed and derived datasets generated from the raw files:
- `accepted_scored.csv`
- `accepted_vs_rejected.csv`
- `cluster_summary.csv`

Raw data can be obtained directly from the LendingClub public dataset on Kaggle.


**Project Structure**
consumer-credit-risk/
│
├── data/
│   ├── accepted_scored.csv
│   └── rejected_features.csv
│
├── notebooks/
│   └── Consumer_credit_risk.ipynb
│
├── sql/
│   └── credit_risk_queries.sql
│
├── powerbi/
│   └── credit_risk_dashboard.pbix
│
└── README.md

**Tools & Technologies**

Python (pandas, scikit-learn, matplotlib)

SQL

Power BI

Jupyter Notebook
