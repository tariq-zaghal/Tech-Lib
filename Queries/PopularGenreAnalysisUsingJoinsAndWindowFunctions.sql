DECLARE @month int;

SET @month = 12;

With GetBooksInMonth(BookID)
AS
(
SELECT Loan.BookID FROM Loan
WHERE MONTH(DateBorrowed) = @month
)
, GetBooksAndGenresFromBookTable(BookID, Genre)
AS
(
SELECT B.BookID, B.Genre FROM Book AS B
JOIN GetBooksInMonth AS G
On B.BookID = g.BookID
)
, GroupBooksByGenre(Genre, [Count], Ranking)
AS
(
SELECT B.Genre, COUNT(*), RANK() OVER (ORDER BY COUNT(*) DESC) 
FROM GetBooksAndGenresFromBookTable AS B
GROUP BY B.Genre
)

SELECT Genre, [Count] FROM GroupBooksByGenre
WHERE Ranking = 1;