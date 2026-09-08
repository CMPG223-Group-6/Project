# Project
The Implementation stage of system analysis and design project. 

Zoo Information Management System (ZIMS)
User Guideline

1. System Requirements
Before using the system, ensure that the computer has the following:
  •	Operating System: Windows 10 or later 
  •	RAM: Minimum 8 GB  (Recommended 16 GB)
  •	Storage: At least 10 GB of available space (SSD recommended) 
  •	Processor: Intel Core i5 / AMD Ryzen 5 or better 
  •	Internet/Wi-Fi: Required for downloading and installing the necessary software and packages 
  •	Visual Studio Community: Installed 
  •	SQL Server: Installed 
  •	SQL Server Management Studio (SSMS): Installed 

2. Database Setup
The system uses Microsoft SQL Server for its database.
  • Step 1: Open SQL Server Management Studio
     - Open SQL Server Management Studio (SSMS) and connect to your SQL Server instance (Server Name - localhost).
  • Step 2: Create the Database
     - Create a new database called:
       - zims.db
  • Alternatively, the SQL scripts can be executed while connected to the default Master database if the script creates the database.

Step 3: Create the Tables
Open the provided:
  - zims.sql
  - Execute the script in SSMS. This will create the required tables and relationships for the system.

Step 4: Insert Initial Data
Open the provided:
 - zims_data_setup.sql
 - Execute the script after running zims.sql. This will insert the initial data required by the system.
Important: Run zims.sql first and zims.data.setup.sql second.

3. Running the System
   - Open Visual Studio Community. 
   - Open the ZIMS project/solution  (Project.sln). 
   - Connect Visual Studio to SSMS (1.Server Explorer, 2. Data Connections (right-click to add database), 3. Connect to database created on SSMS)
   - Ensure that the database connection string is correctly configured. 
   - Make sure SQL Server is running. 
   - Press Start ▶ or F5 to run the system. 
   - The system will open in the web browser. 

4. Tourist Login
First-time Tourist
If you are using the system for the first time as a tourist:
    1.	Select Register/Create Account. 
    2.	Enter your required details. 
    3.	Create your password. 
    4.	Submit the registration. 
    5.	Use your newly created account to log in. 
Existing Tourist
If you already have an account:
    1.	Enter your registered email address. 
    2.	Enter your password. 
    3.	Select Login. 

5. Staff and Admin Login
Initial Staff/Admin Login
The initial login credentials are:
   •	Email: Any email ending with @zims.com  (e.g. Admin@zims.com)
   •	Password: admin123 
Staff and Admin initially use these credentials to access the system.
Admin Access
Once inside the system, Admin access uses:
   •	Required on Maintain Event Form
   •	Email: admin@zims.com 
   •	Password: ZimsAdmin 
