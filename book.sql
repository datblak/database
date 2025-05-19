CREATE TABLE authors (
    author_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    bio TEXT,
    PRIMARY KEY (author_id),
    UNIQUE (first_name, last_name)
);

CREATE TABLE publishers ( publisher_id INT 
 AUTO_INCREMENT,
 name VARCHAR(100) NOT NULL, address VARCHAR(200), 
 city VARCHAR(50),
 state VARCHAR(50), 
 country VARCHAR(50), PRIMARY KEY (publisher_id),
 UNIQUE (name) 
);

CREATE TABLE books ( book_id INT AUTO_INCREMENT,
 title VARCHAR(200) NOT NULL,
 subtitle VARCHAR(200),   
 author_id INT, 
 publisher_id INT, 
 publication_date DATE, edition INT, 
 price DECIMAL(10, 2), 
 isbn VARCHAR(20) UNIQUE, 
 PRIMARY KEY (book_id), 
 FOREIGN KEY (author_id) REFERENCES authors(author_id), 
 FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id) 
);

CREATE TABLE borrowers ( borrower_id INT 
 AUTO_INCREMENT, 
 first_name VARCHAR(50) NOT NULL, 
 last_name VARCHAR(50) NOT NULL, 
 email VARCHAR(100) UNIQUE, 
 phone VARCHAR(20), 
 address VARCHAR(200), 
 city VARCHAR(50), 
 state VARCHAR(50), 
 country VARCHAR(50), 
 PRIMARY KEY (borrower_id) 
 );

CREATE TABLE loans ( loan_id INT
 AUTO_INCREMENT, 
 book_id INT, 
 borrower_id INT, 
 loan_date DATE, 
 due_date DATE, 
 return_date DATE, 
 fine DECIMAL(10, 2), 
 PRIMARY KEY (loan_id), 
 FOREIGN KEY (book_id) REFERENCES books(book_id), 
 FOREIGN KEY (borrower_id) REFERENCES borrowers(borrower_id) 
 );