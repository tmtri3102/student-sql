create database QuanLySinhVien;
use QuanLySinhVien;
CREATE TABLE Class (
                       ClassID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                       ClassName VARCHAR(50) NOT NULL,
                       StartDate DATETIME NOT NULL,
                       Status BIT
);
CREATE TABLE Student (
                         StudentID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                         StudentName VARCHAR(30) NOT NULL,
                         Address VARCHAR(50),
                         Phone VARCHAR(20),
                         Status BIT,
                         ClassID INT NOT NULL
);
CREATE TABLE Subject (
                         SubID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                         SubName VARCHAR(30) NOT NULL,
                         Credit TINYINT NOT NULL DEFAULT 1 CHECK (Credit >= 1),
                         Status BIT DEFAULT 1
);
CREATE TABLE Mark (
                      MarkID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                      SubID INT NOT NULL,
                      StudentId INT NOT NULL,
                      Mark FLOAT DEFAULT 0 CHECK (Mark BETWEEN 0 AND 100),
                      ExamTimes TINYINT DEFAULT 1,
                      UNIQUE (SubId , StudentId),
                      FOREIGN KEY (SubId)
                          REFERENCES Subject (SubId),
                      FOREIGN KEY (StudentId)
                          REFERENCES Student (StudentId)
);
USE Quanlysinhvien;

SELECT
    *
FROM
    Class;

INSERT INTO Class
VALUES
    (1, 'A1', '2008-12-20', 1),
    (2, 'A2', '2008-12-22', 1),
    (3, 'B3', CURRENT_DATE, 0);

ALTER TABLE Class
    MODIFY COLUMN StartDate DATE;

SELECT
    *
FROM
    Student;

INSERT INTO Student
VALUES
    (1, 'Hung', 'Ha Noi', '0912113113', 1, 1),
    (2, 'Hoa', 'Hai Phong', ' ', 1, 1),
    (3, 'Manh', 'HCM', '0123123123', 0, 2);

SELECT
    *
FROM
    Subject;

INSERT INTO Subject
VALUES
    (1, 'CF', 5, 1),
    (2, 'C', 6, 1),
    (3, 'HDJ', 5, 1),
    (4, 'RDBMS', 10, 1);

SELECT
    *
FROM
    Mark;

INSERT INTO Mark
VALUES
    (1, 1, 1, 8, 1),
    (2, 1, 2, 10, 2),
    (3, 2, 1, 12, 1);