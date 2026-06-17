-- Cohort Analysis Template
WITH user_activity AS (
    SELECT
        user_id,
        DATE_TRUNC('month', signup_date) AS cohort_month,
        DATE_TRUNC('month', activity_date) AS activity_month
    FROM user_events
)
SELECT
    cohort_month,
    activity_month,
    COUNT(DISTINCT user_id) AS active_users
FROM user_activity
GROUP BY 1, 2
ORDER BY 1, 2;
