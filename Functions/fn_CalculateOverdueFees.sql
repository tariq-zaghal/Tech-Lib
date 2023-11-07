	CREATE FUNCTION fn_CalculateOverdueFees (@LoanID int)	
	RETURNS int AS
	BEGIN
		DECLARE @DueDate date;
		SET @DueDate = (SELECT DueDate FROM Loan WHERE LoanID = @LoanID);

		DECLARE @DateReturned date;
		SET @DateReturned = (SELECT DateReturned FROM Loan WHERE LoanID = @LoanID);

		IF(@DateReturned IS NULL)
			BEGIN
				SET @DateReturned = GETDATE();
			END

		DECLARE @DaysDiff int;
		SET @DaysDiff = DATEDIFF(DAY, @DueDate, @DateReturned);

		IF(@DaysDiff > 30)
			BEGIN
				RETURN 30 + (@DaysDiff - 30)*2;
			END
		IF(@DaysDiff > 0)
			BEGIN
				RETURN @DaysDiff;
			END

		RETURN 0;

	END;
