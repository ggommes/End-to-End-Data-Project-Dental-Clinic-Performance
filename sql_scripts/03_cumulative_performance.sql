-- ##########################################################################################################################
-- Section 2: Cumulative Performance Insights
-- Visualize overall financial growth and identify milestones reached over time by calculating cumulative totals for revenue. 
-- This provides a different perspective than just period-over-period figures.
-- ##########################################################################################################################

-- Query 2.1: Cumulative General Procedure Revenue by Year | Calculates the running total of general procedures revenue, 
-- showing the clinic's cumulative financial growth in this segment over the years.

-- CTE: total_revenue_by_year finds the total revenue (VRLIQUIDO) for each year from general procedures.

WITH total_revenue_by_year AS (
	SELECT
		DATE_FORMAT(DATA,'%y') AS 'year',
		ROUND(SUM(VRLIQUIDO)) AS 'total_result'
	FROM
		direct_payments
	GROUP BY
		DATE_FORMAT(DATA,'%y')
)
-- Final Query: Applies a window function to calculate the running total.

SELECT
	year,
 	total_result,
 	SUM(total_result) OVER (ORDER BY year) AS 'cumulative_result'
FROM
	total_revenue_by_year;

-- Query 2.2: Cumulative Orthodontic Procedure Revenue by Year | Calculates the running total of orthodontic procedures revenue,
-- showing the cumulative financial growth in this segment over the years.

-- CTE: total_orthorevenue_by_year finds the total revenue (VALOR) for each year from orthodontic payments.

WITH total_orthorevenue_by_year AS (
	SELECT
		DATE_FORMAT(DATA_ATEND,'%y') AS 'year',
 		ROUND(SUM(VALOR)) AS 'total_result'
	FROM
		orthodontic_payments
	GROUP BY
		DATE_FORMAT(DATA_ATEND,'%y')
)
-- Final Query: Applies a window function to calculate the running total.
SELECT
	year,
	total_result,
	SUM(total_result) OVER (ORDER BY year) AS 'cumulative_result'
FROM
	total_orthorevenue_by_year;

-- Note on Data Anomaly: In this case, there is a NULL value for the year. After checking the 'orthodontic_payments' table, it appears the blank entries
-- correspond to patients registered in 2020. So, it is assumed that the result of 13,924 is from 2020. 
-- But with no confirmation avaiable, this information will be left out of the analysis.