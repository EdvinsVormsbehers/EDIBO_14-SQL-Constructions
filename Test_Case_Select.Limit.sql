SELECT FirstName, case City
                 when 'Calgary' then 'From Calgary'
                 when 'Edmonton' then 'From Edmonton'
                 else 'From Space'
                 end as Location

FROM employees
ORDER BY Location;
# Shows data from column FirstName and changed data from column city in new column Location.

SELECT CustomerId,
 case 
  when Total < 2 then 'Small purchase'
  when Total < 7 then 'Average'
  else 'Good one'
  end Purchase_volume
FROM invoices
ORDER BY Purchase_volume;
#Same construction method as above but uses <>= this time.

SELECT LastName, FirstName, Title
FROM employees
WHERE City = 'Calgary'
ORDER BY LastName
Limit 3;
#Shows LastName, FirstName,Title data from employees table for entities where city=Calgary. Limit shows- how many entries will be shown.ORDER BY can be ASC (Ascending) or DESC (Descending) order.










