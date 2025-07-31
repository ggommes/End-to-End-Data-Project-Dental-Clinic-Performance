# Project Background

I was a dentist and co-owner of a dental clinic in Lajeado, Brazil. Which has been providing comprehensive dental care for six years. The clinic’s business model is built on a broad range of services, with orthodontics (braces) as a key revenue driver due to its recurring monthly income from patient consultations. Implant rehabilitations represent the highest-value procedures, complemented by a wide range of general dentistry services. This project was made to analyze data and metrics from 2020 to 2025 and provide actionable insights and recommendations to the continuing partners.

Based on the extracted data and the clinic's operational context, this analysis will deliver insights and recommendations across four critical areas:

- **Revenue & Patient Trends Over Time:** - Evaluation of historical revenue and patient volume patterns, focusing on annual and monthly performance for general procedures and orthodontic patients.
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
  
![Untitled Diagram (3)](https://github.com/user-attachments/assets/75ec0e43-c64b-4b90-bcaf-c547b82fbeb5)

 **The SQL queries used to inspect and clean the raw data for this analysis can be found within this repository.**

# Executive Summary

The clinic faces a concerning downward trend in general procedure revenue and patient volume since its 2022 peak, despite positive cumulative growth.This financial instability is compounded by significant month-over-month revenue volatility, suggesting challenges in cash flow predictability. Furthermore, an alarming number of delayed appointments highlights a critical operational inefficiency impacting patient satisfaction and potentially overall service capacity.

![revenue_and_patients_trends](https://github.com/user-attachments/assets/bca432d0-4440-4816-ab69-044e8277066e)


# Insights Deep Dive
### Growth Trajectory: From Resilient Launch to Post-2022 Challenges.
- **With operations beginning in February 2020, the clinic started with promising revenue, demonstrating its potential.** However, the "Revenue by Month" graph clearly illustrates an immediate drop in revenue in the months following February 2020 ( March to May), a direct reflection of the initial impact of the COVID-19 pandemic and lockdown measures.Despite this challenging start, the clinic showed remarkable resilience, achieving strong traction and continuous growth in both revenue and patient volume from mid-2020 onwards, which culminated in a notable peak performance in 2022. In that year, general procedure revenue reached R$ 141.021,00 in January.

- **Contrasting with this initial success, starting in early 2023, the data reveals a clear deceleration and subsequent continuous downward trend in general procedure revenue and patient volume.** While the drastic reduction in 2024, with general procedure revenue falling to R$ 1.046,00 – representing a 99,26% reduction from the 2022 peak – was significantly impacted by the closure of the clinic in April and May for structural renovations, it's important to note that a strong decline trend in revenue was already being observed in the months prior to this temporary closure.

- **The subsequent decline post-2022, exacerbated by the temporary closure for renovations, suggests that the growth strategies that worked during the traction phase may no longer be effective in sustaining volume.** This indicates an exhaustion of demand or a failure to continuously renew the patient base for general procedures, requiring a re-evaluation of market and operational approaches.


<img width="1448" height="799" alt="revenue_ _growth_over_time" src="https://github.com/user-attachments/assets/73a6b288-6e4a-49fe-95b2-8ac1393c59e3" />



### Consistent Growth of the Orthodontic Base Counteracting General Instability.
- **In contrast to general procedures overall performance,** the number of new orthodontic treatments has shown a more stable and positive growth trajectory, consistently contributing to the clinic's recurring revenue. The number of new installations grew from 483 in 2020 to 1148 in 2022, reaching 1578 in 2024. Orthodontic patients visit the clinic monthly for follow-up appointments, generating a consistent and predictable stream of recurring monthly payments .The revenue generated specifically from orthodontic treatments follow-ups has remained resilient, representing a growing share of the total monthly revenue.

- **This segment appears less susceptible to the fluctuations affecting general procedures**,due to the long-term commitment and installment payment structure inherent to orthodontic treatment.

- **Orthodontics acts as a pillar of financial stability and cash flow predictability**, validating its strategic importance to the business model due to its recurring nature.

 <img width="1417" height="370" alt="orthodontic_treatments_revenue" src="https://github.com/user-attachments/assets/7879bf60-3011-42e2-af86-7bd32cb189ed" />

### Monthly Revenue Variation Reveals Seasonality and Predictability Challenges
- **Month-over-month analysis reveals high volatility in total revenue**, with significant variations during the years. For example, total revenue in November 2022 was R$ 112.256,00 but dropped to R$ 65.438,00 in December — a decrease of 41.7%. 

- **Seasonal patterns are evident,** with months like August and November consistently showing higher revenues, while February and April stand out as the lowest-performing months

- **These fluctuations make cash flow less predictable**, which can challenge financial planning and limit our ability to invest confidently

![revenue seasonality](https://github.com/user-attachments/assets/68222f58-2862-4b75-9ad0-8a794f15619e)

### General Procedures: Declining New Patient Volume
- **The volume of new initial consultations or evaluations for general procedures (excluding orthodontic installations) has consistently decreased**. In May 2021, 156 new general consultations were registered, dropping to 16 in June 2025, a 89.7%. reduction.

- **This decline is a strong indicator** that current patient acquisition strategies for non-orthodontic procedures are losing effectiveness or that there is a bottleneck in conversion.

- **Additionally, an alarming number of delayed appointments, as highlighted in the Executive Summary, is a critical operational inefficiency impacting patient satisfaction** This issue may be contributing to the decline in new patient volume, as community perceptions spread.

![22222](https://github.com/user-attachments/assets/7cb48815-b24f-4c1b-9d31-f70a3fad9919)

# Recommendations
Based on the insights and findings above, it's recommended to the continuos partners to consider the following:

* With significant deceleration and continuous downward trend in general procedure revenue and patient volume since early 2023. It's crucial to develop and implement targeted marketing campaigns to re-engage past patients and attract new ones specifically for general dentistry, with a strong emphasis on high-value procedures like dental implants.
* Given the inherent recurrency of orthodontic treatments, it is strategically imperative not only to maintain but expand this patient base to ensure a predictable and stable cash flow for the business. This involves increasing investment in digital marketing and lead generation efforts, as well as exploring strategic partnerships (with schools for exemple) specifically for orthodontic treatments, emphasizing their long-term benefits and predictable payment structures.
* In order to mitigate the high monthly revenue volatility, characterized by significant peaks and troughs throughout the year, it is recommend implementing strategic promotional campaigns during historically low-revenue months and optimizing scheduling to maximize clinic capacity utilization during peak periods. Additionally, consider loyalty programs to encourage consistent patient flow. Furthermore, it is crucial to establish a clear and standardized pricing strategy, specifically targeting a reduction in month-over-month revenue variance.
* A large number of delayed appointments represents a critical operational inefficiency. Given that a significant contributing factor is the high volume of patients seen daily by dentists within limited consultation time, it is essential to re-evaluate appointment durations and dentist schedules to ensure realistic allocation for each procedure. While patient tardiness contributes, optimizing internal scheduling is paramount to improve patient flow and overall efficiency.

# Limitations
These are factors that were not (or could not be) fully accounted for, or limitations inherent to the data/analysis that might influence conclusions:

* The analysis is purely internal to the clinic. It does not incorporate external market dynamics such as local competition ( new clinics opened, competitor pricing strategies in Lajeado), broader economic shifts affecting consumer spending on dental services, or specific industry trends beyond what is reflected in the clinic's own data. These factors could significantly influence the observed revenue and patient trends.
* While quantitative trends (consultation declines, conversion rates, delayed appointments) were identified, the analysis does not incorporate qualitative data from patient surveys, feedback, or detailed staff interviews. This limits a deeper understanding of the "why" behind patient drop-offs, low conversion rates, or specific reasons for delays (patient satisfaction with initial consultation, specific pain points in the scheduling process).


