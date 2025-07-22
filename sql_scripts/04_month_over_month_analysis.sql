-- #####################################################################################################################################################
-- Month-over-Month Performance Analysis
-- Compare revenue performance between consecutive months to highlight growth or decline and provide a clear percentage change over the months.
-- #####################################################################################################################################################

-- Query 3.1: Month-over-Month General Procedure Revenue Change
-- Calculates and displays the month-over-month change in revenue for general procedures, including the precise percentage increase or decrease, and
-- categorizes the performance.

-- CTE: total_revenue_by_month aggregates the total revenue (VRLIQUIDO) for each month.

WITH total_revenue_by_month AS (
	SELECT
		DATE_FORMAT(DATA,'%y-%m') AS 'month',
		ROUND(SUM(VRLIQUIDO)) AS 'total_result'
	FROM
		direct_payments
	GROUP BY
		DATE_FORMAT(DATA,'%y-%m')
)
-- Final Query: Calculates and displays the month-over-month change in revenue,
-- including the precise percentage increase or decrease, and categorizes performance.

SELECT
	month,
 	total_result AS 'currently_month_result',
 	LEAD(total_result) OVER (ORDER BY month) AS 'next_month_result',
 	LEAD(total_result) OVER (ORDER BY month) - total_result AS 'diference',
	CONCAT(ROUND((LEAD(total_result) OVER (ORDER BY month) - total_result) / NULLIF(total_result,0) *100,2), "%") AS '%_change_over_month',
	CASE
		WHEN ROUND((LEAD(total_result) OVER (ORDER BY month) - total_result) / NULLIF(total_result,0) *100,2) <0 THEN 'Decline'
		WHEN ROUND((LEAD(total_result) OVER (ORDER BY month) - total_result) / NULLIF(total_result,0) *100,2) =0 THEN 'No Change'
 		WHEN ROUND((LEAD(total_result) OVER (ORDER BY month) - total_result) / NULLIF(total_result,0) *100,2) >0 THEN 'Increase'
	ELSE 'N/A'
	END 'performance by month'
FROM
	total_revenue_by_month;

-- Query 3.2: Orthodontic Service Growth & Consistency - New Installations
--  Analyzes the growth in new orthodontic installations month-over-month. This is key, given the recurring nature of orthodontic services.

-- CTE: total_instalations calculates the total number of unique orthodontic braces installations for each given month.

WITH total_instalations AS (
	SELECT
		DATE_FORMAT(INICIO_MANUT,'%y-%m') AS 'month',
		COUNT(DISTINCT CNPJ_CPF) AS 'number_of_intalled_bracers'
	FROM
		orthodontic_installations
	WHERE
		MONTH(INICIO_MANUT) IS NOT NULL
	GROUP BY
		DATE_FORMAT(INICIO_MANUT,'%y-%m')
)
-- Final Query: Displays the month-over-month installation results, including absolute and percentage change,
-- and categorizes the change ('Increase', 'No Change', 'Decline').

SELECT
	month,
	number_of_intalled_bracers,
	LEAD(number_of_intalled_bracers) OVER(ORDER BY month) AS 'next_month',
	CONCAT(ROUND((LEAD(number_of_intalled_bracers) OVER(ORDER BY month) - number_of_intalled_bracers) / NULLIF(number_of_intalled_bracers,0)*100,1),'%') AS 'result_over_month',
	CASE
		WHEN ROUND((LEAD(number_of_intalled_bracers) OVER(ORDER BY month) - number_of_intalled_bracers) / NULLIF(number_of_intalled_bracers,0),1) > 0 THEN 'Increse'
 		WHEN ROUND((LEAD(number_of_intalled_bracers) OVER(ORDER BY month) - number_of_intalled_bracers) / NULLIF(number_of_intalled_bracers,0),1) = 0 THEN 'No change'
 		WHEN ROUND((LEAD(number_of_intalled_bracers) OVER(ORDER BY month) - number_of_intalled_bracers) / NULLIF(number_of_intalled_bracers,0),1) < 0 THEN 'Decline'
 		ELSE 'N/A'
	END AS '%_change'
FROM
	total_instalations;

-- Query 3.3: Monthly Orthodontic Appointment Volume & Consistency | 
-- Aims to understand the average volume of orthodontic appointments per month and assess the consistency of consultations over time. 
-- Provides insights into operational stability and patient flow for orthodontic services.

-- CTE: orthodontic_appointment_count calculates the total number of distinct orthodontic appointments conducted for each month.

WITH orthodontic_appointment_count AS (
	SELECT
		DATE_FORMAT(DATA_MANUT,'%y-%m') AS 'month',
		COUNT(DISTINCT LANCTO) AS 'monthly_appointments'
	FROM
		orthodontic_appointments
	GROUP BY
		DATE_FORMAT(DATA_MANUT,'%y-%m')
)
-- Final Query: Shows the month-over-month orthodontic appointment performance, including current count, next month's count, absolute difference,
-- percentage change, and performance categorization.

SELECT
	month,
	monthly_appointments,
 	LEAD(monthly_appointments) OVER(ORDER BY month) AS 'diference_by_month',
 	LEAD(monthly_appointments) OVER(ORDER BY month)- monthly_appointments AS 'month_to_month_diference',
 	CONCAT(ROUND((LEAD(monthly_appointments) OVER(ORDER BY month)- monthly_appointments)/NULLIF(monthly_appointments,0)*100,2),'%') AS '%_result',
	CASE
		WHEN CONCAT(ROUND((LEAD(monthly_appointments) OVER(ORDER BY month)- monthly_appointments)/NULLIF(monthly_appointments,0)*100,2),'%') = '0.00%' THEN 'No change' -- Adjusted for exact string match or use numerical comparison before CONCAT
 		WHEN ROUND((LEAD(monthly_appointments) OVER(ORDER BY month)- monthly_appointments)/NULLIF(monthly_appointments,0)*100,2) > 0 THEN 'Increse'
 		WHEN ROUND((LEAD(monthly_appointments) OVER(ORDER BY month)- monthly_appointments)/NULLIF(monthly_appointments,0)*100,2) < 0 THEN 'Decrease'
 		ELSE 'N/A'
	END AS 'performance_by_month'
FROM
	orthodontic_appointment_count
GROUP BY
	month;