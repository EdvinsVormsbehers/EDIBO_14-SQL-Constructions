USE music_shop;
DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE `get_invoices_by_empl`(IN inEmplId INT, IN inYear varchar(4), IN inMonth varchar(2), OUT outTotal DEC(10,2))
BEGIN
   SET @filtr = concat('%',inYear,'-',inMonth,'-%');
   SELECT pkEmployeeId, pkCustomerId, pkInvoiceId, InvoiceDate, Total
		FROM employees em
		JOIN customers c ON em.pkEmployeeId=c.fkSupportRepId
		JOIN invoices inv ON c.pkCustomerId=inv.fkCustomerId
		WHERE em.pkEmployeeId=inEmplId
		AND InvoiceDate LIKE @filtr
		ORDER BY InvoiceDate ASC;
   SET outTotal=(SELECT sum(Total)
				FROM employees em
				JOIN customers c ON em.pkEmployeeId=c.fkSupportRepId
				JOIN invoices inv ON c.pkCustomerId=inv.fkCustomerId
				WHERE em.pkEmployeeId=inEmplId
				AND InvoiceDate LIKE @filtr
				ORDER BY InvoiceDate ASC);
END$$
DELIMITER ; 

#SET @totalToFill = 0;
#CALL get_inoices_by_empl(3,'2013','01',@totalToFill);
#SELECT @totalToFill;