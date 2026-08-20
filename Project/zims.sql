CREATE TABLE EVENTTYPE
(
	EventType_ID					int IDENTITY(1,1) PRIMARY KEY,
	Event_Name						varchar(100),
	Event_Dscription				varchar(100)
);

CREATE TABLE EVENT 
(
	Event_ID						int IDENTITY(1,1) PRIMARY KEY,
	EventType_ID					int,
	Event_Price						int,
	Max_Visitors					int,
	Spaces_Available				int,
	CONSTRAINT FK_EVENT_EVENTTYPE FOREIGN KEY(EventType_ID) REFERENCES EVENTTYPE(EventType_ID)
);

CREATE TABLE COUNTRY (
	COUNTRY_ID						int IDENTITY(1,1) PRIMARY KEY,
	Country_Name					varchar(35),
	Country_PhoneNumber				char(10),
	Country_Domains					varchar(100)
);

CREATE TABLE TOURIST (
	TOURIST_ID						int IDENTITY(1,1) PRIMARY KEY,
	Tourist_LastName				varchar(35),
	Tourist_FirstName				varchar(35),
	Contact_Number					char(10),
	Email_Address					varchar(20),
	User_Password					varchar(25),
	Country_ID						int
	CONSTRAINT FK_TOURIST_COUNTRY FOREIGN KEY(Country_ID) REFERENCES COUNTRY(Country_ID)
);

CREATE TABLE BOOKING
(
	Booking_ID						int IDENTITY(1,1) PRIMARY KEY,
	Event_ID						int,
	Tourist_ID						int,
	Number_Tickets					int,
	Arrive_Date						int,
	Questionnaires					varchar(100),
	Payment_method					varchar(20),
	Payment_Amount					money,
	Payment_Made					bit,
	CONSTRAINT FK_BOOKING_EVENT FOREIGN KEY(Event_ID) REFERENCES EVENT(Event_ID),
	CONSTRAINT FK_BOOKING_TOURIST FOREIGN KEY(Tourist_ID) REFERENCES TOURIST(Tourist_ID)
);