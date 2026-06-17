-- Basic Churn Modeling Template
SELECT
    user_id,
    last_active_date,
    CASE
        WHEN last_active_date < NOW() - INTERVAL '30 days' THEN 1
        ELSE 0
    END AS is_churned
FROM user_activity_summary;
