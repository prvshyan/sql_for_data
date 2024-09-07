# Introduction
📊 dive into the data job market! Focusing on data analyst roles, This project explores 💰 top-paying jobs, 🔥 in-demand skills, And 📈 where high demand meets high salary in data analytics.

🔍 SQL queries? Check them out here: [project_sql folder](/project_sql/)
# background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?
2. What skills are requaired for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?
# Tools I Used
For my deep dive into data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the data base and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collabration and project tracking.
# The Analysis
Each qeury for this project aimed at investigating specific aspects of the data analyst job market.
Here's how I approached each question:

### 1. Top Paying Data Analyst jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.
```sql
SELECT 
 job_id,
 job_title,
 job_location,
 job_schedule_type,
 salary_year_avg,
 job_posted_date,
 name AS company_name
FROM 
 job_postings_fact 
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
 job_title_short = 'Data Analyst' AND 
 job_location = 'Anywhere' AND 
 salary_year_avg IS NOT NULL 
ORDER BY salary_year_avg DESC
LIMIT 10 
```
Here's the breakdown of the top data analyst jobs in 2023:
- **Wide Salary Range:** Top 10 paying data analyst job roles span from $184,000 to $650,000, indicating significant salary potential in the filed.
- **Diverse Employers:** Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a board interest across different industries.
- **Job Title Variety:** There's high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.




