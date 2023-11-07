CREATE PROCEDURE sp_GetOverdueBorrowers 
AS
BEGIN
SET NOCOUNT ON;
CREATE TABLE #TempOverdueBorrowersTable (
	LoanId int,
    BorrowerId int,
	BookId int,
    FirstName VARCHAR(50),
	LastName VARCHAR(50),
)

INSERT INTO #TempOverdueBorrowersTable(LoanId,BorrowerId, BookId, FirstName, LastName)
SELECT L.LoanID, B.BorrowerID, L.BookID ,B.FirstName, B.LastName
FROM 
Borrower AS B
JOIN Loan AS L
ON B.BorrowerID = L.BorrowerID
WHERE L.DateReturned IS NULL AND DATEDIFF(DAY, L.DueDate, GETDATE()) > 0

SELECT T.BorrowerID, T.FirstName, T.LastName, L.LoanID, L.DueDate, L.DateReturned,B.Title, B.Author, B.ISBN, B.Genre, B.ShelfLocation
FROM #TempOverdueBorrowersTable AS T
JOIN Loan AS L
ON L.LoanID = T.LoanId
JOIN Book AS B
On B.BookID = T.BookId
ORDER BY T.BorrowerID;

END