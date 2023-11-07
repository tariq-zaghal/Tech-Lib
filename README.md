# Tech-Lib 
Tech-Lib is a database for a library created using [MS SQL](https://www.microsoft.com/en-us/sql-server) in order to track the books, users, and loans.
I have completed this project during an internship with FootHill Technologies.

## Introduction
Tech-Lib data base contains three simple entities; Book, Borrower, and Loan.
The names are pretty much self explanatory: 
1- Book contains the data related to each book in our library.

2- Borrower contains the data related to our active subscribers in the library.

3- Loans contains all the transactions that the borrowers perform and the books they borrow.

you could get a better sense of it by looking at the ER Diagram Below.

![Tech-Lib ER Diagram](https://github.com/tariq-zaghal/Tech-Lib/blob/dev/TechLibERDiagram.png)
## Getting Started
Before froking this repository make sure you have: 
- [SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) 
- [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16#download-ssms)

Then, Clone the repository to your local machine

```

git clone https://github.com/tariq-zaghal/Tech-Lib.git

```

After you clone the repo, Create a database in SSMSS

```
CREATE DATABASE TechLib;
```

After that, take a look at the folders you have in the repo, you will find a folder names `CreateTables` which contains three SQL files each of which creates a table 
and seeds it. make sure to execute `CreateBookTable` and `CreateBorrowerTable` first before executing `CreateLoanTable`, this is important since `CreateLoanTable` 
contains foreign keys that reference the primary keys of the other two tables.

Now you're all set to start running queries on Tech-Lib!

## How To Use?

As you can see, there four folders other than CreateTables; `Queries`, `Functions`, `StoredProcedures`, and `Triggers`. We'll go through them one by one and explain the content of each in a table

### 1- Queries

| Name    | Job |
| ------------- | ------------- |
| [ListBorrowedBooksBySpecificBorrower](https://github.com/tariq-zaghal/Tech-Lib/blob/dev/Queries/ListBorrowedBooksBySpecificBorrower.sql)  | Lists the history of all books borrowed by a given Borrower using his Borrower ID |
| [GetBorrowersWithTwoOrMoreBooksActivelyBorrowed](https://github.com/tariq-zaghal/Tech-Lib/blob/dev/Queries/GetBorrowersWithTwoOrMoreBooksActivelyBorrowed.sql)  | Lists active borrowers who are currently borrowing two or more books with the borrowed books' details |
| [RankBorrrowersBasedOnBorrowingFrequency](https://github.com/tariq-zaghal/Tech-Lib/blob/dev/Queries/RankBorrrowersBasedOnBorrowingFrequency.sql) | Ranks Borrowers based on the number of books they have borrowed |
| [GetMostPopularGenreBasedOnAGivenMonth](https://github.com/tariq-zaghal/Tech-Lib/blob/dev/Queries/GetMostPopularGenreBasedOnAGivenMonth.sql) | Returns the most popular genre in a given month |
|  |  |
|  |  |
|  |  |
|  |  |
