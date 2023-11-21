CREATE PROCEDURE sp_BorrowedBooksReport @StartDate date, @EndDate date
AS 
BEGIN
	SELECT B.BookID, B.Title, B.Author, B.ISBN, B.PublishDate, B.Genre, B.ShelfLocation, B.CurrentStatus, Bo.FirstName, Bo.LastName, L.DateBorrowed , L.DateReturned
	FROM Loan AS L
	JOIN Book AS B
	ON L.BookID = B.BookID
	JOIN Borrower AS Bo
	ON L.BorrowerID = Bo.BorrowerID
	WHERE L.DateBorrowed >= @StartDate AND L.DateBorrowed <= @EndDate
END

