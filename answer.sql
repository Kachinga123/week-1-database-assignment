-- Week 1 Database Assignment
-- Topic: Library Management System

-- Create the database
CREATE DATABASE library_management;

-- Select the database
USE library_management;

-- Create Authors table
CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL
);

-- Create Books table
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    publication_year YEAR,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Create Members table
CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- Create Borrowing table
CREATE TABLE borrowing (
    borrowing_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Insert authors
INSERT INTO authors (author_name)
VALUES
('Chinua Achebe'),
('Ngugi wa Thiong''o'),
('George Orwell');

-- Insert books
INSERT INTO books (title, author_id, publication_year)
VALUES
('Things Fall Apart', 1, 1958),
('Petals of Blood', 2, 1977),
('Animal Farm', 3, 1945);

-- Insert members
INSERT INTO members (full_name, email, phone)
VALUES
('John Lokwale', 'john@example.com', '0712345678'),
('Mary Ekal', 'mary@example.com', '0723456789');

-- Insert borrowing records
INSERT INTO borrowing (book_id, member_id, borrow_date, return_date)
VALUES
(1, 1, '2026-09-01', '2026-09-08'),
(2, 2, '2026-09-03', NULL);

-- View all authors
SELECT * FROM authors;

-- View all books
SELECT * FROM books;

-- View all members
SELECT * FROM members;

-- View borrowing records
SELECT * FROM borrowing;

-- View books together with their authors
SELECT books.title, authors.author_name, books.publication_year
FROM books
JOIN authors ON books.author_id = authors.author_id;