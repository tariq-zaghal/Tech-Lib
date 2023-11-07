WITH GetBorrowersAge (Age, Genre)
AS
(
SELECT DATEDIFF(DAY, Bo.DateOfBirth, GETDATE())/365, B.Genre 
FROM  Loan AS L
JOIN Book AS B
ON L.BookID = B.BookID
JOIN Borrower AS Bo
ON L.BorrowerID = Bo.BorrowerID
)

, GetBorrowersAgeGroup(AgeGroup, Genre)
AS
(
SELECT 
CASE
WHEN Age BETWEEN 0 AND 10 THEN '0-10'
WHEN Age BETWEEN 11 AND 20 THEN '11-20'
WHEN Age BETWEEN 21 AND 30 THEN '21-30'
WHEN Age BETWEEN 31 AND 40 THEN '31-40'
WHEN Age BETWEEN 41 AND 50 THEN '41-50'
WHEN Age BETWEEN 51 AND 60 THEN '51-60'
WHEN Age BETWEEN 61 AND 70 THEN '61-70'
WHEN Age BETWEEN 71 AND 80 THEN '71-80'
END AS AgeGroup
, Genre
FROM GetBorrowersAge
)

,GetBorrowCountForEachAgeGroupAndGenre(AgeGroup, Genre, NumberOfBorrows)
AS
(
SELECT AgeGroup,Genre, Count(*) AS GenreBorrows FROM GetBorrowersAgeGroup GROUP BY Genre, AgeGroup
)

,GetAgeGroupGenreRank(AgeGroup,Genre,NumberOfBorrows,[Rank])
AS
(
SELECT *, ROW_NUMBER() OVER (PARTITION BY AgeGroup ORDER BY NumberOfBorrows DESC) AS [Rank] 
FROM GetBorrowCountForEachAgeGroupAndGenre
)

SELECT AgeGroup, Genre, NumberOfBorrows 
FROM GetAgeGroupGenreRank 
WHERE [Rank] = 1;

