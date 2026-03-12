-- =============================================
-- QUERY 04: Sellers Who Beat Their Monthly Average
-- Techniques: CTE, AVG() OVER(), comparison
-- =============================================
-- Business Question: Which sellers consistently outperform their own average?

WITH seller_monthly AS (
    SELECT
        s.name AS seller_name,
        s.region,
        DATE_TRUNC('month', o.order_date) AS month,
        SUM(o.total_amount) AS monthly_revenue
    FROM orders o
    JOIN sellers s ON s.id = o.seller_id
    GROUP BY s.name, s.region, DATE_TRUNC('month', o.order_date)
),
seller_avg AS (
    SELECT
        seller_name,
        region,
        month,
        monthly_revenue,
        AVG(monthly_revenue) OVER (PARTITION BY seller_name) AS avg_revenue,
        COUNT(*) OVER (PARTITION BY seller_name) AS total_months
    FROM seller_monthly
)
SELECT
    seller_name,
    region,
    ROUND(avg_revenue, 2) AS avg_monthly_revenue,
    COUNT(*) FILTER (WHERE monthly_revenue > avg_revenue) AS months_above_avg,
    total_months,
    ROUND(
        COUNT(*) FILTER (WHERE monthly_revenue > avg_revenue) * 100.0 / total_months, 1
    ) AS consistency_pct
FROM seller_avg
GROUP BY seller_name, region, avg_revenue, total_months
ORDER BY consistency_pct DESC;
