CREATE TABLE EVENTTYPE
(
	EventType_ID					int IDENTITY(1,1) PRIMARY KEY,
	Event_Name						varchar(30),
	Event_Description				varchar(100)
);

CREATE TABLE EVENT 
(
	Event_ID						int IDENTITY(1,1) PRIMARY KEY,
	EventType_ID					int,
	Event_Price						money,
	Max_Visitors					int,
	Tickets_Available               int,
	Status                         varchar(10),
	CONSTRAINT FK_EVENT_EVENTTYPE FOREIGN KEY(EventType_ID) REFERENCES EVENTTYPE(EventType_ID)
);

CREATE TABLE COUNTRY (
	COUNTRY_ID						int IDENTITY(1,1) PRIMARY KEY,
	Country_Name					varchar(40),
	Country_PhoneNumber				char(10),
	Country_Domains					varchar(100)
);

CREATE TABLE TOURIST (
	TOURIST_ID						int IDENTITY(1,1) PRIMARY KEY,
	Tourist_LastName				varchar(30),
	Tourist_FirstName				varchar(30),
	Contact_Number					char(10),
	Email_Address					varchar(30),
	User_Password					varchar(255),
	Country_ID						int
	CONSTRAINT FK_TOURIST_COUNTRY FOREIGN KEY(Country_ID) REFERENCES COUNTRY(Country_ID)
);

CREATE TABLE BOOKING
(
	Booking_ID						int IDENTITY(1,1) PRIMARY KEY,
	Event_ID						int FOREIGN KEY(Event_ID) REFERENCES EVENT(Event_ID),
	Tourist_ID						int FOREIGN KEY(Tourist_ID) REFERENCES TOURIST(Tourist_ID),
	Number_Tickets					int,
	Arrive_Date						date,
	Questionnaires					varchar(100),
	Payment_method					varchar(20),
	Payment_Amount					money,
	Amount_Owed						money,
	Payment_Made					bit,
	Checked_In						bit,
	Checked_Out						bit
);