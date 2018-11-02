USE vspg;

/*
DELIMITER //
CREATE PROCEDURE dowhile()
BEGIN
    SET @i = 0;
    WHILE @i < 256 DO
        SET @i = @i + 1;
        SELECT REGEXP_REPLACE(LPAD(HEX(@i), 6, '0'), '^(\\w\\w)(\\w\\w)(\\w\\w)$', '\\1:\\2:\\3');
    END WHILE;
END
//
DELIMITER ;

CALL dowhile;
DROP PROCEDURE dowhile;
*/
