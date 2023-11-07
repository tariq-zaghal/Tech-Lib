WITH GetBorrowersRanking(BorrowerID, [Count], BorrowingFrequencyRank)
AS
(
SELECT BorrowerID,COUNT(*) AS Count,
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS BorrowingFrequencyRank
FROM Loan
GROUP BY BorrowerID
)

SELECT G.BorrowingFrequencyRank, G.BorrowerID, B.FirstName, B.LastName, B.Email, G.Count
FROM GetBorrowersRanking AS G
JOIN Borrower AS B
ON G.BorrowerID = B.BorrowerID
ORDER BY G.BorrowingFrequencyRank ASC;