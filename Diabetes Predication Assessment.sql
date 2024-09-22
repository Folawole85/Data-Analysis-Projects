 Select *
From [Psyliq Internship].dbo.[Dataset$]

Select *
FROM Dataset$


--Patient_id and ages of all patients. 
Select Patient_id, D#O#B
From Dataset$

--Female patients who are olderthan 30.
Select Gender, Age
From Dataset$
Where Gender = 'Female' And Age > 30

--Average BMI of patients.
Select Avg(bmi) As Average_BMI
From Dataset$

--Patients in descending order of blood glucose levels.
Select Patient_id, blood_glucose_level
From Dataset$
Group by Patient_id, blood_glucose_level
Order by blood_glucose_level Desc

--Patients who have hypertension and diabetes.
Select Patient_id, hypertension, diabetes
From Dataset$
Where hypertension = 1 And diabetes = 1
Group by Patient_id, hypertension, diabetes

--Determine the number of patients with heart disease.
Select heart_disease, Count(heart_disease) Number_of_Patients_With_Heart_Disease
From Dataset$
Where heart_disease = 1
Group by heart_disease

--Group patients by smoking history and count how many smokers and nonsmokers there are.
Select smoking_history, Count(smoking_history) As Total_Patients
From Dataset$
Group by smoking_history

--Retrieve the Patient_id of patients who have a BMI greater than the average BMI.
Select Patient_id
From Dataset$
Where bmi > (Select Avg(bmi) 
From Dataset$)

--Patient with the highest HbA1c level and the patient with the lowest HbA1clevel.
--Patient with highest HbA1c level
Select Top 1 Patient_id, HbA1c_level
From Dataset$
Order by HbA1c_level Desc

--Patient with lowest HbA1c level
Select Top 1 Patient_id, HbA1c_level
From Dataset$
Order by HbA1c_level Asc

--10. Calculate the age of patients in years (assuming the current date as of now).
Select D#O#B, DATEDIFF(YEAR, D#O#B, GETDATE()) As Age
From Dataset$

Alter Table Dataset$
Add Age As DATEDIFF(YEAR, D#O#B, GETDATE()); 

Select Patient_id, Age
From Dataset$

--Patients rank by blood glucose level within each gender group.

Select Patient_id, gender, blood_glucose_level,
Rank() Over (Partition By gender Order by blood_glucose_level Desc) As Rank
From Dataset$

--Update the smoking history of patients who are olderthan 40 to "Ex-smoker".

Update [Psyliq Internship].dbo.[Dataset$]
Set smoking_history = 'Ex-smoker'
Where age > 40;

--Inserted a new patient into the database with sample data.

Insert into Dataset$ (
EmployeeName, Patient_id, gender, D#O#B, hypertension, heart_disease, smoking_history, bmi, HbA1c_level, blood_glucose_level, diabetes)
Values 
('John Doe', 'PT0000', 'Male', 2023-06-14, 0, 0, 'No info', 45.98, 7.9, 120, 0)

--Delete all patients with heart disease from the database.
Delete From Dataset$
Where heart_disease > 0;

--Patients who have hypertension but not diabetes using the EXCEPT operator.

Select *
From Dataset$
Where hypertension = 1
Except
Select *
From Dataset$
Where diabetes = 1;

--Define a unique constraint on the "patient_id" column to ensure its values are unique.
Alter Table Dataset$
Add Constraint unique_patient_id Unique (patient_id); 

--Create a view that displays the Patient_ids, ages, and BMI of patients.
Select patient_id, Age, bmi 
From Dataset$

