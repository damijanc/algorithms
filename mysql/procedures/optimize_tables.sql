-- --------------------------------------------------------------------------------
-- OPTIMIZE_SCHEMA_TABLES
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `cms`.`OPTIMIZE_SCHEMA_TABLES` ( inSchemaName VARCHAR(999) )
BEGIN
        DECLARE vDynSQL    VARCHAR(999)   DEFAULT '';
        DECLARE vTableName VARCHAR(999)   DEFAULT '';
        DECLARE vDone      BOOLEAN        DEFAULT FALSE;

        DECLARE cDB_TABLES CURSOR
        FOR     SELECT DISTINCT TABLE_NAME
                FROM INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = CONVERT(inSchemaName USING utf8);

        DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET vDone=TRUE;

        OPEN cDB_TABLES;

        REPEAT 
                FETCH cDB_TABLES INTO vTableName;
                SET vDynSQL = CONCAT('OPTIMIZE TABLE ', inSchemaName, '.', vTableName);
                CALL EXECUTE_IMMEDIATE(vDynSQL);
                SET vDynSQL = '';
        UNTIL vDone END REPEAT;

        CLOSE cDB_TABLES;
END;
-- --------------------------------------------------------------------------------
-- Routine DDL
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`cms`@`localhost` PROCEDURE `EXECUTE_IMMEDIATE`(IN tSQLStmt TEXT)
BEGIN

        SET @executeImmediateSQL = tSQLStmt;

        PREPARE executeImmediateSTML FROM @executeImmediateSQL;

        EXECUTE executeImmediateSTML;

        DEALLOCATE PREPARE executeImmediateSTML;

END
