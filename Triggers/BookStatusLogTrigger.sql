CREATE TRIGGER BookStatusLogTrigger ON Book
	AFTER UPDATE
	AS
	BEGIN
		SET NOCOUNT ON;

		DECLARE @BookId int;
		SELECT @BookId = INSERTED.BookId FROM INSERTED;

		DECLARE @Status varchar(20);
		SELECT @Status = INSERTED.CurrentStatus FROM INSERTED;

		DECLARE @OldValue varchar(20)
		SELECT @OldValue = DELETED.CurrentStatus FROM DELETED;

		IF (@OldValue != @Status)
			INSERT INTO AuditLog (BookID,StatusChange,ChangeDate)
			VALUES (@BookId, @Status, GETDATE())
	END;
