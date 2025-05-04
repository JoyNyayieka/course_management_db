CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    date_of_birth DATE
);

CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50) UNIQUE
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    course_description TEXT,
    instructor_id INT REFERENCES Instructors(instructor_id)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT REFERENCES Students(student_id),
    course_id INT REFERENCES Courses(course_id),
    enrollment_date DATE,
    grade CHAR(1)
);

INSERT INTO Instructors (instructor_id, first_name, last_name, email) 
VALUES
(1, 'John', 'Kimani', 'johnkimani@example.com'),
(2, 'Alice', 'Mwikali', 'alicemwikali@example.com'),
(3, 'David', 'Kibet', 'davidkibet@example.com');


INSERT INTO Students (student_id, first_name, last_name, email, date_of_birth) 
VALUES
(1, 'Mary', 'Wanjiru', 'marywanjiru@example.com', '2001-03-12'),
(2, 'James', 'Otieno', 'jamesotieno@example.com', '2000-08-24'),
(3, 'Linda', 'Rotich', 'lindarotich@example.com', '2002-05-18'),
(4, 'Michael', 'Wambua', 'michaelwambua@example.com', '1999-11-10'),
(5, 'Patricia', 'Nyokabi', 'patricianyokabi@example.com', '2003-01-30'),
(6, 'Robert', 'Wafula', 'robertwafula@example.com', '2001-09-09'),
(7, 'Jennifer', 'Tamara', 'jennifertamara@example.com', '2002-12-05'),
(8, 'William', 'Bahati', 'williambahati@example.com', '2000-07-22'),
(9, 'Elizabeth', 'Moraa', 'elizabethmoraa@example.com', '2001-04-01'),
(10, 'Charles', 'Juma', 'charlesjuma@example.com', '1998-06-17');


INSERT INTO Courses (course_id, course_name, course_description, instructor_id) 
VALUES
(1, 'Intro to SQL', 'Learn the basics of SQL.', 1),
(2, 'Data Structures', 'Understand common data structures.', 2),
(3, 'Web Development', 'Frontend and backend web dev.', 3),
(4, 'Machine Learning', 'Basics of machine learning concepts.', 1),
(5, 'Cloud Computing', 'Learn about cloud technologies.', 2);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date, grade) 
VALUES
(1, 1, 1, '2024-01-15', 'A'),
(2, 2, 1, '2024-01-16', 'B'),
(3, 3, 2, '2024-01-17', 'C'),
(4, 4, 2, '2024-01-18', 'A'),
(5, 5, 3, '2024-01-19', 'F'),
(6, 6, 3, '2024-01-20', 'B'),
(7, 7, 4, '2024-01-21', 'A'),
(8, 8, 4, '2024-01-22', 'D'),
(9, 9, 5, '2024-01-23', 'B'),
(10, 10, 5, '2024-01-24', 'C'),
(11, 1, 2, '2024-01-25', 'B'),
(12, 2, 3, '2024-01-26', 'F'),
(13, 3, 4, '2024-01-27', 'A'),
(14, 4, 5, '2024-01-28', 'C'),
(15, 5, 1, '2024-01-29', 'F');
