CREATE FUNCTION fn_BookBorrowingFrequency(@BookID int)
RETURNS int AS
BEGIN
	DECLARE @CountOfBorrows int;

	SET @CountOfBorrows = (SELECT COUNT(*) AS BorrowingFrequency FROM Loan Where BookID = @BookID);

	RETURN @CountOfBorrows
END;
