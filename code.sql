-- create a leadership management system database
create database LeardershipMgtSys;
-- use database
use LeardershipMgtSys;
-- Create table for Leaders
CREATE TABLE Leaders (
    Leader_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Role VARCHAR(50),
    Experience_Level VARCHAR(50)
);

-- Create table for Projects
CREATE TABLE Projects (
    Project_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Start_Date DATE,
    End_Date DATE,
    Status VARCHAR(50),
    Leader_ID INT,
    FOREIGN KEY (Leader_ID) REFERENCES Leaders(Leader_ID)
);

-- Create table for Tasks
CREATE TABLE Tasks (
    Task_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Priority VARCHAR(50),
    Deadline DATE,
    Status VARCHAR(50),
    Assigned_Time INT,
    Project_ID INT,
    FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID)
);

-- Create table for Team Members
CREATE TABLE Team_Members (
    Member_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Role VARCHAR(50),
    Availability VARCHAR(50)
);

-- Create table for Time Logs
CREATE TABLE Time_Logs (
    Log_ID INT PRIMARY KEY,
    Task_ID INT,
    Member_ID INT,
    Hours_Spent DECIMAL(5,2),
    Date DATE,
    FOREIGN KEY (Task_ID) REFERENCES Tasks(Task_ID),
    FOREIGN KEY (Member_ID) REFERENCES Team_Members(Member_ID)
);

-- Create table for Meetings
CREATE TABLE Meetings (
    Meeting_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Date DATE,
    Duration INT, -- in minutes
    Leader_ID INT,
    Project_ID INT,
    FOREIGN KEY (Leader_ID) REFERENCES Leaders(Leader_ID),
    FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID)
);
-- Insert data into Leaders
INSERT INTO Leaders (Leader_ID, Name, Email, Role, Experience_Level)
VALUES
(1, 'Alice Johnson', 'alice.johnson@email.com', 'Project Manager', 'Senior'),
(2, 'Bob Smith', 'bob.smith@email.com', 'Team Leader', 'Mid-Level'),
(3, 'Charlie Brown', 'charlie.brown@email.com', 'Team Lead', 'Mid-Level'),
(4, 'Diana Prince', 'diana.prince@email.com', 'Program Director', 'Senior'),
(5, 'Edward Walker', 'edward.walker@email.com', 'Project Lead', 'Junior'),
(6, 'Fiona Green', 'fiona.green@email.com', 'Team Manager', 'Senior'),
(7, 'George Martin', 'george.martin@email.com', 'Operations Lead', 'Mid-Level'),
(8, 'Hannah Williams', 'hannah.williams@email.com', 'Lead Consultant', 'Senior'),
(9, 'Irene Adams', 'irene.adams@email.com', 'Team Lead', 'Junior'),
(10, 'Jack Davis', 'jack.davis@email.com', 'Project Coordinator', 'Junior'),
(11, 'Kathy Moore', 'kathy.moore@email.com', 'Director of Operations', 'Senior'),
(12, 'Liam Clark', 'liam.clark@email.com', 'Leadership Trainer', 'Mid-Level');


-- Insert data into Projects
INSERT INTO Projects (Project_ID, Name, Description, Start_Date, End_Date, Status, Leader_ID)
VALUES
(101, 'Leadership Development Program', 'A program to enhance leadership skills for employees.', '2025-05-01', '2025-12-31', 'In Progress', 1),
(102, 'Time Management Initiative', 'A project to improve time management across teams.', '2025-06-01', '2025-11-30', 'Planned', 2),
(103, 'Employee Engagement Initiative', 'A project to enhance employee engagement and retention strategies.', '2025-07-01', '2025-12-31', 'Planned', 3),
(104, 'Agile Transformation Program', 'Initiative to transition the company to Agile project management.', '2025-08-01', '2025-11-30', 'In Progress', 4),
(105, 'Sales Process Optimization', 'Improvement of the sales process to reduce cycle time and increase conversion rates.', '2025-06-15', '2025-10-31', 'In Progress', 5),
(106, 'Customer Experience Improvement', 'Enhance customer experience through various strategies and tools.', '2025-07-15', '2025-12-15', 'Planned', 6),
(107, 'HR Process Revamp', 'Revamping the HR processes to increase efficiency and employee satisfaction.', '2025-05-15', '2025-09-30', 'In Progress', 7),
(108, 'Product Development Cycle', 'Develop new products based on market research and customer feedback.', '2025-06-01', '2025-12-31', 'Planned', 8),
(109, 'Time Efficiency Research', 'A research project focused on improving time management across teams.', '2025-05-01', '2025-09-30', 'In Progress', 9),
(110, 'Leadership Skills Training', 'A training program aimed at developing leadership skills for middle management.', '2025-06-10', '2025-10-10', 'Planned', 10),
(111, 'Tech Stack Migration', 'Move the company’s tech stack to a more modern and efficient platform.', '2025-07-01', '2025-12-31', 'In Progress', 11),
(112, 'Brand Awareness Campaign', 'A campaign to increase brand awareness in new markets.', '2025-06-15', '2025-12-31', 'Planned', 12);


-- Insert data into Tasks
INSERT INTO Tasks (Task_ID, Name, Description, Priority, Deadline, Status, Assigned_Time, Project_ID)
VALUES
(1001, 'Develop Leadership Training Module', 'Create content for the leadership development course.', 'High', '2025-06-15', 'In Progress', 120, 101),
(1002, 'Analyze Team Time Logs', 'Review team time logs and provide feedback.', 'Medium', '2025-06-10', 'Not Started', 40, 102),
(1003, 'Conduct Leadership Survey', 'Survey employees to assess current leadership effectiveness.', 'High', '2025-06-01', 'Not Started', 50, 103),
(1004, 'Develop Agile Training Modules', 'Create content for Agile training for staff.', 'High', '2025-08-15', 'In Progress', 100, 104),
(1005, 'Analyze Sales Data', 'Evaluate sales data to identify opportunities for process improvements.', 'Medium', '2025-07-10', 'Not Started', 80, 105),
(1006, 'Develop Customer Feedback Tools', 'Create tools for gathering and analyzing customer feedback.', 'High', '2025-07-20', 'Not Started', 120, 106),
(1007, 'Revise HR Onboarding Process', 'Revise and streamline the onboarding process for new hires.', 'High', '2025-06-30', 'In Progress', 60, 107),
(1008, 'Prototype New Product', 'Develop initial prototype for new product concept.', 'High', '2025-08-30', 'In Progress', 150, 108),
(1009, 'Conduct Time Efficiency Workshops', 'Facilitate workshops on improving time management for teams.', 'Medium', '2025-06-25', 'Not Started', 40, 109),
(1010, 'Create Leadership Training Sessions', 'Design and deliver leadership training for mid-level managers.', 'High', '2025-07-15', 'In Progress', 200, 110),
(1011, 'Migrate Database to New Tech Stack', 'Move all current data to the new database system.', 'High', '2025-09-01', 'Not Started', 300, 111),
(1012, 'Develop Marketing Materials', 'Create marketing materials for the brand awareness campaign.', 'Medium', '2025-08-10', 'Not Started', 60, 112);


-- Insert data into Team Members
INSERT INTO Team_Members (Member_ID, Name, Email, Role, Availability)
VALUES
(201, 'John Doe', 'john.doe@email.com', 'Trainer', 'Full-Time'),
(202, 'Jane Lee', 'jane.lee@email.com', 'Analyst', 'Part-Time'),
(203, 'Michael Richards', 'michael.richards@email.com', 'Developer', 'Full-Time'),
(204, 'Olivia Harris', 'olivia.harris@email.com', 'Designer', 'Part-Time'),
(205, 'Paul Walker', 'paul.walker@email.com', 'Business Analyst', 'Full-Time'),
(206, 'Quinn Edwards', 'quinn.edwards@email.com', 'Project Coordinator', 'Full-Time'),
(207, 'Rachel Adams', 'rachel.adams@email.com', 'HR Specialist', 'Part-Time'),
(208, 'Samuel Clark', 'samuel.clark@email.com', 'Trainer', 'Full-Time'),
(209, 'Tina Parker', 'tina.parker@email.com', 'Marketing Specialist', 'Full-Time'),
(210, 'Ursula Scott', 'ursula.scott@email.com', 'Developer', 'Full-Time'),
(211, 'Victor Johnson', 'victor.johnson@email.com', 'Sales Specialist', 'Part-Time'),
(212, 'Wendy Brown', 'wendy.brown@email.com', 'Content Writer', 'Full-Time');


-- Insert data into Time Logs
INSERT INTO Time_Logs (Log_ID, Task_ID, Member_ID, Hours_Spent, Date)
VALUES
(301, 1001, 201, 4.5, '2025-05-20'),
(302, 1002, 202, 3.0, '2025-05-22'),
(303, 1003, 203, 6.5, '2025-05-20'),
(304, 1004, 204, 8.0, '2025-05-22'),
(305, 1005, 205, 7.5, '2025-06-02'),
(306, 1006, 206, 5.0, '2025-06-03'),
(307, 1007, 207, 4.0, '2025-06-05'),
(308, 1008, 208, 10.0, '2025-06-08'),
(309, 1009, 209, 3.5, '2025-06-10'),
(310, 1010, 210, 12.0, '2025-06-12'),
(311, 1011, 211, 15.0, '2025-06-15'),
(312, 1012, 212, 5.5, '2025-06-18');

-- Insert data into Meetings
INSERT INTO Meetings (Meeting_ID, Title, Date, Duration, Leader_ID, Project_ID)
VALUES
(401, 'Project Kickoff Meeting', '2025-05-01', 60, 1, 101),
(402, 'Project Review Meeting', '2025-06-15', 45, 2, 102),
(403, 'Leadership Program Overview', '2025-05-05', 90, 1, 101),
(404, 'Agile Implementation Kickoff', '2025-07-01', 60, 4, 104),
(405, 'Sales Data Review', '2025-06-10', 45, 5, 105),
(406, 'Customer Feedback Strategy', '2025-07-05', 75, 6, 106),
(407, 'HR Process Optimization', '2025-06-20', 60, 7, 107),
(408, 'New Product Development', '2025-06-25', 120, 8, 108),
(409, 'Team Time Management Strategies', '2025-06-15', 45, 9, 109),
(410, 'Leadership Training Session', '2025-07-01', 90, 10, 110),
(411, 'Tech Stack Transition Meeting', '2025-07-10', 90, 11, 111),
(412, 'Brand Awareness Discussion', '2025-07-12', 60, 12, 112);

-- Creating Stored Procedure
DELIMITER //

CREATE PROCEDURE RunLeadershipMgtQueries()
BEGIN
    -- 1. List all leaders
    SELECT * FROM Leaders;

    -- 2. List all projects with their assigned leader's name
    SELECT P.Project_ID, P.Name AS Project_Name, L.Name AS Leader_Name
    FROM Projects P
    JOIN Leaders L ON P.Leader_ID = L.Leader_ID;

    -- 3. Projects that are currently in progress
    SELECT * FROM Projects WHERE Status = 'In Progress';

    -- 4. Tasks with high priority
    SELECT * FROM Tasks WHERE Priority = 'High';

    -- 5. Team members with full-time availability
    SELECT * FROM Team_Members WHERE Availability = 'Full-Time';

    -- 6. Tasks assigned to each project
    SELECT Project_ID, COUNT(*) AS Task_Count FROM Tasks GROUP BY Project_ID;

    -- 7. Total hours spent by each member
    SELECT Member_ID, SUM(Hours_Spent) AS Total_Hours FROM Time_Logs GROUP BY Member_ID;

    -- 8. Meetings scheduled for a specific leader (example: Leader_ID = 1)
    SELECT * FROM Meetings WHERE Leader_ID = 1;

    -- 9. Deadline approaching tasks (within next 15 days from today)
    SELECT * FROM Tasks WHERE Deadline BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 15 DAY);

    -- 10. Tasks not started yet
    SELECT * FROM Tasks WHERE Status = 'Not Started';

    -- 11. Completed hours per task
    SELECT Task_ID, SUM(Hours_Spent) AS Hours_Logged FROM Time_Logs GROUP BY Task_ID;

    -- 12. Projects handled by senior-level leaders
    SELECT P.* FROM Projects P
    JOIN Leaders L ON P.Leader_ID = L.Leader_ID
    WHERE L.Experience_Level = 'Senior';

    -- 13. Average time spent on tasks
    SELECT AVG(Hours_Spent) AS Average_Hours_Per_Task FROM Time_Logs;

    -- 14. Task details with assigned time and hours spent
    SELECT T.Task_ID, T.Name, T.Assigned_Time, SUM(TL.Hours_Spent) AS Logged_Hours
    FROM Tasks T
    LEFT JOIN Time_Logs TL ON T.Task_ID = TL.Task_ID
    GROUP BY T.Task_ID;

    -- 15. Number of meetings per project
    SELECT Project_ID, COUNT(*) AS Meeting_Count FROM Meetings GROUP BY Project_ID;

    -- 16. Members who have logged more than 10 hours
    SELECT Member_ID, SUM(Hours_Spent) AS Total_Hours FROM Time_Logs
    GROUP BY Member_ID
    HAVING Total_Hours > 10;

    -- 17. Leaders who are managing more than one project
    SELECT Leader_ID, COUNT(*) AS Project_Count FROM Projects
    GROUP BY Leader_ID
    HAVING Project_Count > 1;

    -- 18. List of all team members with no time logs
    SELECT * FROM Team_Members
    WHERE Member_ID NOT IN (SELECT DISTINCT Member_ID FROM Time_Logs);

    -- 19. Time log entries by date
    SELECT Date, COUNT(*) AS Log_Entries FROM Time_Logs GROUP BY Date;

    -- 20. Tasks overdue (Deadline before today and not completed)
    SELECT * FROM Tasks
    WHERE Deadline < CURDATE() AND Status != 'Completed';

END //

DELIMITER ;

-- calling stroed procedure

call RunLeadershipMgtQueries();


			
