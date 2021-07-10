USE music_shop;
DELIMITER $$
CREATE DEFINER = `root`@`localhost` PROCEDURE procedure2(IN inArgument1 int, IN inArgument2 varchar(30), IN inArgument3 datetime, IN inArgument4 bool, IN inCreatedBy int)
BEGIN
     DECLARE last_Id int;
     DECLARE variable1 varchar(20);
     DECLARE variable2 int;
     DECLARE done INT DEFAULT FALSE;
     DECLARE my_cur CURSOR FOR SELECT st1.some_field1, st2.some_field2
                              FROM some_table1 st1
                              JOIN some_table2 st2 ON st2.some_field=st1.some_field;
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
     INSERT INTO some_table (  Id,      Field1,      Field2,      Field3,     Field4,          createdAt,   createdBy)
                     VALUES (NULL, inArgument1, inArgument2, inArgument3, inArgument4, CURRENT_TIMESTAMP, inCreatedBy);
     COMMIT;    
     SET last_Id=LAST_INSERT_ID();
     
     OPEN my_cur;
     myLoop: LOOP
          FETCH my_cur INTO variable1, variable2;
          IF done THEN
               LEAVE myLoop;
          END IF;
          CALL procedure2(variable1, variable2);
     END LOOP;
     CLOSE my_cur;
     COMMIT; 
END$$
DELIMITER ;