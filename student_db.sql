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