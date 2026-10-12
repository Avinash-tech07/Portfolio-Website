-- Database creation for EduManage System
CREATE DATABASE EduManageDB;
GO

USE EduManageDB;
GO

-- Create a robust table for Users/Students
CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(256) NOT NULL, -- Never store plain text passwords!
    CourseName NVARCHAR(100),
    EnrollmentStatus NVARCHAR(20) DEFAULT 'Pending',
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Insert dummy data for testing
INSERT INTO Students (FullName, Email, PasswordHash, CourseName, EnrollmentStatus)
VALUES 
('Alice Johnson', 'alice@test.com', 'hashed_password_123', 'Computer Science', 'Active'),
('Bob Smith', 'bob@test.com', 'hashed_password_456', 'Information Technology', 'Pending');
GO

-- Create an index on Email for faster login lookups
CREATE INDEX IX_Students_Email ON Students(Email);
GO