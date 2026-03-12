-- =============================================
-- QUERY 02: Monthly Revenue Trend (Last 12 Months)
-- Techniques: DATE_TRUNC, CTE, LAG window function
-- =============================================
-- Business Question: How is our revenue trending month over month?

WITH monthly AS (
    SELECT
        DATE_TRUNC('month', order_date) AS month,
        COUNT(DISTINCT id) AS total_orders,
        SUM(total_amount) AS revenue
    FROM orders
    WHERE order_date >= CURRENT_DATE - INTERVAL '12 months'
    GROUP BY DATE_TRUNC('month', order_date)
)
SELECT
    TO_CHAR(month, 'YYYY-MM') AS month,
    total_orders,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month))
        / NULLIF(LAG(revenue) OVER (ORDER BY month), 0) * 100, 1
    ) AS growth_pct
FROM monthly
ORDER BY month;
