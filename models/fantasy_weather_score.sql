-- models/fantasy_weather_score.sql

SELECT
    city,
    date,
    temperature,
    precipitation,
    (temperature * 0.5) - (precipitation * 0.3) AS fantasy_weather_score -- example scoring formula
FROM `casestudy-421516.weather_data.historical_weather`
