-- SQL Script: Exploratory Data Analysis (EDA) - Dental Clinic
-- Project: Dental Clinic Data Analysis

-- This script performs an initial exploratory data analysis (EDA) on the
-- cleaned dental clinic dataset. The primary goal is to extract key metrics
-- and insights related to patient demographics, treatment types, sales, and overall clinic performance. 
-- This analysis serves as a foundation for deeper analysis.

-- The queries below operate on the tables that have been previously cleaned, renamed, and structured from their raw transactional form.
-- (Refer to 'data_transformation_flow.png' or 'raw_to_cleaned_data.png' for the transformation process)
-- The 'clinicalajeado' schema is assumed for all queries.

-- #############################################################################
-- Section 1: Database Schema Exploration
-- Objective: Understand the current structure and available tables in the
--            cleaned database.
-- #############################################################################

-- Query 1.1: List all tables in the 'clinicalajeado' schema
-- Provides a high-level overview of the organized tables available for analysis, confirming the success of the data transformation.
SELECT
	table_schema,
	table_name,
	table_type
FROM
	information_schema.tables
WHERE
	table_schema = 'clinicalajeado';

-- #############################################################################
-- Section 2: Patient Registration and Treatment Initiation
-- Quantify the patient base, distinguishing between initial registrations  and those who proceeded with actual treatments.
-- #############################################################################

-- Query 2.1:Counts distinct patients based on initial consultations for general dentistry.(General Procedures)

SELECT
	COUNT(DISTINCT CNPJ_CPF) AS 'total_general_procedures_patients'
FROM
	initial_consultations;

-- Query 2.2: Counts distinct patients based on initial orthodontic consultations or installations. (Orthodontics)

SELECT
	COUNT(DISTINCT CNPJ_CPF) AS 'total_orthodontics_patients'
FROM
	orthodontic_installations;

-- Query 2.3: Aggregates patients from both general and orthodontic initial registrations to provide a complete count of the clinic's patient base.

SELECT
	(SELECT COUNT(DISTINCT CNPJ_CPF) FROM initial_consultations) +
 	(SELECT COUNT(DISTINCT CNPJ_CPF) FROM orthodontic_installations) AS 'Total of patients registered';

-- Query 2.4: Identifies unique patients who began actual general dentistry treatments after their initial consultations.

SELECT
	COUNT(DISTINCT CNPJ_CPF) AS 'total_general_procedures_initiated_patients'
FROM
	patient_visits;

-- Query 2.5: Identifies unique orthodontic patients who began treatment after their initial consultations or installations.

SELECT
	COUNT(DISTINCT CNPJ_CPF) AS 'total_orthodontic_procedures_initiated_patients'
FROM
	orthodontic_appointments;

-- Query 2.6: Orthodontic treatment initiation trends over years
-- Shows the yearly trend of new orthodontic installations, including a window function sum to visualize cumulative growth. 
-- Helps understand growth patterns in this specific service.

SELECT
	DATE_FORMAT(INICIO_MANUT, '%Y') AS 'instalation_year',
	COUNT(CNPJ_CPF) AS 'total_patients',
	SUM(COUNT(CNPJ_CPF)) OVER(ORDER BY DATE_FORMAT(INICIO_MANUT, '%Y')) 'sum_over_years'
FROM
	orthodontic_installations
WHERE
	DATE_FORMAT(INICIO_MANUT, '%Y') IS NOT NULL
GROUP BY
	DATE_FORMAT(INICIO_MANUT, '%Y')
ORDER BY
	'instalation_year';

-- Query 2.7: Aggregates patients who started either general or orthodontic treatments to provide a complete count of active treatment cases.

SELECT
	(SELECT COUNT(DISTINCT CNPJ_CPF) FROM patient_visits) +
 	(SELECT COUNT(DISTINCT CNPJ_CPF) FROM orthodontic_appointments) AS 'Total patients that initiated trataments';

-- #############################################################################
-- Section 3: Patient Demographics and Acquisition Channels
-- Objective: Understand patient geographical distribution and how they discover the clinic.
-- #############################################################################

-- Query 3.1: Patients by City |  Identifies all cities from which patients originate and counts the number of patients from each city. 
-- This helps in understanding the clinic's geographical reach.
-- 'CGC_CPF' is assumed to be the unique patient identifier in the 'patients' table.

SELECT
	CIDADE AS 'city',
	COUNT(CGC_CPF) AS 'patient_id'
FROM
	patients
GROUP BY
	CIDADE
ORDER BY
	patient_id DESC;

-- Query 3.2: Patient Acquisition Channels | Determines how patients initially learned about or were referred to the clinic.
-- This insight is valuable for marketing and referral strategy optimization.
-- Missing data in the total count indicates incomplete registration information, potentially due to details not provided by patients or not recorded by staff.

SELECT
	ORIGEM_PACIENTE AS 'acquisition channel',
	COUNT(ORIGEM_PACIENTE) AS 'number of patients'
FROM
	patients
GROUP BY
	ORIGEM_PACIENTE;

-- #############################################################################
-- Section 4: Services and Treatments Offered
-- Objective: Catalog the range of dental and orthodontic services provided by the clinic.
-- #############################################################################

-- Query 4.1: List all available specialties
-- Purpose: Provides a complete list of dental specialties offered at the clinic.

SELECT*
FROM
	specialties;

-- Query 4.2: List all general dentistry treatments offered | List all the specific general dentistry procedures and products available.

SELECT
	NOME AS 'general_treatments_offered'
FROM
	products;

-- Query 4.3: Lists the unique orthodontic treatment types and plans available.

SELECT
	DISTINCT(NOME) AS 'orthodontic_treatments_offered'
FROM
	orthodontic_treatment_prices;

-- Query 4.4: Combined total of distinct treatments offered (General + Orthodontics) | Provides a comprehensive count of all unique services/treatments
--the clinic makes available to patients.

SELECT
	(SELECT COUNT(DISTINCT NOME) AS 'Number of general treatments' FROM products) +
	(SELECT COUNT(DISTINCT CODIGO) AS 'Number of orthodontics treatments' FROM orthodontic_treatment_prices) AS 'Total of treatments offered';

-- #############################################################################
-- Section 5: Clinic Operational Timelines
-- Objective: Understand the temporal scope of the available data.
-- #############################################################################

-- Query 5.1: First and Last Patient Registration Dates & Data Availability Span | Identifies the earliest and most recent patient registration dates,
-- and calculates the total period of data available for historical analysis.

SELECT
	MIN(data_lanc) AS 'first_patient_registration_date',
	MAX(data_lanc) AS 'last_patient_registration_date',
	TIMESTAMPDIFF(YEAR, MIN(data_lanc), MAX(data_lanc)) AS 'years_available_for_analysis'
FROM
	patient_visits;

-- Query 5.2: Youngest and Oldest Patient by Birth Date | Determines the age range of the clinic's patient clientele,
-- providing insights into the demographic profile.
-- CURDATE() for current age calculation.

SELECT
	MIN(DT_NASCIMENTO) AS 'oldest_patient_birthdate',
	TIMESTAMPDIFF(YEAR, MIN(DT_NASCIMENTO), CURDATE()) AS 'age',
	MAX(DT_NASCIMENTO) AS 'youngest_patient_age_years',
	TIMESTAMPDIFF(YEAR, MAX(DT_NASCIMENTO), CURDATE()) AS 'age'
FROM
	patients;

-- #############################################################################
-- Section 6: Financial Performance - Sales and Procedures
-- Objective: Quantify revenue generation and treatment volume.
-- #############################################################################

-- Query 6.1: Total Sales for General Procedures | Calculates the total revenue generated from general dentistry procedures.

SELECT
	ROUND(SUM(VRBRUTO)) AS 'total_general_procedures_sales'
FROM
	direct_payments;

-- Query 6.2: Total Sales for Orthodontic Procedures | Calculates the total revenue generated specifically from orthodontic treatments.

SELECT
	ROUND(SUM(VALOR)) 'total_orthodontic_procedures_sales'
FROM
	orthodontic_payments;

-- Query 6.3: Combined Total Sales from all Procedures | Provides the overall gross revenue generated by the clinic from all services.

SELECT
	(SELECT ROUND(SUM(VRBRUTO)) FROM direct_payments) +
	(SELECT ROUND(SUM(VALOR)) FROM orthodontic_payments) AS 'total_sales';

-- Query 6.4: Total Number of Executed General Procedures | Counts the distinct number of general dentistry procedures that have been performed.

SELECT
	COUNT(DISTINCT DOCUMENTO) AS 'total_general_procedures_executed'
FROM
	executed_procedures;

-- Query 6.5: Total Number of Executed Orthodontic Procedures | Counts the distinct number of orthodontic treatment instances that have occurred.

SELECT
	COUNT(DISTINCT LANCTO) AS 'total_orthodontic_procedures_executed'
FROM
	orthodontic_appointments;

-- Query 6.6: Combined Total of All Executed Procedures | Sums all general and orthodontic procedures performed,
-- giving a comprehensive view of treatment volume.

SELECT
	(SELECT COUNT(DISTINCT DOCUMENTO) FROM executed_procedures) +
 	(SELECT COUNT(DISTINCT LANCTO)FROM orthodontic_appointments) AS 'total_executed_procedures';

-- Query 6.7: Average Selling Price for General Procedures

SELECT
	ROUND(AVG(VRBRUTO), 2) AS 'avg_general_procedures_selling_price'
FROM
	direct_payments;

-- Query 6.8: Average Selling Price for Orthodontic Procedures

SELECT
	ROUND(AVG(VALOR), 2) AS 'avg_orthodontic_procedures_selling_price'
FROM
	orthodontic_payments;

-- #############################################################################
-- Section 7: Core Business Metrics Report (Consolidated KPIs)
-- Objective: Present key performance indicators (KPIs) in a single, easy-to-read table
-- for quick insights into the clinic's overall performance at a glance.
-- #############################################################################

SELECT
 	'Total of patients registerd' AS KPI,
 	((SELECT COUNT(DISTINCT CNPJ_CPF) FROM initial_consultations) +
	(SELECT COUNT(DISTINCT CNPJ_CPF) FROM orthodontic_installations)) AS Result
UNION ALL
SELECT
	'Patients that initiated treatments' AS KPI,
	((SELECT COUNT(DISTINCT CNPJ_CPF) FROM patient_visits) +
	(SELECT COUNT(DISTINCT CNPJ_CPF) FROM orthodontic_appointments)) AS Result
UNION ALL
SELECT
	'Total sales' AS KPI,
	((SELECT ROUND(SUM(VRBRUTO)) FROM direct_payments) +
	(SELECT ROUND(SUM(VALOR)) FROM orthodontic_payments)) AS Result
UNION ALL
SELECT
	'Total Number of executed procedures' AS KPI,
	((SELECT COUNT(DISTINCT DOCUMENTO) FROM executed_procedures) +
	(SELECT COUNT(DISTINCT LANCTO) FROM orthodontic_appointments)) AS Result
UNION ALL
SELECT
	'Number of treatments offered' AS KPI,
	((SELECT COUNT(DISTINCT NOME) FROM products) +
	(SELECT COUNT(DISTINCT CODIGO) FROM orthodontic_treatment_prices)) AS Result
UNION ALL
SELECT
	'AVG general procedures prices' AS KPI,
	(SELECT ROUND(AVG(VRBRUTO), 2) FROM direct_payments) AS Result
UNION ALL
SELECT
	'AVG orthodontic procedures prices' AS KPI,
	(SELECT ROUND(AVG(VALOR), 2) FROM orthodontic_payments) AS Result;