/* ============================================================
   Consumer Credit Risk & Borrower Segmentation Analysis
   Author: [Bukola Aina]
   Description:
   SQL queries supporting borrower segmentation, default risk
   analysis, product-level exposure, and underwriting validation.
   ============================================================ */


/* ------------------------------------------------------------
   1. Default Rate by Borrower Segment
   Business Question:
   Which borrower segments exhibit the highest probability of default?
   ------------------------------------------------------------ */

SELECT
    cluster,
    COUNT(*) AS total_loans,
    AVG(CAST(default_flag AS FLOAT)) AS default_rate
FROM [AdventureWorksFix].[dbo].[accepted_scored]
GROUP BY cluster
ORDER BY default_rate DESC;


/* ============================================================
   BUSINESS QUESTION 2
   How do leverage and income-to-debt ratios influence default behavior?
   ============================================================ */

SELECT
    cluster,
    AVG(log_dti) AS avg_log_dti,
    AVG(CAST(default_flag AS FLOAT)) AS default_rate
FROM [AdventureWorksFix].[dbo].[accepted_scored]
GROUP BY cluster
ORDER BY avg_log_dti DESC;


/* ------------------------------------------------------------
   3. Product-Level Risk Analysis (Loan Term)
   Business Question:
   Which loan products contribute most to expected loss?
   Note:
   Loan term is used as a proxy for product type.
   ------------------------------------------------------------ */

SELECT
    term,
    COUNT(*) AS loan_count,
    AVG(CAST(default_flag AS FLOAT)) AS default_rate
FROM [AdventureWorksFix].[dbo].[accepted_scored]
GROUP BY term
ORDER BY default_rate DESC;

/* ============================================================
   BUSINESS QUESTION 4
   How does portfolio risk concentration change under adverse conditions?
   (Stress-like assumption: defaults concentrate in higher-risk segments)
   ============================================================ */

SELECT
    cluster,
    COUNT(*) AS total_loans,
    SUM(CAST(default_flag AS FLOAT)) AS total_defaults,
    SUM(CAST(default_flag AS FLOAT)) / SUM(SUM(CAST(default_flag AS FLOAT))) 
        OVER () AS share_of_total_defaults
FROM [AdventureWorksFix].[dbo].[accepted_scored]
GROUP BY cluster
ORDER BY share_of_total_defaults DESC;






/* ------------------------------------------------------------
   5. Underwriting Validation (Accepted vs Rejected)
   Business Question:
   Do underwriting decisions align with observable risk indicators?
   ------------------------------------------------------------ */

SELECT
    accepted_flag,
    avg_emp_length AS avg_employment_length_years,
    count AS Applicant_Count
FROM [AdventureWorksFix].[dbo].[accepted_vs_rejected]
ORDER BY accepted_flag;

# Accepted borrowers demonstrate nearly 4× longer employment tenure than rejected applicants, validating the effectiveness of underwriting decisions.