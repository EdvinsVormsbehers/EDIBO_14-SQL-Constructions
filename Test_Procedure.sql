USE music_shop;
DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `get_invoices_by_empl`(IN inEmplId INT, IN inYear varchar(4), IN inMonth varchar(2), OUT outTotal DEC(10,2))
BEGIN
   SET @filtr = concat('%',inYear,'-',inMonth,'-%');
   SELECT EmployeeId, CustomerId, InvoiceId, InvoiceDate, Total
		FROM employees em
		JOIN customers c ON em.EmployeeId=c.SupportRepId
		JOIN invoices inv ON c.CustomerId=inv.CustomerId
		WHERE em.EmployeeId=inEmplId
		AND InvoiceDate LIKE @filtr
		ORDER BY InvoiceDate ASC;
   SET outTotal=(SELECT sum(Total)
				FROM employees em
				JOIN customers c ON em.EmployeeId=c.SupportRepId
				JOIN invoices inv ON c.CustomerId=inv.CustomerId
				WHERE em.EmployeeId=inEmplId
				AND InvoiceDate LIKE @filtr
				ORDER BY InvoiceDate ASC);
END$$
DELIMITER ; 

#SET @totalToFill = 0;
#CALL get_invoices_by_empl(3,'2013','01',@totalToFill);
#SELECT @totalToFill;
