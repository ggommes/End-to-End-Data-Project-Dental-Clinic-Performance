-- ###########################################################################################################################################################
-- Section 5: Operational Efficiency: Appointment Punctuality
-- Analyze appointment punctuality to highlight areas for process improvement  or scheduling adjustments, which is also a key to patient satisfaction.
-- ###########################################################################################################################################################

-- Query 5.1: Appointment Punctuality 
-- This initial query directly uses time differences to categorize punctuality.

-- Note: Though the query logic is correct, the issue likely stems from columns 'HORA_MARCADA' and 'HORA_ATEND' not being stored as proper time values.
-- In a real-world scenario, it would be best to ask the data engineering team
-- to adjust the column types. For now, the query below has been adapted to continue the analysis.

SELECT
	HORA_MARCADA,
 	HORA_ATEND,
CASE
	WHEN TIMESTAMPDIFF(MINUTE,HORA_MARCADA, HORA_ATEND) > 30 THEN 'Major delay'
	WHEN TIMESTAMPDIFF(MINUTE,HORA_MARCADA, HORA_ATEND) > 10 THEN 'Delay'
 	WHEN TIMESTAMPDIFF(MINUTE,HORA_MARCADA, HORA_ATEND) BETWEEN 0 AND 10 THEN 'On time'
	ELSE 'N/A'
END AS 'punctuality'
FROM
	patient_visits;

-- CTE 5.2: Adjusted Appointments Punctuality
-- To accurately measure appointment punctuality, 
-- this CTE combines recorded time strings ('HORA_MARCADA', 'HORA_ATEND') with a neutral date ('2000-01-01') using CONCAT. 
-- This enables the TIMESTAMPDIFF() function to reliably calculate the exact difference in minutes between scheduled
-- and actual appointment times, allowing analysis without altering the dataset.

WITH appointments_pointuality AS (
	SELECT
		HORA_MARCADA,
		HORA_ATEND,
	CASE
		WHEN TIMESTAMPDIFF(MINUTE, CONCAT('2000-01-01 ', HORA_MARCADA), CONCAT('2000-01-01 ', HORA_ATEND)) > 30 THEN 'Major delay'
		WHEN TIMESTAMPDIFF(MINUTE, CONCAT('2000-01-01 ', HORA_MARCADA), CONCAT('2000-01-01 ', HORA_ATEND)) > 10 THEN 'Delay'
		WHEN TIMESTAMPDIFF(MINUTE, CONCAT('2000-01-01 ', HORA_MARCADA), CONCAT('2000-01-01 ', HORA_ATEND)) BETWEEN 0 AND 10 THEN 'On time'
		WHEN TIMESTAMPDIFF(MINUTE, CONCAT('2000-01-01 ', HORA_MARCADA), CONCAT('2000-01-01 ', HORA_ATEND)) < -5 THEN 'Early'
		ELSE 'Early'
	END AS 'punctuality'
	FROM
		patient_visits
)
-- Query 5.3: Aggregated Appointment Punctuality Results | Aggregates the results from the `appointments_pointuality` CTE,
-- providing a clear count of appointments by each punctuality category.
SELECT
	punctuality,
 	COUNT(punctuality) AS 'appointments'
FROM
	appointments_pointuality
GROUP BY
	punctuality;