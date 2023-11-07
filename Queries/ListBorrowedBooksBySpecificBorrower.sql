declare @borrowerID int;
set @borrowerID = 800;

SELECT B.BookID, B.Title, B.Author, B.ISBN, B.PublishDate, B.Genre, B.ShelfLocation, B.CurrentStatus
FROM Book AS B
JOIN Loan As L
ON B.BookID = L.BookID
WHERE L.BorrowerID = @borrowerID;
