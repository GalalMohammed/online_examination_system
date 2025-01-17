-- Insert new courses
INSERT INTO dbo.Course VALUES ('Database Management System','Des',60)
							 ,('Data Structure','Des',40);
GO
-- Adjust length as needed
ALTER TABLE dbo.Question ALTER COLUMN [Text] VARCHAR(500);  
ALTER TABLE dbo.Question ALTER COLUMN [Answer] VARCHAR(500);	
ALTER TABLE dbo.Choice ALTER COLUMN [Choice] VARCHAR(300);
-- Insert new questions
INSERT INTO dbo.Question VALUES ('What is a data structure?','MCQ','A way to store and organize data',2)
GO
-- Insert Choices 
INSERT INTO dbo.Choice VALUES (1,'A programming language'),(1,'A collection of algorithms')
								,(1,'A way to store and organize data'),(1,'A type of computer hardware')
GO							 
-- Insert new questions
INSERT INTO dbo.Question
VALUES 
('What is the full form of DBMS?', 'MCQ', 'Database Management System', 1),
('What is a database?', 'MCQ', 'Organized collection of data or information that can be accessed, updated, and managed', 1),
('What is DBMS?', 'MCQ', 'DBMS stores, modifies and retrieves data', 1),
('Who created the first DBMS?', 'MCQ', 'Charles Bachman', 1),
('Which type of data can be stored in the database?', 'MCQ', 'All of the above', 1),
('In which of the following formats data is stored in the database management system?', 'MCQ', 'Table', 1),
('Which of the following is not a type of database?', 'MCQ', 'Decentralized', 1),
('Which of the following is not an example of DBMS?', 'MCQ', 'Google', 1),
('Which of the following is not a feature of DBMS?', 'MCQ', 'Single-user Access only', 1),
('Which of the following is a feature of the database?', 'MCQ', 'User interface provided', 1),
('Which of the following is not a function of the database?', 'MCQ', 'Analysing code', 1),
('Which of the following is a function of the DBMS?', 'MCQ', 'All of the above', 1),
('Which of the following is a component of the DBMS?', 'MCQ', 'All of the above', 1),
('Which of the following is known as a set of entities of the same type that share same properties, or attributes?', 'MCQ', 'Entity set', 1),
('What is information about data called?', 'MCQ', 'Meta data', 1),
('What does an RDBMS consist of?', 'MCQ', 'Collection of Tables', 1),
('The values appearing in given attributes of any tuple in the referencing relation must likewise occur in specified attributes of at least one tuple in the referenced relation, according to _____________________ integrity constraint.', 'MCQ', 'Referential', 1),
('_____________ is a hardware component that is most important for the operation of a database management system.', 'MCQ', 'High speed, large capacity disk to store data', 1),
('The DBMS acts as an interface between ________________ and ________________ of an enterprise-class system.', 'MCQ', 'Database application and the database', 1),
('The ability to query data, as well as insert, delete, and alter tuples, is offered by ____________', 'MCQ', 'DML (Data Manipulation Language)', 1),
('______________ is a set of one or more attributes taken collectively to uniquely identify a record.', 'MCQ', 'Primary Key', 1),
('Which command is used to remove a relation from an SQL?', 'MCQ', 'Drop table', 1),
('Which of the following set should be associated with weak entity set for weak entity to be meaningful?', 'MCQ', 'Identifying set', 1),
('Which of the following command is correct to delete the values in the relation teaches?', 'MCQ', 'Delete from teaches;', 1),
('Procedural language among the following is __________', 'MCQ', 'Relational algebra', 1),
('_________________ operations do not preserve non-matched tuples.', 'MCQ', 'Inner join', 1),
('Which forms have a relation that contains information about a single entity?', 'MCQ', '3NF', 1),
('The top level of the hierarchy consists of ______ each of which can contain _____.', 'MCQ', 'Catalogs, Schemas', 1),
('_______ indicates the maximum number of entities that can be involved in a relationship.', 'MCQ', 'Maximum cardinality', 1),
('The user IDs can be added or removed using which of the following fixed roles?', 'MCQ', 'db_accessadmin', 1),
('Why the following statement is erroneous?', 'MCQ', 'None', 1),
('The traditional storage of data organized by the customer, stored in separate folders in filing cabinets is an example of ______________ type of ‘database’ management system.', 'MCQ', 'Hierarchical database management system', 1),
('After groups have been established, SQL applies predicates in the ___________ clause, allowing aggregate functions to be used.', 'MCQ', 'Having', 1),
('Which of the following is not the utility of DBMS?', 'MCQ', 'Process Organization', 1),
('What does a foreign key combined with a primary key create?', 'MCQ', 'Parent-Child relationship between the tables that connects them', 1),
('Which of the following is correct according to the technology deployed by DBMS?', 'MCQ', 'Locks are used to maintain transactional integrity and consistency', 1),
('Which of the following is correct regarding the file produced by a spreadsheet?', 'MCQ', 'stored on disk in an ASCII text format', 1),
('What is the function of the following command?', 'MCQ', 'Clears entries from relation', 1),
('_______ resembles Create view.', 'MCQ', 'Create view as', 1),
('The query specifying the SQL view is said to be updatable if it meets which of the following conditions?', 'MCQ', 'All of the mentioned', 1),
('When the “ROLLUP” operator for expression or columns within a “GROUP BY” clause is used?', 'MCQ', 'Create group-wise grand totals for the groups indicated in a GROUP BY clause', 1),
('Which of the following is the best way to represent the attributes in a large db?', 'MCQ', 'Concatenation', 1),
('Which of the following is the subset of SQL commands used to manipulate Oracle Structures, including tables?', 'MCQ', 'Data Definition Language', 1),
('Which of the following functions construct histograms and use buckets for ranking?', 'MCQ', 'Rank()', 1),
('__________ command is used in SQL to issue multiple CREATE TABLE, CREATE VIEW and GRANT statements in a single transaction.', 'MCQ', 'CREATE SCHEMA', 1),
('Which of the following key is required in to handle the data when the encryption is applied to the data so that the unauthorised user cannot access the data?', 'MCQ', 'Encryption key', 1),
('Which of the following is known as the process of viewing cross-tab with a fixed value of one attribute?', 'MCQ', 'Pivoting', 1),
('For designing a normal RDBMS which of the following normal form is considered adequate?', 'MCQ', '3NF', 1),
('Which of the following is popular for applications such as storage of log files in a database management system since it offers the best write performance?', 'MCQ', 'RAID level 0', 1),
('Which of the following represents a query in the tuple relational calculus?', 'MCQ', 'All of the mentioned', 1),
('The oldest DB model is _______________', 'MCQ', 'Hierarchical', 1),
('Evaluate the statements issued by the DBA in the given sequence if OE and SCOTT are the users and the ORDERS table is owned by OE.', 'MCQ', 'SCOTT would not be able to query the OE.ORDERS table', 1),
('Which of the following establishes a top-to-bottom relationship among the items?', 'MCQ', 'Hierarchical schema', 1),
('A major goal of the db system is to minimize the number of block transfers between the disk and memory. Which of the following helps in achieving this goal?', 'MCQ', 'Buffer', 1),
('What happens if a piece of data is stored in two places in the db?', 'MCQ', 'Storage space is wasted & Changing the data in one spot will cause data inconsistency', 1),
('The logical design, and the snapshot of the data at a given instant in time is known as?', 'MCQ', 'Schema & Instance', 1);
GO
-- Insert Choices for each Question

INSERT INTO dbo.Choice
VALUES
(1, 'Data of Binary Management System'), 
(1, 'Database Management System'), 
(1, 'Database Management Service'), 
(1, 'Data Backup Management System'),

(2, 'Organized collection of information that cannot be accessed, updated, and managed'), 
(2, 'Collection of data or information without organizing'), 
(2, 'Organized collection of data or information that can be accessed, updated, and managed'), 
(2, 'Organized collection of data that cannot be updated'),

(3, 'DBMS is a collection of queries'), 
(3, 'DBMS is a high-level language'), 
(3, 'DBMS is a programming language'), 
(3, 'DBMS stores, modifies and retrieves data'),

(4, 'Edgar Frank Codd'), 
(4, 'Charles Bachman'), 
(4, 'Charles Babbage'), 
(4, 'Sharon B. Codd'),

(5, 'Image oriented data'), 
(5, 'Text, files containing data'), 
(5, 'Data in the form of audio or video'), 
(5, 'All of the above'),

(6, 'Image'), 
(6, 'Text'), 
(6, 'Table'), 
(6, 'Graph'),

(7, 'Hierarchical'), 
(7, 'Network'), 
(7, 'Distributed'), 
(7, 'Decentralized'),

(8, 'MySQL'), 
(8, 'Microsoft Access'), 
(8, 'IBM DB2'), 
(8, 'Google'),

(9, 'Minimum Duplication and Redundancy of Data'), 
(9, 'High Level of Security'), 
(9, 'Single-user Access only'), 
(9, 'Support ACID Property'),

(10, 'No-backup for the data stored'), 
(10, 'User interface provided'), 
(10, 'Lack of Authentication'), 
(10, 'Store data in multiple locations'),

(11, 'Managing stored data'), 
(11, 'Manipulating data'), 
(11, 'Security for stored data'), 
(11, 'Analysing code'),

(12, 'Storing data'), 
(12, 'Providing multi-user access control'), 
(12, 'Data Integrity'), 
(12, 'All of the above'),

(13, 'Data'), 
(13, 'Data Languages'), 
(13, 'Data Manager'), 
(13, 'All of the above'),

(14, 'Relation set'), 
(14, 'Tuples'), 
(14, 'Entity set'), 
(14, 'Entity Relation model'),

(15, 'Hyper data'), 
(15, 'Tera data'), 
(15, 'Meta data'), 
(15, 'Relations'),

(16, 'Collection of Records'), 
(16, 'Collection of Keys'), 
(16, 'Collection of Tables'), 
(16, 'Collection of Fields'),

(17, 'Referential'), 
(17, 'Primary'), 
(17, 'Referencing'), 
(17, 'Specific'),

(18, 'Microphone'), 
(18, 'High speed, large capacity disk to store data'), 
(18, 'High-resolution video display'), 
(18, 'Printer'),

(19, 'Data and the DBMS'), 
(19, 'Application and SQL'), 
(19, 'Database application and the database'), 
(19, 'The user and the software'),

(20, 'TCL (Transaction Control Language)'), 
(20, 'DCL (Data Control Language)'), 
(20, 'DDL (Data Definition Language)'), 
(20, 'DML (Data Manipulation Language)'),

(21, 'Primary Key'), 
(21, 'Foreign key'), 
(21, 'Super key'), 
(21, 'Candidate key'),

(22, 'Drop table'), 
(22, 'Delete'), 
(22, 'Purge'), 
(22, 'Remove'),

(23, 'Neighbour set'), 
(23, 'Strong entity set'), 
(23, 'Owner set'), 
(23, 'Identifying set'),

(24, 'Delete from teaches;'), 
(24, 'Delete from teaches where Id =’Null’;'), 
(24, 'Remove table teaches;'), 
(24, 'Drop table teaches;'),

(25, 'Domain relational calculus'), 
(25, 'Tuple relational calculus'), 
(25, 'Relational algebra'), 
(25, 'Query language'),

(26, 'Left outer join'), 
(26, 'Inner join'), 
(26, 'Natural join'), 
(26, 'Right outer join'),

(27, '4NF'), 
(27, '2NF'), 
(27, '5NF'), 
(27, '3NF'),

(28, 'Schemas, Catalogs'), 
(28, 'Schemas, Environment'), 
(28, 'Environment, Schemas'), 
(28, 'Catalogs, Schemas'),

(29, 'Greater Entity Count'), 
(29, 'Minimum cardinality'), 
(29, 'Maximum cardinality'), 
(29, 'ERD'),

(30, 'db_sysadmin'), 
(30, 'db_accessadmin'), 
(30, 'db_securityadmin'), 
(30, 'db_setupadmin'),

(31, 'Dept_id should not be used in group by clause'), 
(31, 'Group by clause is not valid in this query'), 
(31, 'Avg(salary) should not be selected'), 
(31, 'None'),

(32, 'Object-oriented database management system'), 
(32, 'Relational database management system'), 
(32, 'Network database management system'), 
(32, 'Hierarchical database management system'),

(33, 'Where'), 
(33, 'Having'), 
(33, 'Group by'), 
(33, 'With'),

(34, 'Backup'), 
(34, 'Data Loading'), 
(34, 'Process Organization'), 
(34, 'File organization'),

(35, 'Network model between the tables that connect them'), 
(35, 'Parent-Child relationship between the tables that connects them'), 
(35, 'One to many relationship between the tables that connects them'), 
(35, 'All of the mentioned'),

(36, 'Pointers are used to maintain transactional integrity and consistency'), 
(36, 'Cursors are used to maintain transactional integrity and consistency'), 
(36, 'Locks are used to maintain transactional integrity and consistency'), 
(36, 'Triggers are used to maintain transactional integrity and consistency'),

(37, 'can be used as it is by the DBMS'), 
(37, 'stored on disk in an ASCII text format'), 
(37, 'all of the mentioned'), 
(37, 'none of the mentioned'),

(38, 'Clears entries from relation'), 
(38, 'Deletes relation'), 
(38, 'Deletes particular tuple from relation'), 
(38, 'All of the mentioned'),

(39, 'Create table . . . as'), 
(39, 'Create view as'), 
(39, 'Create table . . .like'), 
(39, 'With data'),

(40, 'select clause contains relation attribute names but not have expressions, aggregates, or distinct specification'), 
(40, 'from clause has 1 relation'), 
(40, 'query does not have group by or having clause'), 
(40, 'All of the mentioned'),

(41, 'Find the groups that make up the subtotal in a row'), 
(41, 'Create group-wise grand totals for the groups indicated in a GROUP BY clause'), 
(41, 'Group expressions or columns specified in a GROUP BY clause in one direction, from right to left, for computing the subtotals'), 
(41, 'To produce a cross-tabular report for computing subtotals by grouping phrases or columns given within a GROUP BY clause in all available directions'),

(42, 'Dot representation'), 
(42, 'Concatenation'), 
(42, 'Relational-and'), 
(42, 'All of the mentioned'),

(43, 'Data Described Language'), 
(43, 'Data Retrieval Language'), 
(43, 'Data Manipulation Language'), 
(43, 'Data Definition Language'),

(44, 'Ntil()'), 
(44, 'Newtil()'), 
(44, 'Rank()'), 
(44, 'All of the mentioned'),

(45, 'CREATE CLUSTER'), 
(45, 'CREATE PACKAGE'), 
(45, 'CREATE SCHEMA'), 
(45, 'All of the mentioned'),

(46, 'Primary key'), 
(46, 'Authorised key'), 
(46, 'Encryption key'), 
(46, 'Decryption key'),

(47, 'Dicing'), 
(47, 'Pivoting'), 
(47, 'Slicing'), 
(47, 'Both Pivoting and Dicing'),

(48, '4NF'), 
(48, '3NF'), 
(48, '2NF'), 
(48, '5NF'),

(49, 'RAID level 0'), 
(49, 'RAID level 1'), 
(49, 'RAID level 2'), 
(49, 'RAID level 3'),

(50, '{ }{ }Table_(1) { }(select *)'), 
(50, 'All of the mentioned'), 
(50, 'Endtables'), 
(50, 'Set_tables') ;
GO

