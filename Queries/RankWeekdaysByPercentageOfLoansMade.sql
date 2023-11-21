WITH GetDayOfWeek([Day])
AS
(
SELECT DATENAME(WEEKDAY, DateBorrowed) FROM Loan
)
,GetBorrowingFrequencyForEachDay([Day], Frequency)
AS
(
SELECT *, COUNT(*) FROM GetDayOfWeek
Group By [Day]
)

SELECT [Day],(Frequency/CAST((SELECT SUM(Frequency) FROM GetBorrowingFrequencyForEachDay) AS float))*100 AS 'Percentage %'
FROM GetBorrowingFrequencyForEachDay
ORDER BY 'Percentage %' DESC
