WITH GetOverDueBookIDs(LoanID,BookID, BorrowerID)
AS
(
SELECT LoanID, BookID, BorrowerID FROM Loan 
WHERE (DATEDIFF(DAY, DueDate, DateReturned) > 30) OR (DateReturned IS NULL AND DATEDIFF(DAY, DueDate, GETDATE()) > 30)
)

SELECT G.LoanID, B.BookID, B.Title, B.Author, B.ISBN, Bo.BorrowerID, Bo.FirstName, Bo.LastName 
FROM Book AS B
JOIN GetOverDueBookIDs AS G
ON B.BookID = G.BookID
JOIN Borrower AS Bo
ON Bo.BorrowerID = G.BorrowerID
ORDER BY G.LoanID;
