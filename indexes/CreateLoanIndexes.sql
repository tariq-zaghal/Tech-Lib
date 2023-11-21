CREATE INDEX Loan_BookID_Index
ON Loan(BookID);

CREATE INDEX Loan_BorrowerID_Index
ON Loan(BorrowerID);

CREATE INDEX Loan_DateBorrowed_Index
ON Loan(DateBorrowed);

CREATE INDEX Loan_DueDate_Index
ON Loan(DueDate);
