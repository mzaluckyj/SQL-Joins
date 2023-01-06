/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select P.name as product, C.name as category 
 from products as P
 inner join categories as C on C.CategoryID = P.CategoryID
 where C.name = 'computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select p.name, p.price, r.rating 
 from products as p
 inner join reviews as r on r.ProductID = p.ProductID
 where r.rating =5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName, e.LastName, Sum(s.Quantity) as total
from sales as s
inner join employees as e on e.employeeID = s.EmployeeID
group by e.EmployeeID
order by total desc limit 5;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.name 'Department Name', c.Name as 'Category Name' from departments as d
inner join categories as c on c.DepartmentID = d.DepartmentID
where c.name = 'Appliances' or c.name = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 select p.name, Sum(s.quantity) as 'Total Sold', Sum(s.quantity * s.PricePerUnit) as 'Total Price'
 from products as p
 inner join sales as s on s.ProductID = p.productID
 where p.productID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.name, r.Reviewer, r.rating, r.comment
from products as p
inner join reviews as r on r.ProductID = p.ProductID
where p.ProductID = 857 and r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select e.employeeID, e.FirstName, e.Lastname, p.name, Sum(s.quantity) as TotalSold
from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
inner join products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID;