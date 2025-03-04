SELECT 
    *
FROM
    test_train.employee_attrition_dataset_10000; 
SELECT 
    *
FROM
    employee_attrition_dataset
WHERE
    employee_id IS NULL;
    describe employee_attrition_dataset; -- checking null values
 SELECT 
    employee_id, COUNT(*)
FROM
    employee_attrition_dataset
GROUP BY Employee_ID
HAVING COUNT(*) > 1; -- checking duplicates
alter table employee_attrition_dataset
add column Attritions int8; -- Adding Column
UPDATE employee_attrition_dataset 
SET 
    attritions = CASE
        WHEN attrition = 'yes' THEN 1
        WHEN attrition = 'no' THEN 0
    END; -- updating Values
    
-- ***Questions***
Question : 1 
select Department, round(sum(attritions)/count(employee_id) * 100, 1) as Attrition_Rate, 
rank() over(order by sum(attritions)/count(employee_id) * 100 desc) as rnk
from employee_attrition_dataset
group by 1;
Question : 2
select  job_role, round(avg(monthly_income), 1) as avg_monthly_income, 
dense_rank() over(order by avg(Monthly_Income) desc) as rnk 
from  employee_attrition_dataset
group by 1;
Question : 3
select Marital_Status , round(avg(job_satisfaction), 2) as avg_job_satisfaction_score,
dense_rank() over (order by avg(job_satisfaction) desc)  as rnk
from employee_attrition_dataset
group by 1;
Question : 4
SELECT 
    department,
    ROUND(AVG(training_hours_last_year), 2) AS avg_traning_hours
FROM
    employee_attrition_dataset
GROUP BY 1
ORDER BY department DESC
LIMIT 3;
Question :5
SELECT 
    employee_id
FROM
    employee_attrition_dataset
WHERE
    job_satisfaction < 3
        AND overtime = 'yes';
Question : 6
SELECT 
    job_level, AVG(years_at_company) AS avg_years_at_company
FROM
    employee_attrition_dataset
GROUP BY 1;
Question : 7
SELECT 
    Department, AVG(distance_from_home) as avg_distance_from_home
FROM
    employee_attrition_dataset
GROUP BY 1;
Question : 8
SELECT 
    employee_id
FROM
    employee_attrition_dataset
WHERE
    Job_Satisfaction < 3
        AND Work_Life_Balance < 3
        AND Performance_Rating < 3;
Question : 9
SELECT 
    department,
    gender,
    AVG(training_hours_last_year) AS avg_training_hours
FROM
    employee_attrition_dataset
GROUP BY 1 , 2
ORDER BY department;

   -- ***end****
