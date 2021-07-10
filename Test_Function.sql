USE music_shop;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `InvoiceTotalAudit`(inInvoiceId int) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
DECLARE AuditTotalVar decimal(10,2);
SELECT sum(ii.Quantity * ii.UnitPrice) as AuditTotal
FROM invoices i
	JOIN invoice_items ii ON ii.fkInvoiceId = i.pkInvoiceId
	JOIN tracks t ON t.pkTrackId = ii.fkTrackId
	JOIN media_types md ON md.pkMediaTypeId = t.fkMediaTypeId
	JOIN genres g ON g.pkGenreId = t.fkGenreId
	JOIN albums al ON al.pkAlbumId = t.fkAlbumId
	JOIN artists ar ON ar.pkArtistId = al.fkArtistId
	WHERE i.pkInvoiceId = inInvoiceId INTO @AuditTotalVar;
RETURN (@AuditTotalVar);
END$$
DELIMITER ;