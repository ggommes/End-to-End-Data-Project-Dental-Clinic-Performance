# Project Background

I was a dentist and co-owner of a dental clinic in Lajeado, Rio Grande do Sul, Brazil, which has been providing comprehensive dental care for six years. The clinic’s business model is built on a broad range of services, with orthodontics (braces) as a key revenue driver due to its recurring monthly income from patient consultations. Implant rehabilitations represent the highest-value procedures, complemented by a wide range of general dentistry services. This project was made to analyze data and metrics from 2020 to 2025 and provide actionable insights and recommendations to the continuing partners.

Based on the extracted data and the clinic's operational context, this analysis will deliver insights and recommendations across four critical areas:

- **Revenue & Patient Trends Over Time:** - Evaluation of historical revenue and patient volume patterns, focusing on annual and monthly performance for general procedures and new orthodontic installations
- **Month-over-Month Sales Performance Analysis:** - Assessment of the clinic's long-term financial growth by tracking the accumulated revenue for key service segments. 
- **Cumulative Performance Insights & Growth:** - Detailed analysis of monthly sales fluctuations and consistency, including overall revenue changes and performance specifically for orthodontic services.
- **Product & Specialty Revenue Contribution:** - Breakdown of the financial contribution of each dental specialty and individual treatment to the clinic's total revenue. 

**The SQL queries addressing various business questions can be found within this repository.**

# Data Structure & Initial Checks
The company's main database structure, as seen below, consists of several interconnected tables, with a total row count of 151,511 records.

- **patients:** This table holds demographic and registration information for all registered patients.
- **initial_consultations:** Logs the very first consultation or evaluation visit a patient makes to the clinic.
- **patient_visits:** Contains details about patient visits during an active treatment plan, essentially serving as a schedule
- **procedures_appointments:** Details individual procedures scheduled for patients within appointments.
- **executed_procedures:** Records procedures that have actually been performed.
- **orthodontic_installations:** Records the initiation of orthodontic treatments by tracking the installation of orthodontic appliances.
- **orthodontic_appointments:** Records appointments specifically for orthodontic follow-ups and maintenance.
- **orthodontic_payments:** Stores payment records for orthodontic services.
- **payments:** Contains general payment records for all services.
- **direct_payments**: This table records direct, one-time payments that are not associated with a specific installment plan.
  
![Untitled Diagram (3)](https://github.com/user-attachments/assets/a2cec683-0db5-4731-a664-f783f4b53c64)

 **The SQL queries used to inspect and clean the raw data for this analysis can be found within this repository.**

# Executive Summary

The clinic faces a concerning downward trend in general procedure revenue and patient volume since its 2022 peak, despite positive cumulative growth.This financial instability is compounded by significant month-over-month revenue volatility, suggesting challenges in cash flow predictability. Furthermore, an alarming number of delayed appointments highlights a critical operational inefficiency impacting patient satisfaction and potentially overall service capacity.

![Revenues](https://github.com/user-attachments/assets/5f0bd38b-4752-4bd9-8ace-065f1d642a23)

