-- --------------------------------------------------------------------------------
-- Routine DDL
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`schema`@`localhost` PROCEDURE `split`(input text, delim VARCHAR(10))
begin

    declare foundPos tinyint unsigned;
    declare tmpTxt text;
    declare delimLen tinyint unsigned;
    declare element text;

    drop temporary table if exists tmpValues;
    create temporary table tmpValues
    (
        `values` varchar(256) not null default ''
    ) engine = memory;

    set delimLen = length(delim);
    set tmpTxt = input;

    set foundPos = instr(tmpTxt,delim);
    while foundPos <> 0 do
        set element = substring(tmpTxt, 1, foundPos-1);
        set tmpTxt = replace(tmpTxt, concat(element,delim), '');
        insert into tmpValues (`values`) values ( element);
        set foundPos = instr(tmpTxt,delim);
    end while;

    if tmpTxt <> '' then
        insert into tmpValues (`values`) values (tmpTxt);
    end if;

    -- select * from tmpValues;
END
