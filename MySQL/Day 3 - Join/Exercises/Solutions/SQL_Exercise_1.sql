/*Part 1:
	- For each book, Retrieve its title and the name of the author*/

	 SELECT books.title, authors.name 
     FROM books 
     INNER JOIN authors ON books.author_id = authors.id;

	/*- For each book, get all the information about it and the name of the author*/
    
    SELECT books.*, authors.name 
    FROM books 
    INNER JOIN authors ON books.author_id = authors.id;

	/*- Get the title of each book and the name of the author, sorted alphabetically on the title of the book.*/

    SELECT books.title, authors.name 
     FROM books 
     INNER JOIN authors ON books.author_id = authors.id
     ORDER BY title;


	/*- Same but sorted on the author's name.*/
    SELECT books.title, authors.name 
     FROM books 
     INNER JOIN authors ON books.author_id = authors.id
     ORDER BY name;

/*Part 2:
    - Collect the number of books by author (with the name of the author)*/
SELECT COUNT(*), authors.name FROM books
INNER JOIN authors on books.author_id = authors.id
GROUP BY authors.id

/*Part 3:
	- Get the sum of the price of all the books for one specific author (you choose which one)*/

SELECT SUM(price), authors.name FROM books
INNER JOIN authors on books.author_id = authors.id
WHERE authors.name = 'Jrr Tolkien';

	/*- Get the sum of price of all books by author*/

SELECT SUM(price), authors.name 
FROM books
INNER JOIN authors on books.author_id = authors.id
GROUP BY authors.id

