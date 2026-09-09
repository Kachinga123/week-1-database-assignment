-- =====================================================
-- WEEK 1 DATABASE ASSIGNMENT
-- Topic: Library Management System
-- =====================================================

-- =====================================================
-- 1. CREATE DATABASE
-- =====================================================

-- Delete the existing database if it already exists
-- This allows the script to be tested from a clean start
DROP DATABASE IF EXISTS library_management;

-- Create a new database
CREATE DATABASE library_management;

-- Select the database
USE library_management;


-- =====================================================
-- 2. CREATE AUTHORS TABLE
-- =====================================================

CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL
);


-- =====================================================
-- 3. CREATE BOOKS TABLE
-- =====================================================

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author_id INT NOT NULL,
    publication_year INT,
    category VARCHAR(50),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);


-- =====================================================
-- 4. CREATE MEMBERS TABLE
-- =====================================================

CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    membership_date DATE
);


-- =====================================================
-- 5. CREATE BORROWING TABLE
-- =====================================================

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
-- 6. INSERT AUTHORS
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
-- 7. INSERT BOOKS
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
-- 8. INSERT MEMBERS
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
-- 9. INSERT BORROWING RECORDS
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
-- 10. DISPLAY ALL AUTHORS
-- =====================================================

SELECT * FROM authors;


-- =====================================================
-- 11. DISPLAY ALL BOOKS
-- =====================================================

SELECT * FROM books;


-- =====================================================
-- 12. DISPLAY ALL MEMBERS
-- =====================================================

SELECT * FROM members;


-- =====================================================
-- 13. DISPLAY ALL BORROWING RECORDS
-- =====================================================

SELECT * FROM borrowing;


-- =====================================================
-- 14. DISPLAY BOOKS WITH THEIR AUTHORS
-- =====================================================

SELECT
    books.book_id,
    books.title,
    authors.author_name,
    books.publication_year,
    books.category
FROM books
JOIN authors
    ON books.author_id = authors.author_id;


-- =====================================================
-- 15. DISPLAY BORROWING DETAILS
-- =====================================================

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


-- =====================================================
-- 16. DISPLAY BOOKS NOT YET RETURNED
-- =====================================================

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


-- =====================================================
-- 17. COUNT TOTAL BOOKS
-- =====================================================

SELECT COUNT(*) AS total_books
FROM books;


-- =====================================================
-- 18. COUNT TOTAL MEMBERS
-- =====================================================

SELECT COUNT(*) AS total_members
FROM members;


-- =====================================================
-- 19. COUNT TOTAL AUTHORS
-- =====================================================

SELECT COUNT(*) AS total_authors
FROM authors;


-- =====================================================
-- 20. COUNT BORROWING RECORDS
-- =====================================================

SELECT COUNT(*) AS total_borrowing_records
FROM borrowing;


-- =====================================================
-- 21. DISPLAY BOOKS PUBLISHED AFTER 2000
-- =====================================================

SELECT *
FROM books
WHERE publication_year > 2000;


-- =====================================================
-- 22. DISPLAY FICTION BOOKS
-- =====================================================

SELECT *
FROM books
WHERE category = 'Fiction';


-- =====================================================
-- 23. DISPLAY CURRENTLY BORROWED BOOKS
-- =====================================================

SELECT
    books.title,
    members.full_name,
    borrowing.borrow_date
FROM borrowing
JOIN books
    ON borrowing.book_id = books.book_id
JOIN members
    ON borrowing.member_id = members.member_id
WHERE borrowing.return_date IS NULL;


-- =====================================================
-- END OF WEEK 1 DATABASE ASSIGNMENT
-- =====================================================