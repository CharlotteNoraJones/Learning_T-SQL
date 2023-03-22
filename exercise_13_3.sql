USE AdventureWorks2019;
GO

DROP FUNCTION IF EXISTS dbo.fn_AddTwoNumbers;
DROP FUNCTION IF EXISTS dbo.fn_RemoveNumbers;
DROP FUNCTION IF EXISTS dbo.fn_FormatPhone;
GO

CREATE FUNCTION dbo.fn_AddTwoNumbers(@num1 INT, @num2 INT) RETURNS INT BEGIN
    RETURN @num1 + @num2;
END;
GO

PRINT dbo.fn_AddTwoNumbers(5, 6);
GO

CREATE FUNCTION dbo.fn_RemoveNumbers(@inputString VARCHAR(250)) RETURNS VARCHAR(250) BEGIN
    DECLARE @count INT = 1;
    Declare @newString VARCHAR(250) = '';

    WHILE @count <= LEN(@inputString) BEGIN
        IF ISNUMERIC(SUBSTRING(@inputString,@count,1)) <> 1 BEGIN
            SET @newString += SUBSTRING(@inputString,@count,1);
        END;
        SET @count += 1;
    END; 
    RETURN @newString;
END;
GO

PRINT dbo.fn_RemoveNumbers('ASDF4545SDFAF45');
GO

CREATE FUNCTION dbo.fn_FormatPhone (@inputNum VARCHAR(10)) RETURNS VARCHAR(25) BEGIN
    RETURN '(' + SUBSTRING(@inputNum, 1, 3) + ')' + SUBSTRING(@inputNum, 4, 3) + '-' +SUBSTRING(@inputNum, 6, 4);
END;
GO

PRINT dbo.fn_FormatPhone(1234567890);
GO
