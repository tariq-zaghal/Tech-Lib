CREATE PROCEDURE sp_AddNewBorrower @FirstName varchar(50), @LastName varchar(50), @Email varchar(255), @DateOfBirth date, @MembershipDate date
AS BEGIN
		DECLARE @BorrowerID INT;

		IF NOT EXISTS (SELECT Email FROM Borrower WHERE Email = @Email)
			BEGIN
				INSERT INTO Borrower (FirstName, LastName, Email, DateOfBirth, MembershipDate)
				VALUES (@FirstName, @LastName, @Email, @DateOfBirth, @MembershipDate);
				SET @BorrowerID = SCOPE_IDENTITY();
				SELECT @BorrowerID AS BorrowerID;
				RETURN
			END
		ELSE
			BEGIN
				DECLARE @ErrorMessage NVARCHAR(200) = 'Borrowers Email Already Exists';
				DECLARE @ErrorNumber INT = 50001;
				RAISERROR('Borrowers Email Already Exists', 9, 1);
				RETURN;
			END

   END;
