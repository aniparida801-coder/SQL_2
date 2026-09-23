use [Project-2_Makreting_Bank]
select * from bank;

select 
sum(case when age is null then 1 else 0 end) as age_missing,
sum(case when job is null then 1 else 0 end) as job_missing,
sum(case when marital is null then 1 else 0 end) as marital_missing,
sum(case when education is null then 1 else 0 end) as education_missing,
sum(case when balance is null then 1 else 0 end) as balance_missing,
sum(case when housing is null then 1 else 0 end) as housing_missing,
sum(case when loan is null then 1 else 0 end) as loan_missing,
sum(case when contact is null then 1 else 0 end) as contact_missing,
sum(case when day is null then 1 else 0 end) as day_missing,
sum(case when month is null then 1 else 0 end) as month_missing,
sum(case when duration is null then 1 else 0 end) as duration_missing,
sum(case when campaign is null then 1 else 0 end) as compaign_missing,
sum(case when pdays is null then 1 else 0 end) as pdays_missing,
sum(case when previous is null then 1 else 0 end) as previous_missing,
sum(case when poutcome is null then 1 else 0 end) as poutcome_missing,
sum(case when deposit is null then 1 else 0 end) as deposit_missing
from bank;

-- aggregate functions :
--sum
select sum(balance) as total_balance from bank;
--count 
--count(*) counts the total rows in the table 
select count(*) as total_rows from bank;
-- when you mention any column then it shows the number of rows in that column 
select count(month) as total_rows from bank;
--max
select max(balance) as max_Sales from bank;
--min
select min(balance) as min_Sales from bank;
--avergae 
select avg(balance) as avg_Sales from bank;

-- operators 
--arthemetic operators 
--+,-,*,/,%
-- calculate the total cost 
select 
age,
balance,
[day],
balance*[day] as total_cost 
from bank;
-- multiplication operator is used here 
-- additon 
select  
age ,
balance,
balance+1000 as increse_Amount
from bank;

--subtraction 
select  
job,
age ,
balance,
balance-300 as Tota_amount
from bank;
--divison 
select  
job ,
balance,
balance/2 as new_balance
from bank;

-- compariosn operators (>)
select * from bank where balance>35000;
--(<)
select age,job,balance from bank where balance<5000;
--equal 
select job,age,balance from bank where balance=45;

select count(*) as Promotion from bank
--not equal (<>)
select * from bank where campaign<>1;
--logical operators 
--and -- returns true when both conditions are true
select * from zara where Promotion=1 and Seasonal=1;
select * from zara where Product_Position='Aisle' and Seasonal=1;

--OR -- returns true if any one statement is also true 
select * from bank where marital='married' OR marital='single';
select * from bank where day=6 or day=7;
--not 
select * from bank where not education='secondary';
-- between 
select * from bank where balance between 12000 and 15000;
--IN 
select * from bank where job in ('admin.','management');
--not in 
select * from bank where  job not in  ('admin.');
--like operator --logical operator 
select * from bank where marital like 'single';
select * from bank where duration like 756;

-- 1. View top 10 rows
SELECT * FROM bank limit 100;

-- 2. Find the average account balance by job category
select job, ROUND(AVG(balance), 2) AS avg_balance
from bank
group BY job
order BY avg_balance DESC;

-- 3. Count total customers and success rate of term deposits by education level
select 
    education, 
    count(*) AS total_customers,
    sum(CASE WHEN deposit = 'yes' then 1 ELSE 0 END) as subscribed_count,
    round(sum(CASE WHEN deposit = 'yes' then 1 ELSE 0 END) * 100.0 / count(*), 2) as success_percentage
from bank
group by  education
order by success_percentage DESC;

-- 4. Find customers with balance higher than the overall average balance
select age, job, balance, deposit
from bank
where balance > (select avg(balance) from bank)
order by balance DESC;

-- 5. Analyze deposit subscriptions based on housing and personal loans
select 
    housing, 
    loan, 
    count(*) as customer_count,
    sum(case when deposit = 'yes' THEN 1 ELSE 0 END) as deposits_won
FROM bank
group by housing, loan;


--GROUP BY--
select marital, count(job)
from bank
group by marital;

select education,
       MIN(balance) AS minimum_balance,
       MAX(balance) AS maximum_balance
from bank
group by education;

-- subqueries /nested queries in sql

-- jobs duration  more than the avergae balance 
select avg(balance) as avg_balance
from bank;

select * from bank
where balance >(
select avg(balance)
from bank
);

select balance,
sum(balance) over () as balance_charges 
from bank;

