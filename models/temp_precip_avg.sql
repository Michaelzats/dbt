-- models/temp_precip_avg.sql

WITH daily_averages AS (
    SELECT
        city,
        date,
        AVG(temperature) OVER (PARTITION BY city) AS avg_temperature,
        AVG(precipitation) OVER (PARTITION BY city) AS avg_precipitation
    FROM `casestudy-421516.weather_data.historical_weather`
)

SELECT
    city,
    AVG(avg_temperature) AS cumulative_avg_temperature,
    AVG(avg_precipitation) AS cumulative_avg_precipitation
FROM daily_averages
GROUP BY city
