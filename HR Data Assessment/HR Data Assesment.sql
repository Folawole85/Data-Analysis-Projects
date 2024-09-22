Select *
From general_data$

Select *
From manager_survey_data$

Select *
From employee_survey_data$

--Joining Employee Survey Data Table and Manager Survey Data With General Data Table

--General Data and Employee Survey
Select *
From general_data$
	Join employee_survey_data$ 
	on general_data$.EmployeeID = employee_survey_data$.EmployeeID

--General Data and Manager Survey Data
Select *
From general_data$
	Join manager_survey_data$
	on general_data$.EmployeeID = manager_survey_data$.EmployeeID


--Total number of employees in the dataset.
Select Sum(EmployeeCount) Total_Number_of_Employees
From general_data$

--Unique job roles in the dataset.
Select Distinct(JobRole)
From general_data$

--Average age of employees.
Select Avg(Age) Average_Employees_Age
From general_data$

--Names and ages of employees who have worked at the company for more than 5 years.
 Select Emp_Name, Age, YearsAtCompany
 From general_data$
 Where YearsAtCompany > 5

 --Count of employees grouped by their department.
 Select Department, Sum(EmployeeCount) Count_of_Employees
 From general_data$
 Group by Department

--Employees who have 'High' Job Satisfaction.
Select Emp_Name, JobSatisfaction
From general_data$
	Join employee_survey_data$ 
	on general_data$.EmployeeID = employee_survey_data$.EmployeeID
Where JobSatisfaction > 3


--Highest Monthly Income in the dataset.
Select Top 1 MonthlyIncome
 From general_data$

 --Employees who have 'Travel_Rarely' as their BusinessTravel type.
 Select Emp_Name, BusinessTravel
  From general_data$
  Where BusinessTravel = 'Travel_Rarely'

  --Distinct MaritalStatus categories in the dataset.
  Select Distinct(MaritalStatus)
 From general_data$


  Select *
From general_data$


 --List of employees with more than 2 years of work experience but less than 4 years in their current role.
 Select Emp_Name, TotalWorkingYears, YearsAtCompany
  From general_data$
  Where TotalWorkingYears > 2 and YearsAtCompany < 4

 --Average distance from home for employees in each department. 
 Select Department, Avg(DistanceFromHome) Average_Distance_from_Home
 From general_data$
 Group by Department

 --Top 5 employees with the highest MonthlyIncome.
 Select Top 5 Emp_Name, MonthlyIncome
 From general_data$
 Order by MonthlyIncome Desc

--Percentage of employees who have had a promotion in the last year 
 Select YearSinceLastPromotion
 From general_data$
 Where YearSinceLastPromotion = 1

 --Employees with the highest and lowest EnvironmentSatisfaction. 

--Highest Envionment Satisfaction
  Select Emp_Name, EnvironmentSatisfaction
From general_data$
	Join employee_survey_data$ 
	on general_data$.EmployeeID = employee_survey_data$.EmployeeID
	Where EnvironmentSatisfaction = 4

--Lowest Envionment Satisfaction
  Select Emp_Name, EnvironmentSatisfaction
From general_data$
	Join employee_survey_data$ 
	on general_data$.EmployeeID = employee_survey_data$.EmployeeID
	Where EnvironmentSatisfaction = 1

 --16. Find the employees who have the same JobRole and MaritalStatus.
 Select Emp_Name, JobRole, MaritalStatus
 From general_data$
 Where JobRole = MaritalStatus

 --Employees with the highest TotalWorkingYears who also have a PerformanceRating of 4. 
Select Top 3 Emp_Name, TotalWorkingYears, PerformanceRating
From general_data$
	Join manager_survey_data$
	on general_data$.EmployeeID = manager_survey_data$.EmployeeID
Where PerformanceRating = 4 
Order by TotalWorkingYears Desc


 --Average Age and JobSatisfaction for each BusinessTravel type. 
  Select Distinct(BusinessTravel), JobSatisfaction, AVG(Age) Average_Age
From general_data$
	Join employee_survey_data$ 
	on general_data$.EmployeeID = employee_survey_data$.EmployeeID
Group By JobSatisfaction, BusinessTravel
Order by JobSatisfaction Asc


 --Most common EducationField among employees.
 Select Top 1 EducationField, Sum(EmployeeCount) Most_common_Education_Field
 From general_data$
 Group by EducationField
 Order by Sum(EmployeeCount) Desc

 --Employees who have worked for the company the longest but haven't had a promotion.
 Select Top 3 Emp_Name, YearsAtCompany, YearSinceLastPromotion
 From general_data$
 Where YearSinceLastPromotion = 0
 Order by YearsAtCompany desc


 


