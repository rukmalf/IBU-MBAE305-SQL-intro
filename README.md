# SQL Introduction

Welcome to this Introduction to SQL as part of Prof. Kobra's Technology Trends and Applications course at IBU!

This document gives you an overview of what you can do with SQL, and while you can just read it on its own, you can also follow the steps yourself at no cost.

## 1. Basic Concepts

The most common way to store information on computers is using relational database tables. This uses the techniques of Entity-Relationship modelling to define tables that store information, what their attributes are, and what the relationships among them are.

For example, think about this course, everyone taking this course, and the various assignments you have to do. Let's assume the following:
 - each student has a firstname, lastname and an email
 - there are 6 assessments in the course, each with a different title and a weight
 - each student gets graded on each of the 6 assignments and gets a final grade
 
If we captured all of this in an Excel spreadsheet, it would look like this:

But now we're repeating the student names and the assignment titles and grades. What if Prof. Kobra wanted to change the weights of the assignments?

How do we track that the course has multiple grades - one per student, per assessment?

We can break this into three Entities - Course, Student, and Assessment.

## 2. What is SQL?

Structured Query Language (SQL) is a programming language for defining and manipulating relational data. SQL is subcategorized into four forms:
* DDL - Data Definition Language
* DCL - Data Control Language
* DML - Data Manipulation Language
* DQL - Data Query Language

## 3. DDL - Data Definition Language

## 4. DML - Data Manipulation Language

## 5. Exercise - creating a database server on Azure

This is an optional step that you can try on your own free of charge using the Microsoft Azure subscription that you get through IBU. See step-by-step instructions [here](create-sql-server-instance-azure.md). 

## 6. Exercise - creating a database on Azure

This is an optional step that builds on the previous step, that you can again try on your own free of charge. See step-by-step instructions [here](create-azure-sql-db.md). 

## 7. Exercise - creating data on the database

This is the third optional step where you can add data into the database from the previous step. See step-by-step instructions here [].

## 8. Exercise - querying data

The value of data is in turning facts into information with value. Here are several different ways to do this.

1. list all the Students

		SELECT *
		FROM dbo.Student

2. filter the students who got A's

		SELECT *
		FROM dbo.Student
		WHERE FinalGrade >= 90

3. list only the student names and email addresses

		SELECT Firstname, Lastname, Email
		FROM dbo.Student

4. list names, email addresses and grade of students who got an A

		SELECT Firstname, Lastname, Email
		FROM dbo.Student
		WHERE FinalGrade >= 90

5. calculate the final grades of the students

		SELECT
			s.StudentId,
			s.Firstname,
			s.Lastname,
			s.FinalGrade AS StoredFinalGrade,
			ROUND(SUM(g.Grade * a.Weight) * 100, 0) AS CalculatedFinalGrade
		FROM dbo.Student AS s
		JOIN dbo.Grades AS g
			ON g.StudentId = s.StudentId
		JOIN dbo.Assessment AS a
			ON a.AssessmentNumber = g.AssessmentNumber
		GROUP BY
			s.StudentId,
			s.Firstname,
			s.Lastname,
			s.FinalGrade
		ORDER BY
			s.StudentId;
	
6. Make the final exam 25% of the final grade, and the individual case study 20%.

		UPDATE dbo.Assessment
		SET Weight = 0.25 WHERE AssessmentNumber = '6';
		UPDATE dbo.Assessment
		SET Weight = 0.20 WHERE AssessmentNumber = '3';

7. Recalculate
