-- =============================================
-- QUERY 05: Running Total of Revenue per Region
-- Techniques: SUM() OVER(ORDER BY), PARTITION BY
-- =============================================
-- Business Question: How does cumulative revenue grow across regions?

SELECT
    c.region,
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(o.total_amount) AS monthly_revenue,
    SUM(SUM(o.total_amount)) OVER (
        PARTITION BY c.region
        ORDER BY DATE_TRUNC('month', o.order_date)
    ) AS cumulative_revenue
FROM orders o
JOIN customers c ON c.id = o.customer_id
GROUP BY c.region, DATE_TRUNC('month', o.order_date)
ORDER BY c.region, month;
