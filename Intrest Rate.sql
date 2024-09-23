
Create Table Interest_Rate 
(
Loan_Type Varchar(50),
Principal int,
Interest_Rate int,
Month int
)

Select *
From Interest_Rate 

Insert Into Interest_Rate Values
('Loan A', 10500, 10, 12),
('Loan B', 5000, 5, 10),
('Loan C', 20000, 4, 5),
('Loan D', 13000, 7, 9),
('Loan E', 17000, 15, 4),
('Loan F', 24000, 8, 3)


--Calculating the Interest Paid for Each Loan

Alter Table Interest_Rate
Add
Interest_Paid int;

Update Interest_Rate
Set
Interest_Paid = (Principal * Interest_Rate) / 100


--Calculating Total Loan Paid

ALter Table Interest_Rate
Add 
Total_Loan_Paid int;

Update Interest_Rate
SET
Total_Loan_Paid = Principal + Interest_Paid


--Calculating Monthly Payments 

Alter Table Interest_Rate
Add
Monthly_Payments Decimal(6,2);

Update Interest_Rate
Set
Monthly_Payments = Total_Loan_Paid / Month 

--Final Result

Select *
From Interest_Rate