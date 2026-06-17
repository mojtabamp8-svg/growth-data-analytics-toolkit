-- Retention Curve Template
WITH base AS (
    SELECT
        user_id,
        MIN(activity_date) AS first_activity
    FROM user_events
    GROUP BY 1
),
activity AS (
    SELECT
        e.user_id,
        DATE_PART('day', e.activity_date - b.first_activity) AS day_offset
    FROM user_events e
    JOIN base b USING (user_id)
)
SELECT
    day_offset,
    COUNT(DISTINCT user_id) AS retained_users
FROM activity
GROUP BY 1
ORDER BY 1;
