USE music_shop;
SELECT 'CREATE TRIGGER before_insert_Artists_only_unique_values' AS '';
DELIMITER $$
CREATE TRIGGER before_insert_Artists_only_unique_values
     BEFORE INSERT ON Artists FOR EACH ROW
     BEGIN
          IF NEW.Name IN (SELECT Name FROM Artists) THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Iearakstu nevar izveidot - tāds izpildītājs jau eksistē!';
          END IF;
     END;$$
DELIMITER ;
#DROP TRIGGER before_insert_Artists_only_unique_values;