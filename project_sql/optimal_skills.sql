WITH skills_demand AS (
    SELECT skills_dim.skills, skills_dim.skill_id,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN 
        skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
    INNER JOIN 
        skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND job_work_from_home = TRUE AND salary_year_avg IS NOT NULL
    GROUP BY 
        skills_dim.skill_id, skills_dim.skills
), 
average_salary AS (
    SELECT skills_dim.skills, skills_dim.skill_id,
    ROUND(AVG(salary_year_avg)) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
    -- AND job_work_from_home = TRUE
    GROUP BY 
    skills_dim.skill_id, skills_dim.skills
)
SELECT skills_demand.skill_id,
    demand_count,
    skills_demand.skills,
    avg_salary
FROM skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY avg_salary DESC,demand_count DESC
LIMIT 25