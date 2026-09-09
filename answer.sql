-- =====================================================
-- WEEK 1 DATABASE ASSIGNMENT
-- Topic: Library Management System
-- =====================================================

-- Create the database
CREATE DATABASE library_management;

-- Select the database
USE library_management;

-- =====================================================
-- CREATE TABLES
-- =====================================================

-- Authors table
CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL
);

-- Books table
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author_id INT NOT NULL,
    publication_year YEAR,
    category VARCHAR(50),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Members table
CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    membership_date DATE
);

-- Borrowing table
CREATE TABLE borrowing (
    borrowing_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- =====================================================
-- INSERT MANY AUTHORS
-- =====================================================

INSERT INTO authors (author_name)
VALUES
('Chinua Achebe'),
('Ngugi wa Thiong''o'),
('George Orwell'),
('William Shakespeare'),
('Jane Austen'),
('Charles Dickens'),
('J.K. Rowling'),
('Nelson Mandela'),
('Robert Kiyosaki'),
('Wangari Maathai');

-- =====================================================
-- INSERT MANY BOOKS
-- =====================================================

INSERT INTO books (title, author_id, publication_year, category)
VALUES
('Things Fall Apart', 1, 1958, 'Fiction'),
('No Longer at Ease', 1, 1960, 'Fiction'),
('Petals of Blood', 2, 1977, 'Fiction'),
('A Grain of Wheat', 2, 1967, 'Fiction'),
('Animal Farm', 3, 1945, 'Political Fiction'),
('Nineteen Eighty-Four', 3, 1949, 'Political Fiction'),
('Romeo and Juliet', 4, 1597, 'Drama'),
('Macbeth', 4, 1606, 'Drama'),
('Pride and Prejudice', 5, 1813, 'Romance'),
('Oliver Twist', 6, 1838, 'Fiction'),
('Harry Potter and the Philosopher''s Stone', 7, 1997, 'Fantasy'),
('Long Walk to Freedom', 8, 1994, 'Biography'),
('Rich Dad Poor Dad', 9, 1997, 'Finance'),
('Unbowed', 10, 2006, 'Biography');

-- =====================================================
-- INSERT MANY MEMBERS
-- =====================================================

INSERT INTO members (full_name, email, phone, membership_date)
VALUES
('John Lokwale', 'john@example.com', '0712345678', '2026-01-10'),
('Mary Ekal', 'mary@example.com', '0723456789', '2026-01-15'),
('Peter Lomeri', 'peter@example.com', '0734567890', '2026-02-01'),
('Amina Lotiir', 'amina@example.com', '0745678901', '2026-02-10'),
('David Ekiru', 'david@example.com', '0756789012', '2026-02-20'),
('Grace Napeyok', 'grace@example.com', '0767890123', '2026-03-05'),
('James Lokor', 'james@example.com', '0778901234', '2026-03-15'),
('Sarah Ewoi', 'sarah@example.com', '0789012345', '2026-04-01'),
('Daniel Lomeg', 'daniel@example.com', '0790123456', '2026-04-10'),
('Esther Akai', 'esther@example.com', '0701234567', '2026-05-01');

-- =====================================================
-- INSERT MANY BORROWING RECORDS
-- =====================================================

INSERT INTO borrowing (book_id, member_id, borrow_date, return_date)
VALUES
(1, 1, '2026-08-01', '2026-08-08'),
(2, 2, '2026-08-02', '2026-08-09'),
(3, 3, '2026-08-03', '2026-08-10'),
(4, 4, '2026-08-04', '2026-08-11'),
(5, 5, '2026-08-05', '2026-08-12'),
(6, 6, '2026-08-06', NULL),
(7, 7, '2026-08-07', '2026-08-14'),
(8, 8, '2026-08-08', NULL),
(9, 9, '2026-08-09', '2026-08-16'),
(10, 10, '2026-08-10', NULL),
(11, 1, '2026-08-15', NULL),
(12, 2, '2026-08-16', '2026-08-23'),
(13, 3, '2026-08-17', NULL),
(14, 4, '2026-08-18', '2026-08-25');

-- =====================================================
-- VIEW DATA
-- =====================================================

-- Display all authors
SELECT * FROM authors;

-- Display all books
SELECT * FROM books;

-- Display all members
SELECT * FROM members;

-- Display all borrowing records
SELECT * FROM borrowing;

-- =====================================================
-- USEFUL QUERIES
-- =====================================================

-- Display books and their authors
SELECT
    books.book_id,
    books.title,
    authors.author_name,
    books.publication_year,
    books.category
FROM books
JOIN authors
    ON books.author_id = authors.author_id;

-- Display borrowing records with member and book names
SELECT
    borrowing.borrowing_id,
    members.full_name,
    books.title,
    borrowing.borrow_date,
    borrowing.return_date
FROM borrowing
JOIN members
    ON borrowing.member_id = members.member_id
JOIN books
    ON borrowing.book_id = books.book_id;

-- Display books that have not yet been returned
SELECT
    members.full_name,
    books.title,
    borrowing.borrow_date
FROM borrowing
JOIN members
    ON borrowing.member_id = members.member_id
JOIN books
    ON borrowing.book_id = books.book_id
WHERE borrowing.return_date IS NULL;

-- Count the number of books
SELECT COUNT(*) AS total_books
FROM books;

-- Count the number of members
SELECT COUNT(*) AS total_members
FROM members;

-- Count the number of authors
SELECT COUNT(*) AS total_authors
FROM authors;

-- Count borrowed books
SELECT COUNT(*) AS borrowed_books
FROM borrowing;

-- Display books published after 2000
SELECT *
FROM books
WHERE publication_year > 2000;

-- Display books in the Fiction category
SELECT *
FROM books
WHERE category = 'Fiction';

-- =====================================================
-- END OF ASSIGNMENT
-- =====================================================