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
(2, 'Data of Binary Management System'), 
(2, 'Database Management System'), 
(2, 'Database Management Service'), 
(2, 'Data Backup Management System'),

(3, 'Organized collection of information that cannot be accessed, updated, and managed'), 
(3, 'Collection of data or information without organizing'), 
(3, 'Organized collection of data or information that can be accessed, updated, and managed'), 
(3, 'Organized collection of data that cannot be updated'),

(4, 'DBMS is a collection of queries'), 
(4, 'DBMS is a high-level language'), 
(4, 'DBMS is a programming language'), 
(4, 'DBMS stores, modifies and retrieves data'),

(5, 'Edgar Frank Codd'), 
(5, 'Charles Bachman'), 
(5, 'Charles Babbage'), 
(5, 'Sharon B. Codd'),

(6, 'Image oriented data'), 
(6, 'Text, files containing data'), 
(6, 'Data in the form of audio or video'), 
(6, 'All of the above'),

(7, 'Image'), 
(7, 'Text'), 
(7, 'Table'), 
(7, 'Graph'),

(8, 'Hierarchical'), 
(8, 'Network'), 
(8, 'Distributed'), 
(8, 'Decentralized'),

(9, 'MySQL'), 
(9, 'Microsoft Access'), 
(9, 'IBM DB2'), 
(9, 'Google'),

(10, 'Minimum Duplication and Redundancy of Data'), 
(10, 'High Level of Security'), 
(10, 'Single-user Access only'), 
(10, 'Support ACID Property'),

(11, 'No-backup for the data stored'), 
(11, 'User interface provided'), 
(11, 'Lack of Authentication'), 
(11, 'Store data in multiple locations'),

(12, 'Managing stored data'), 
(12, 'Manipulating data'), 
(12, 'Security for stored data'), 
(12, 'Analysing code'),

(13, 'Storing data'), 
(13, 'Providing multi-user access control'), 
(13, 'Data Integrity'), 
(13, 'All of the above'),

(14, 'Data'), 
(14, 'Data Languages'), 
(14, 'Data Manager'), 
(14, 'All of the above'),

(15, 'Relation set'), 
(15, 'Tuples'), 
(15, 'Entity set'), 
(15, 'Entity Relation model'),

(16, 'Hyper data'), 
(16, 'Tera data'), 
(16, 'Meta data'), 
(16, 'Relations'),

(17, 'Collection of Records'), 
(17, 'Collection of Keys'), 
(17, 'Collection of Tables'), 
(17, 'Collection of Fields'),

(18, 'Referential'), 
(18, 'Primary'), 
(18, 'Referencing'), 
(18, 'Specific'),

(19, 'Microphone'), 
(19, 'High speed, large capacity disk to store data'), 
(19, 'High-resolution video display'), 
(19, 'Printer'),

(20, 'Data and the DBMS'), 
(20, 'Application and SQL'), 
(20, 'Database application and the database'), 
(20, 'The user and the software'),

(21, 'TCL (Transaction Control Language)'), 
(21, 'DCL (Data Control Language)'), 
(21, 'DDL (Data Definition Language)'), 
(21, 'DML (Data Manipulation Language)'),

(22, 'Primary Key'), 
(22, 'Foreign key'), 
(22, 'Super key'), 
(22, 'Candidate key'),

(23, 'Drop table'), 
(23, 'Delete'), 
(23, 'Purge'), 
(23, 'Remove'),

(24, 'Neighbour set'), 
(24, 'Strong entity set'), 
(24, 'Owner set'), 
(24, 'Identifying set'),

(25, 'Delete from teaches;'), 
(25, 'Delete from teaches where Id =’Null’;'), 
(25, 'Remove table teaches;'), 
(25, 'Drop table teaches;'),

(26, 'Domain relational calculus'), 
(26, 'Tuple relational calculus'), 
(26, 'Relational algebra'), 
(26, 'Query language'),

(27, 'Left outer join'), 
(27, 'Inner join'), 
(27, 'Natural join'), 
(27, 'Right outer join'),

(28, '4NF'), 
(28, '2NF'), 
(28, '5NF'), 
(28, '3NF'),

(29, 'Schemas, Catalogs'), 
(29, 'Schemas, Environment'), 
(29, 'Environment, Schemas'), 
(29, 'Catalogs, Schemas'),

(30, 'Greater Entity Count'), 
(30, 'Minimum cardinality'), 
(30, 'Maximum cardinality'), 
(30, 'ERD'),

(31, 'db_sysadmin'), 
(31, 'db_accessadmin'), 
(31, 'db_securityadmin'), 
(31, 'db_setupadmin'),

(32, 'Dept_id should not be used in group by clause'), 
(32, 'Group by clause is not valid in this query'), 
(32, 'Avg(salary) should not be selected'), 
(32, 'None'),

(33, 'Object-oriented database management system'), 
(33, 'Relational database management system'), 
(33, 'Network database management system'), 
(33, 'Hierarchical database management system'),

(34, 'Where'), 
(34, 'Having'), 
(34, 'Group by'), 
(34, 'With'),

(35, 'Backup'), 
(35, 'Data Loading'), 
(35, 'Process Organization'), 
(35, 'File organization'),

(36, 'Network model between the tables that connect them'), 
(36, 'Parent-Child relationship between the tables that connects them'), 
(36, 'One to many relationship between the tables that connects them'), 
(36, 'All of the mentioned'),

(37, 'Pointers are used to maintain transactional integrity and consistency'), 
(37, 'Cursors are used to maintain transactional integrity and consistency'), 
(37, 'Locks are used to maintain transactional integrity and consistency'), 
(37, 'Triggers are used to maintain transactional integrity and consistency'),

(38, 'can be used as it is by the DBMS'), 
(38, 'stored on disk in an ASCII text format'), 
(38, 'all of the mentioned'), 
(38, 'none of the mentioned'),

(39, 'Clears entries from relation'), 
(39, 'Deletes relation'), 
(39, 'Deletes particular tuple from relation'), 
(39, 'All of the mentioned'),

(40, 'Create table . . . as'), 
(40, 'Create view as'), 
(40, 'Create table . . .like'), 
(40, 'With data'),

(41, 'select clause contains relation attribute names but not have expressions, aggregates, or distinct specification'), 
(41, 'from clause has 1 relation'), 
(41, 'query does not have group by or having clause'), 
(41, 'All of the mentioned'),

(42, 'Find the groups that make up the subtotal in a row'), 
(42, 'Create group-wise grand totals for the groups indicated in a GROUP BY clause'), 
(42, 'Group expressions or columns specified in a GROUP BY clause in one direction, from right to left, for computing the subtotals'), 
(42, 'To produce a cross-tabular report for computing subtotals by grouping phrases or columns given within a GROUP BY clause in all available directions'),

(43, 'Dot representation'), 
(43, 'Concatenation'), 
(43, 'Relational-and'), 
(43, 'All of the mentioned'),

(44, 'Data Described Language'), 
(44, 'Data Retrieval Language'), 
(44, 'Data Manipulation Language'), 
(44, 'Data Definition Language'),

(45, 'Ntil()'), 
(45, 'Newtil()'), 
(45, 'Rank()'), 
(45, 'All of the mentioned'),

(46, 'CREATE CLUSTER'), 
(46, 'CREATE PACKAGE'), 
(46, 'CREATE SCHEMA'), 
(46, 'All of the mentioned'),

(47, 'Primary key'), 
(47, 'Authorised key'), 
(47, 'Encryption key'), 
(47, 'Decryption key'),

(48, 'Dicing'), 
(48, 'Pivoting'), 
(48, 'Slicing'), 
(48, 'Both Pivoting and Dicing'),

(49, '4NF'), 
(49, '3NF'), 
(49, '2NF'), 
(49, '5NF'),

(50, 'RAID level 0'), 
(50, 'RAID level 1'), 
(50, 'RAID level 2'), 
(50, 'RAID level 3'),

(51, '{ }{ }Table_(1) { }(select *)'), 
(51, 'All of the mentioned'), 
(51, 'Endtables'), 
(51, 'Set_tables') ;
GO

