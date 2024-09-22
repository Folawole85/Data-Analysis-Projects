Select *
From DataSet_I$

--Retrieve all columns for all records in the dataset.
Select *
From DataSet_I$

--Unique countries represented in the dataset 
Select Distinct(Country)
From DataSet_I$

--Names of all the customers on the 'Retail' channel.
Select Sub_Channel, Customer_Name
From DataSet_I$
Where Sub_channel = 'Retail'

--Total quantity sold for the ' Antibiotics' product class.
Select Product_Class, Sum(Quantity) As Total_Antibiotics_Product
From DataSet_I$
Where Product_Class = 'Antibiotics'
Group By Product_Class

--Distinct months present in the dataset.
Select Distinct(Month)
From DataSet_I$

--Total sales for each year.
Select Year, SUM(Sales) As Total_Sales_for_Each_Year
From DataSet_I$
Group by Year
Order By Year Asc

--Customer with the highest sales value.
Select Top 1 Customer_Name, Sum(Sales) As Customer_With_Highest_Sales_Value
From DataSet_I$
Group by Customer_Name, Sales
Order by Sales Desc

--Names of all employees who are Sales Reps and are managed by 'James Goodwill'.
Select Name_of_Sales_Rep, Manager
From DataSet_I$
Where Manager = 'James Goodwill'

--Number of Employees under James Goodwill
Select Manager, Count(Name_of_Sales_Rep) count_of_employees
From DataSet_I$
Where Manager = 'James Goodwill'
Group by Manager

--Top 5 cities with the highest sales.
Select Top 5 Sum(Sales) As Total_Sales, City As City_with_the_Highest_sales
From DataSet_I$
Group by City
Order by Sum(Sales) Desc

--Average price of products in each sub-channel.
Select Sub_channel, Avg(Price) As Average_Price
From DataSet_I$
Group by Sub_channel

--Join the 'Employees' table with the 'Sales' table to get the name of the Sales Rep and the corresponding sales records
--Since the Employee table is already joined with the Sales table, we will only need to retrieve the Sales reocrds

Select Name_of_Sales_Rep, Product_Name, Product_Class, Sum(Sales) As Total_Sales, Sum(Quantity) As Total_Quantity, Month, Year
From DataSet_I$
Group by Name_of_Sales_Rep, Product_Name, Product_Class, Month, Year
Order by Year Asc

Select *
From DataSet_I$

--Sales made by employees from ' Rendsburg ' in the year 2018.
Select City, Product_Name, Product_Class, Sum(Sales) As Total_Sales, Month, Year
From DataSet_I$
Where City = 'Rendsburg' and Year = 2019
Group by City, Product_Name, Product_Class, Month, Year

--Total sales for each product class, for each month, and order the results by year, month, and product class.
Select Sum(Sales) As Total_Sales, Product_Class, Month, Year
From DataSet_I$
Group by Year, Month, Product_Class
Order by Year, Month, Product_Class

--Top 3 sales reps with the highest sales in 2019. 
Select Top 3 Name_of_Sales_Rep, Sum(Sales) As Total_Sales, Year
From DataSet_I$
Where Year = 2019
Group by Name_of_Sales_Rep, Year
Order by Year Desc

--Monthly total sales for each sub-channel, and then calculate the average monthly sales for each sub-channel over the years.
Select Month, Sum(Sales) As Total_Sales, Sub_Channel, Avg(Sales) As Average_Sales, Year
From DataSet_I$
Group by Month, Sub_channel, Year
Order by Year Asc

--Summary report that includes the total sales, average price, and total quantity sold for each product class.
Select Product_Class, Sum(Sales) As Total_Sales, Avg(Price) As Average_Price, Sum(Quantity) As Total_Quantity_Sold
From DataSet_I$
Group by Product_Class
Order by Product_Class Asc

--Top 5 customers with the highest sales for each year.

--2017
Select Top 5 Customer_Name, Sum(Sales) As Total_Sales, Year
From DataSet_I$
Where Year = 2017
Group by Customer_Name, Year
Order by Sum(Sales) Desc

--2018
Select Top 5 Customer_Name, Sum(Sales) As Total_Sales, Year
From DataSet_I$
Where Year = 2018
Group by Customer_Name, Year
Order by Sum(Sales) Desc

--2019
Select Top 5 Customer_Name, Sum(Sales) As Total_Sales, Year
From DataSet_I$
Where Year = 2019
Group by Customer_Name, Year
Order by Sum(Sales) Desc

--2020
Select Top 5 Customer_Name, Sum(Sales) As Total_Sales, Year
From DataSet_I$
Where Year = 2020
Group by Customer_Name, Year
Order by Sum(Sales) Desc

Select *
From Sheet1$

--Year-over-year growth in sales for each country.
Select Country, Year, Sum(Sales) As Total_Sales
From DataSet_I$
Group by Country, Year

--Months with the lowest sales for each year
--2017
Select Top 3 Sum(Sales) As Total_Sales,  Month, Year
From DataSet_I$
Where Year = 2017
Group by Month, Year
Order by Sum(Sales) Asc

--2018
Select Top 3 Sum(Sales) As Total_Sales, Month,  Year
From DataSet_I$
Where Year = 2018
Group by Month, Year
Order by Sum(Sales) Asc

--2019
Select Top 3 Sum(Sales) As Total_Sales, Month,  Year
From DataSet_I$
Where Year = 2019
Group by Month, Year
Order by Sum(Sales) Asc

--2020
Select Top 3 Sum(Sales) As Total_Sales, Month, Year
From DataSet_I$
Where Year = 2020
Group by Month, Year
Order by Sum(Sales) Asc

--Total sales for each sub-channel in each country, and then find the country with the highest total sales for each sub-channel

--Total Sales for Each Sub_channel in the Country
Select Country, Sub_channel, Sum(Sales) AS Total_Sales
From DataSet_I$
Group by Country, Sub_channel

--Country with the Highest Total Sales for each Sub_channel

--Sub_channel (Government)
Select Top 1 Country, Sub_channel, Sum(Sales) AS Total_Sales
From DataSet_I$
Where Sub_channel = 'Government'
Group by Country, Sub_channel

--Sub_channel (Institution)
Select Top 1 Country, Sub_channel, Sum(Sales) AS Total_Sales
From DataSet_I$
Where Sub_channel = 'Institution'
Group by Country, Sub_channel

--Sub_channel (Retail)
Select Top 1 Country, Sub_channel, Sum(Sales) AS Total_Sales
--From Sheet1$
From DataSet_I$
Where Sub_channel = 'Retail'
Group by Country, Sub_channel











