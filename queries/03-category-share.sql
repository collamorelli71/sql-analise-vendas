-- =============================================
-- QUERY 03: Revenue Share by Category (% of Total)
-- Techniques: Window Function SUM() OVER(), ROUND
-- =============================================
-- Business Question: What percentage of revenue does each category represent?

SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS category_revenue,
    SUM(SUM(oi.quantity * oi.unit_price)) OVER () AS total_revenue,
    ROUND(
        SUM(oi.quantity * oi.unit_price) * 100.0
        / SUM(SUM(oi.quantity * oi.unit_price)) OVER (), 1
    ) AS revenue_share_pct
FROM order_items oi
JOIN products p ON p.id = oi.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;
