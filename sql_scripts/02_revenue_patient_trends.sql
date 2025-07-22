-- #######################################################################################################################################################################
-- Revenue & Patient Trends Over Time

-- Identify growth trends, plateaus, or declines in both revenue and patient volume over various time granularities (yearly, monthly).
-- This provides a clear view of the clinic’s trajectory.
-- #######################################################################################################################################################################

-- Query 1.1: Annual General Procedure Revenue & Patient Volume
-- Provides an annual financial performance overview for general procedures,tracking both total revenue generated and the number of unique patients
-- treated each year. 
-- Helps in understanding yearly growth or decline.

SELECT
	YEAR(DATA) AS 'year',
 	ROUND(SUM(VRLIQUIDO)) AS 'total_revenue',
 	COUNT(DISTINCT CGC_CPF) 'total_patients_treated'
FROM
	direct_payments
GROUP BY
	YEAR(DATA)
ORDER BY
	YEAR(DATA) ASC;

-- Query 1.2: Monthly General Procedure Revenue & New Patients (Specific Year)
-- Purpose: Observes monthly revenue and the total number of unique patients treated within a specific year. 
-- This helps identify intra-year trends and peak/low performance periods.
 -- It can be adapted the WHERE clause with the year of interest 
SELECT
	DATE_FORMAT(DATA, '%Y-%m') AS 'month',
 	ROUND(SUM(VRLIQUIDO)) AS 'total_revenue',
 	COUNT(DISTINCT CGC_CPF) 'total_patients_treated'
FROM
	direct_payments
GROUP BY
	DATE_FORMAT(DATA, '%Y-%m')
ORDER BY
	ROUND(SUM(VRLIQUIDO)) ASC;

-- Query 1.3: Monthly Orthodontic Revenue & Appointment Volume
-- Purpose: Provides the result of orthodontic revenue by each month and year,
--          along with the count of distinct orthodontic appointments. This
--          focuses on the financial performance and service volume of orthodontics.
SELECT
	DATE_FORMAT(DATA_PAGTO, '%Y-%m') AS 'month',
	ROUND(SUM(VALOR),2) AS 'total_revenue',
	COUNT(DISTINCT LANCTO) AS 'total_orthodontics_appointments'
FROM
	orthodontic_payments
GROUP BY
	DATE_FORMAT(DATA_PAGTO, '%Y-%m')
ORDER BY
	ROUND(SUM(VALOR),2) DESC;

-- Query 1.4: Monthly General Procedure Revenue (Ranked by Performance) | Helps identify which months generate the most sales and revenue,
-- highlighting seasonal trends or peak performance periods for general procedures across all years in the dataset.

SELECT
	MONTH(DATA) AS 'month',
 	ROUND(SUM(VRLIQUIDO)) AS 'revenue'
FROM
	direct_payments
GROUP BY
	MONTH(DATA)
ORDER BY
	ROUND(SUM(VRLIQUIDO)) DESC;

-- Query 1.5: Annual Orthodontic Braces Installation Volume | Tracks the annual volume of new orthodontic braces installations.
-- This metric is key for understanding the growth rate of new orthodontic patient acquisitions.

SELECT
	YEAR(INICIO_MANUT) AS 'year',
 	COUNT(DISTINCT CNPJ_CPF) AS 'number_of_braces_installed'
FROM
	orthodontic_installations
WHERE
	YEAR(INICIO_MANUT) IS NOT NULL
GROUP BY
	YEAR(INICIO_MANUT);