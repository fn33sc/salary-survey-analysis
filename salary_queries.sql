======================================================================================
SALARY SURVEY DATA ANALYSIS
-- SQL Queries
-- =======================================================

-- 1. Average Salary by Industry

SELECT 
  industry,
  COUNT(*) AS total_respondents,
  ROUND(AVG(annual_salary), 2) AS avg_salary
FROM `industryprojectdata.ProjDataSet1.Industry_datas`
WHERE currency_type = 'USD'
GROUP BY industry
HAVING COUNT(*) >= 10
ORDER BY avg_salary DESC;


-- 2. Salary by Years of Experience 

SELECT 
  years_of_experience,
  industry,
  COUNT(*) AS total_respondants,
  ROUND(AVG(annual_salary), 2) AS avg_salary
FROM `industryprojectdata.ProjDataSet1.ProjectDatas`
WHERE currency_type = 'USD'
AND annual_salary > 0 
GROUP BY years_of_experience, industry
HAVING COUNT(*) >= 10
ORDER BY years_of_experience, avg_salary DESC


-- 3. Salary by Education Level

SELECT 
  highest_education,
  COUNT(*) AS total_respondents,
  ROUND(AVG(annual_salary), 2) AS avg_salary,
  ROUND(MIN(annual_salary), 2) AS min_salary,
  ROUND(MAX(annual_salary), 2) AS max_salary
FROM `industryprojectdata.ProjDataSet1.ProjectDatas`
WHERE currency_type = 'USD'
AND annual_salary > 0
GROUP BY highest_education_level
HAVING COUNT(*) >= 10
ORDER BY avg_salary DESC;


-- 4. Salary by Gender 

SELECT 
  gender,
  COUNT(*) AS total_respondents,
  ROUND(AVG(annual_salary), 2) AS avg_salary,
  ROUND(MIN(annual_salary), 2) AS min_salary,
  ROUND(MAX(annual_salary), 2) AS max_salary
FROM `industryprojectdata.ProjDataSet1.ProjectDatas`
WHERE currency_type = 'USD'
AND annual_salary > 0
AND gender != 'Other'
AND gender != 'N/A'
GROUP BY gender
HAVING COUNT(*) >= 10
ORDER BY avg_salary DESC;


-- 5. Salary by Country

SELECT 
  country,
  COUNT(*) AS total_respondents,
  ROUND(AVG(annual_salary), 2) AS avg_salary,
  ROUND(MIN(annual_salary), 2) AS min_salary,
  ROUND(MAX(annual_salary), 2) AS max_salary
FROM `industryprojectdata.ProjDataSet1.ProjectDatas`
WHERE currency_type = 'USD'
AND annual_salary > 0
AND country_of_work != 'N/A'
GROUP BY country
HAVING COUNT(*) >= 5
ORDER BY avg_salary DESC
LIMIT 15;


-- 6. Salary by Ethnicity - Men 

SELECT 
  ethnicity,
  COUNT(*) AS total_respondents,
  ROUND(AVG(annual_salary), 2) AS avg_salary
FROM `industryprojectdata.ProjDataSet1.ProjectDatas`
WHERE currency_type = 'USD'
AND annual_salary > 0
AND annual_salary < 500000
AND ethnicity != 'Other'
AND ethnicity != 'N/A'
AND gender = 'Man'
GROUP BY ethnicity
HAVING COUNT(*) >= 10
ORDER BY avg_salary DESC;


-- 7. Salary by Ethnicity — Women

SELECT 
  ethnicity,
  COUNT(*) AS total_respondents,
  ROUND(AVG(annual_salary), 2) AS avg_salary
FROM `industryprojectdata.ProjDataSet1.ProjectDatas`
WHERE currency_type = 'USD'
AND annual_salary > 0
AND annual_salary < 500000
AND ethnicity != 'Other'
AND ethnicity != 'N/A'
AND gender = 'Woman'
GROUP BY ethnicity
HAVING COUNT(*) >= 10
ORDER BY avg_salary DESC;


-- 8. Salary by Ethnicity — Non-binary

SELECT 
  ethnicity,
  COUNT(*) AS total_respondents,
  ROUND(AVG(annual_salary), 2) AS avg_salary
FROM `industryprojectdata.ProjDataSet1.ProjectDatas`
WHERE currency_type = 'USD'
AND annual_salary > 0
AND annual_salary < 500000
AND ethnicity != 'Other'
AND ethnicity != 'N/A'
AND gender = 'Non-binary'
GROUP BY ethnicity
HAVING COUNT(*) >= 10
ORDER BY avg_salary DESC;


-- 9. Gender Pay Gap by Ethnicity

SELECT 
  ethnicity,
  ROUND(AVG(CASE WHEN gender = 'Man' THEN annual_salary END), 2) AS avg_male_salary,
  ROUND(AVG(CASE WHEN gender = 'Woman' THEN annual_salary END), 2) AS avg_female_salary,
  ROUND(AVG(CASE WHEN gender = 'Man' THEN annual_salary END) - AVG(CASE WHEN gender = 'Woman' THEN annual_salary END), 2) AS pay_gap
FROM `industryprojectdata.ProjDataSet1.ProjectDatas`
WHERE currency_type = 'USD'
AND annual_salary > 0
AND annual_salary < 500000
AND ethnicity != 'Other'
AND ethnicity != 'N/A'
AND gender IN ('Man', 'Woman')
GROUP BY ethnicity
HAVING COUNT(*) >= 10
ORDER BY pay_gap DESC;


-- 10. Salary by Job Title (Top 15)

SELECT 
  job_title,
  COUNT(*) AS total_respondents,
  ROUND(AVG(annual_salary), 2) AS avg_salary,
  ROUND(MIN(annual_salary), 2) AS min_salary,
  ROUND(MAX(annual_salary), 2) AS max_salary
FROM `industryprojectdata.ProjDataSet1.ProjectDatas`
WHERE currency_type = 'USD'
AND annual_salary > 0
AND annual_salary < 500000
AND job_title != 'N/A'
GROUP BY job_title
HAVING COUNT(*) >= 10
ORDER BY avg_salary DESC
LIMIT 15;


-- 11. Salary by US State (Top 15)

SELECT 
  us_state,
  COUNT(*) AS total_respondents,
  ROUND(AVG(annual_salary), 2) AS avg_salary,
  ROUND(MIN(annual_salary), 2) AS min_salary,
  ROUND(MAX(annual_salary), 2) AS max_salary
FROM `industryprojectdata.ProjDataSet1.ProjectDatas`
WHERE currency_type = 'USD'
AND annual_salary > 0
AND annual_salary < 500000
AND us_state != 'N/A'
AND us_state != 'Other'
GROUP BY us_state
HAVING COUNT(*) >= 10
ORDER BY avg_salary DESC
LIMIT 15;




