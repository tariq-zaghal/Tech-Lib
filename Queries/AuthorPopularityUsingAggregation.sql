WITH GroupByAuthor(Author)
AS
(
SELECT Author FROM Book
JOIN Loan
ON Book.BookID = Loan.BookID
)

SELECT Author, COUNT(*) AS [Count], DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS [Rank]
FROM GroupByAuthor
GROUP BY Author;