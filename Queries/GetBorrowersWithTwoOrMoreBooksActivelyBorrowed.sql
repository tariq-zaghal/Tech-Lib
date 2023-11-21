WITH GetUnreturnedBooks(BookNotReturned)
AS
(
SELECT BorrowerID FROM Loan 
WHERE DateReturned IS NULL
),
GetIDOfBorrowersDidNotReturn2BooksOrMore(IDofBorrowerDidNotReturn)
AS
(
SELECT BookNotReturned FROM GetUnreturnedBooks
GROUP BY BookNotReturned
HAVING COUNT(BookNotReturned)>=2
)

SELECT B.BorrowerID, B.FirstName, B.LastName, B.Email, B.DateOfBirth, B.MembershipDate 
FROM Borrower AS B
JOIN GetIDOfBorrowersDidNotReturn2BooksOrMore AS G
ON B.BorrowerID = G.IDofBorrowerDidNotReturn;

