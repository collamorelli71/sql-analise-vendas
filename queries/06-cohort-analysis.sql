-- =============================================
-- QUERY 06: Customer Cohort Retention Analysis
-- Techniques: CTE, DATE_TRUNC, COUNT DISTINCT, self-reference
-- =============================================
-- Business Question: How well do we retain customers by signup cohort?

WITH cohorts AS (
    SELECT
        c.id AS customer_id,
        DATE_TRUNC('month', c.signup_date) AS cohort_month,
        DATE_TRUNC('month', o.order_date) AS order_month
    FROM customers c
    JOIN orders o ON o.customer_id = c.id
),
cohort_size AS (
    SELECT
        cohort_month,
        COUNT(DISTINCT customer_id) AS total_customers
    FROM cohorts
    GROUP BY cohort_month
),
retention AS (
    SELECT
        cohort_month,
        order_month,
        COUNT(DISTINCT customer_id) AS active_customers,
        EXTRACT(MONTH FROM AGE(order_month, cohort_month))::INT AS months_since_signup
    FROM cohorts
    GROUP BY cohort_month, order_month
)
SELECT
    TO_CHAR(r.cohort_month, 'YYYY-MM') AS cohort,
    cs.total_customers,
    r.months_since_signup,
    r.active_customers,
    ROUND(r.active_customers * 100.0 / cs.total_customers, 1) AS retention_pct
FROM retention r
JOIN cohort_size cs ON cs.cohort_month = r.cohort_month
WHERE r.months_since_signup <= 6
ORDER BY r.cohort_month, r.months_since_signup;
