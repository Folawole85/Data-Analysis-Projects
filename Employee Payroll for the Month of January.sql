Create Table Employee_Payroll_for_the_Month_January (
First_Name varchar(50),
Last_Name varchar(50),
Hourly_wage Decimal(5,3),
Hours_Worked_for_1st_Jan int,
Hours_Worked_for_8th_Jan int,
Hours_Worked_for_15th_Jan int,
Hours_worked_for_22nd_Jan int,
Hours_worked_for_29th_Jan int,
Overtime_hours_1st_Jan int,
Overtime_hours_8th_Jan int,
Overtime_hours_15th_Jan int,
Overtime_hours_22nd_Jan int,
Overtime_hours_29th_Jan int)

Select *
From Employee_Payroll_for_the_Month_January

Insert Into Employee_Payroll_for_the_Month_January Values
('John', 'Adams', 23.32,43,40,41,45,42,3,4,1,5,3),
('James', 'Junior', 30.45,34,35,32,33,41,3,4,3,3,4),
('Joy', 'Peace', 40.25,44,25,42,33,51,2,4,5,3,4),
('Thomas', 'Joann', 30.40,34,35,32,33,41,3,4,3,3,4),
('Ayo', 'Shallom', 40.45,37,32,34,33,41,3,4,3,3,4),
('Laurel', 'Victor', 42.45,44,45,42,43,41,2,1,2,3,4),
('Jennifer', 'Happy',37.45,39,42,45,43,41,3,4,5,3,4),
('Samuel', 'David', 40.45,44,45,39,39,40,1,1,1,1,1),
('Funmi', 'Baba', 40.45,42,43,42,40,41,2,2,2,2,2),
('Odun', 'Amina', 30.45,34,35,32,33,41,3,4,3,3,4)



SELECT *
FROM Employee_Payroll_for_the_Month_January

--Calculating the Pay

Alter Table Employee_Payroll_for_the_Month_January
	Add
Pay_1st_Jan Decimal(6,2),
Pay_8th_Jan Decimal(6,2),
Pay_15th_Jan Decimal(6,2),
Pay_22nd_Jan Decimal(6,2),
Pay_29th_Jan Decimal(6,2);

Update Employee_Payroll_for_the_Month_January
SET
Pay_1st_Jan = Hourly_wage * Hours_Worked_for_1st_Jan

Update Employee_Payroll_for_the_Month_January
SET
Pay_8th_Jan = Hourly_wage * Hours_Worked_for_8th_Jan

Update Employee_Payroll_for_the_Month_January
SET
Pay_15th_Jan = Hourly_wage * Hours_Worked_for_15th_Jan

Update Employee_Payroll_for_the_Month_January
SET
Pay_22nd_Jan = Hourly_wage * Hours_worked_for_22nd_Jan

Update Employee_Payroll_for_the_Month_January
SET
Pay_29th_Jan =Hourly_wage * Hours_worked_for_22nd_Jan

--Calaculating the Overtime Bonus

Alter Table Employee_Payroll_for_the_Month_January
	Add
Overtime_Bonus_1st_Jan Decimal(6,2),
Overtime_Bonus_8th_Jan Decimal(6,2),
Overtime_Bonus_15th_Jan Decimal(6,2),
Overtime_Bonus_22nd_Jan Decimal(6,2),
Overtime_Bonus_29th_Jan Decimal(6,2);

Update Employee_Payroll_for_the_Month_January
SET
Overtime_Bonus_1st_Jan = 0.5 * Hourly_wage * Overtime_hours_1st_Jan

Update Employee_Payroll_for_the_Month_January
SET
Overtime_Bonus_8th_Jan = 0.5 * Hourly_wage * Overtime_hours_8th_Jan

Update Employee_Payroll_for_the_Month_January
SET
Overtime_Bonus_15th_Jan = 0.5 * Hourly_wage * Overtime_hours_15th_Jan

Update Employee_Payroll_for_the_Month_January
SET
Overtime_Bonus_22nd_Jan = 0.5 * Hourly_wage * Overtime_hours_22nd_Jan

Update Employee_Payroll_for_the_Month_January
SET
Overtime_Bonus_29th_Jan = 0.5 * Hourly_wage * Overtime_hours_29th_Jan

--Calculating the Total Paid for each Week during the Month of January

Select *
From Employee_Payroll_for_the_Month_January

Alter Table Employee_Payroll_for_the_Month_January
Add
Total_1st_Jan Decimal(6,2),
Total_8th_Jan Decimal(6,2),
Total_15th_Jan Decimal(6,2),
Total_22nd_Jan Decimal(6,2),
Total_29th_Jan Decimal(6,2);

Update Employee_Payroll_for_the_Month_January
SET
Total_1st_Jan = Pay_1st_Jan + Overtime_Bonus_1st_Jan

Update Employee_Payroll_for_the_Month_January
SET
Total_8th_Jan = Pay_8th_Jan + Overtime_Bonus_8th_Jan

Update Employee_Payroll_for_the_Month_January
SET
Total_15th_Jan = Pay_15th_Jan + Overtime_Bonus_15th_Jan

Update Employee_Payroll_for_the_Month_January
SET
Total_22nd_Jan = Pay_22nd_Jan + Overtime_Bonus_22nd_Jan

Update Employee_Payroll_for_the_Month_January
SET
Total_29th_Jan = Pay_29th_Jan + Overtime_Bonus_29th_Jan

--Total Amount Paid to Each Employee Throughout the Month of January

Select *
From Employee_Payroll_for_the_Month_January

Alter Table Employee_Payroll_for_the_Month_January
Add
January_Pay Decimal(6,2);

Update Employee_Payroll_for_the_Month_January
Set
January_Pay = Total_1st_Jan + Total_8th_Jan + Total_15th_Jan + Total_22nd_Jan + Total_29th_Jan

Select *
From Employee_Payroll_for_the_Month_January
Order by January_Pay Desc

Select *
From Employee_Payroll_for_the_Month_January
Order by January_Pay Asc