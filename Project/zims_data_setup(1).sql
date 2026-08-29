<<<<<<<< HEAD:Project/zims_data_setup(1).sql
========
-- =========================================================
-- SCHEMA FIX-UP (run once before inserting data)
-- =========================================================
-- Your TOURIST.User_Password column is currently varchar(25).
-- A SHA256 hash rendered as hex is 64 characters, so the column
-- needs to be widened to varchar(255) as requested.
ALTER TABLE TOURIST ALTER COLUMN User_Password varchar(255);

>>>>>>>> origin/Hans:Project/zims_data_setup(2).sql
-- =========================================================
-- ZIMS DATA SETUP
-- Updated to match current zims.sql schema:
--   EVENT now has Tickets_Available + Status (not Spaces_Available)
-- 10 rows inserted per table (COUNTRY keeps the full reference list,
-- sorted alphabetically by Country_Name)
-- =========================================================

-- ---------------------------------------------------------
-- EVENTTYPE (10 rows)
-- ---------------------------------------------------------
INSERT INTO EVENTTYPE (Event_Name, Event_Description) VALUES
('Safari Tour', 'Guided tour through the wildlife safari zone'),
('Bird Show', 'Live bird show featuring exotic and rare species'),
('Night Zoo Experience', 'After-hours guided tour of nocturnal animals'),
('Reptile Encounter', 'Up-close encounter with snakes and reptiles'),
('Big Cat Feeding', 'Watch keepers feed lions and tigers'),
('Primate Walk', 'Walking tour through the primate enclosures'),
<<<<<<<< HEAD:Project/zims_data_setup(1).sql
('Aquarium Tour', 'Guided tour of the marine and freshwater aquarium'),
('Elephant Interaction', 'Supervised interaction with the resident elephant herd'),
('Behind the Scenes Tour', 'Access to keeper areas and animal care facilities'),
('Kids Petting Zoo', 'Hands-on petting zoo experience for children');
========
('Marine Life Show', 'Interactive show featuring seals and marine animals'),
('Behind the Scenes Tour', 'Backstage tour of animal care facilities'),
('Kids Petting Zoo', 'Hands-on animal interaction session for children'),
('Sunset Safari', 'Evening safari tour to see animals at dusk');
>>>>>>>> origin/Hans:Project/zims_data_setup(2).sql

-- ---------------------------------------------------------
-- EVENT (10 rows) - EventType_ID 1-10 correspond to rows above
-- Status: Active, Inactive, Full
-- ---------------------------------------------------------
INSERT INTO EVENT (EventType_ID, Event_Price, Max_Visitors, Tickets_Available, Status) VALUES
(1, 150.00, 50, 50, 'Active'),
<<<<<<<< HEAD:Project/zims_data_setup(1).sql
(2, 100.00, 30, 0,  'Full'),
(3, 200.00, 20, 12, 'Active'),
(4, 120.00, 25, 25, 'Active'),
(5, 180.00, 40, 0,  'Full'),
(6, 90.00,  35, 20, 'Active'),
(7, 110.00, 45, 45, 'Active'),
(8, 250.00, 15, 5,  'Active'),
(9, 300.00, 10, 10, 'Inactive'),
(10, 80.00, 60, 30, 'Active');

-- ---------------------------------------------------------
-- COUNTRY (full reference list, alphabetical by Country_Name)
========
(2, 100.00, 30, 0, 'Full'),
(3, 200.00, 20, 12, 'Active'),
(4, 120.00, 25, 25, 'Active'),
(5, 180.00, 40, 5, 'Active'),
(6, 90.00, 35, 35, 'Active'),
(7, 160.00, 45, 0, 'Full'),
(8, 250.00, 15, 15, 'Inactive'),
(9, 80.00, 30, 20, 'Active'),
(10, 175.00, 40, 40, 'Active');

-- ---------------------------------------------------------
-- COUNTRY (all countries, alphabetical by Country_Name)
>>>>>>>> origin/Hans:Project/zims_data_setup(2).sql
-- ---------------------------------------------------------
INSERT INTO COUNTRY (Country_Name, Country_PhoneNumber, Country_Domains) VALUES
('Afghanistan', '93', '.af'),
('Albania', '355', '.al'),
('Algeria', '213', '.dz'),
('Andorra', '376', '.ad'),
('Angola', '244', '.ao'),
('Argentina', '54', '.ar'),
('Armenia', '374', '.am'),
('Australia', '61', '.au'),
('Austria', '43', '.at'),
('Azerbaijan', '994', '.az'),
('Bahamas', '1242', '.bs'),
('Bahrain', '973', '.bh'),
('Bangladesh', '880', '.bd'),
('Barbados', '1246', '.bb'),
('Belarus', '375', '.by'),
('Belgium', '32', '.be'),
('Belize', '501', '.bz'),
('Benin', '229', '.bj'),
('Bhutan', '975', '.bt'),
('Bolivia', '591', '.bo'),
('Bosnia and Herzegovina', '387', '.ba'),
('Botswana', '267', '.bw'),
('Brazil', '55', '.br'),
('Brunei', '673', '.bn'),
('Bulgaria', '359', '.bg'),
('Burkina Faso', '226', '.bf'),
('Burundi', '257', '.bi'),
('Cambodia', '855', '.kh'),
('Cameroon', '237', '.cm'),
('Canada', '1', '.ca'),
('Cape Verde', '238', '.cv'),
('Central African Republic', '236', '.cf'),
('Chad', '235', '.td'),
('Chile', '56', '.cl'),
('China', '86', '.cn'),
('Colombia', '57', '.co'),
('Comoros', '269', '.km'),
('Costa Rica', '506', '.cr'),
('Croatia', '385', '.hr'),
('Cuba', '53', '.cu'),
('Cyprus', '357', '.cy'),
('Czech Republic', '420', '.cz'),
('Denmark', '45', '.dk'),
('Djibouti', '253', '.dj'),
('Dominica', '1767', '.dm'),
('Dominican Republic', '1809', '.do'),
('Ecuador', '593', '.ec'),
('Egypt', '20', '.eg'),
('El Salvador', '503', '.sv'),
('Equatorial Guinea', '240', '.gq'),
('Eritrea', '291', '.er'),
('Estonia', '372', '.ee'),
('Eswatini', '268', '.sz'),
('Ethiopia', '251', '.et'),
('Fiji', '679', '.fj'),
('Finland', '358', '.fi'),
('France', '33', '.fr'),
('Gabon', '241', '.ga'),
('Gambia', '220', '.gm'),
('Georgia', '995', '.ge'),
('Germany', '49', '.de'),
('Ghana', '233', '.gh'),
('Greece', '30', '.gr'),
('Grenada', '1473', '.gd'),
('Guatemala', '502', '.gt'),
('Guinea', '224', '.gn'),
('Guinea-Bissau', '245', '.gw'),
('Guyana', '592', '.gy'),
('Haiti', '509', '.ht'),
('Honduras', '504', '.hn'),
('Hungary', '36', '.hu'),
('Iceland', '354', '.is'),
('India', '91', '.in'),
('Indonesia', '62', '.id'),
('Iran', '98', '.ir'),
('Iraq', '964', '.iq'),
('Ireland', '353', '.ie'),
('Israel', '972', '.il'),
('Italy', '39', '.it'),
('Jamaica', '1876', '.jm'),
('Japan', '81', '.jp'),
('Jordan', '962', '.jo'),
('Kazakhstan', '7', '.kz'),
('Kenya', '254', '.ke'),
('Kiribati', '686', '.ki'),
('Kosovo', '383', '.xk'),
('Kuwait', '965', '.kw'),
('Kyrgyzstan', '996', '.kg'),
('Laos', '856', '.la'),
('Latvia', '371', '.lv'),
('Lebanon', '961', '.lb'),
('Lesotho', '266', '.ls'),
('Liberia', '231', '.lr'),
('Libya', '218', '.ly'),
('Liechtenstein', '423', '.li'),
('Lithuania', '370', '.lt'),
('Luxembourg', '352', '.lu'),
('Madagascar', '261', '.mg'),
('Malawi', '265', '.mw'),
('Malaysia', '60', '.my'),
('Maldives', '960', '.mv'),
('Mali', '223', '.ml'),
('Malta', '356', '.mt'),
('Marshall Islands', '692', '.mh'),
('Mauritania', '222', '.mr'),
('Mauritius', '230', '.mu'),
('Mexico', '52', '.mx'),
('Micronesia', '691', '.fm'),
('Moldova', '373', '.md'),
('Monaco', '377', '.mc'),
('Mongolia', '976', '.mn'),
('Montenegro', '382', '.me'),
('Morocco', '212', '.ma'),
('Mozambique', '258', '.mz'),
('Myanmar', '95', '.mm'),
('Namibia', '264', '.na'),
('Nauru', '674', '.nr'),
('Nepal', '977', '.np'),
('Netherlands', '31', '.nl'),
('New Zealand', '64', '.nz'),
('Nicaragua', '505', '.ni'),
('Niger', '227', '.ne'),
('Nigeria', '234', '.ng'),
('North Korea', '850', '.kp'),
('North Macedonia', '389', '.mk'),
('Norway', '47', '.no'),
('Oman', '968', '.om'),
('Pakistan', '92', '.pk'),
('Palau', '680', '.pw'),
('Panama', '507', '.pa'),
('Papua New Guinea', '675', '.pg'),
('Paraguay', '595', '.py'),
('Peru', '51', '.pe'),
('Philippines', '63', '.ph'),
('Poland', '48', '.pl'),
('Portugal', '351', '.pt'),
('Qatar', '974', '.qa'),
('Romania', '40', '.ro'),
('Russia', '7', '.ru'),
('Rwanda', '250', '.rw'),
('Saint Kitts and Nevis', '1869', '.kn'),
('Saint Lucia', '1758', '.lc'),
('Saint Vincent and the Grenadines', '1784', '.vc'),
('Samoa', '685', '.ws'),
('San Marino', '378', '.sm'),
('Sao Tome and Principe', '239', '.st'),
('Saudi Arabia', '966', '.sa'),
('Senegal', '221', '.sn'),
('Serbia', '381', '.rs'),
('Seychelles', '248', '.sc'),
('Sierra Leone', '232', '.sl'),
('Singapore', '65', '.sg'),
('Slovakia', '421', '.sk'),
('Slovenia', '386', '.si'),
('Solomon Islands', '677', '.sb'),
('Somalia', '252', '.so'),
('South Africa', '27', '.za'),
('South Korea', '82', '.kr'),
('South Sudan', '211', '.ss'),
('Spain', '34', '.es'),
('Sri Lanka', '94', '.lk'),
('Sudan', '249', '.sd'),
('Suriname', '597', '.sr'),
('Sweden', '46', '.se'),
('Switzerland', '41', '.ch'),
('Syria', '963', '.sy'),
('Taiwan', '886', '.tw'),
('Tajikistan', '992', '.tj'),
('Tanzania', '255', '.tz'),
('Thailand', '66', '.th'),
('Timor-Leste', '670', '.tl'),
('Togo', '228', '.tg'),
('Tonga', '676', '.to'),
('Trinidad and Tobago', '1868', '.tt'),
('Tunisia', '216', '.tn'),
('Turkey', '90', '.tr'),
('Turkmenistan', '993', '.tm'),
('Tuvalu', '688', '.tv'),
('Uganda', '256', '.ug'),
('Ukraine', '380', '.ua'),
('United Arab Emirates', '971', '.ae'),
('United Kingdom', '44', '.uk'),
('United States', '1', '.us'),
('Uruguay', '598', '.uy'),
('Uzbekistan', '998', '.uz'),
('Vanuatu', '678', '.vu'),
('Vatican City', '379', '.va'),
('Venezuela', '58', '.ve'),
('Vietnam', '84', '.vn'),
('Yemen', '967', '.ye'),
('Zambia', '260', '.zm'),
('Zimbabwe', '263', '.zw');
<<<<<<<< HEAD:Project/zims_data_setup(1).sql

-- ---------------------------------------------------------
-- TOURIST (10 rows) - Country_ID resolved via subquery on Country_Name
-- ---------------------------------------------------------
INSERT INTO TOURIST (Tourist_LastName, Tourist_FirstName, Contact_Number, Email_Address, User_Password, Country_ID) VALUES
('Smith', 'John', '0123456789', 'john.smith@mail.com', 'Passw0rd1', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'United States')),
('Nkosi', 'Thandi', '0731234567', 'thandi.n@mail.com', 'Passw0rd2', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'South Africa')),
('Tanaka', 'Yuki', '0819876543', 'yuki.tanaka@mail.com', 'Passw0rd3', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'Japan')),
('Muller', 'Hans', '0827654321', 'hans.muller@mail.com', 'Passw0rd4', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'Germany')),
('Dubois', 'Claire', '0839988776', 'claire.dubois@mail.com', 'Passw0rd5', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'France')),
('Rossi', 'Marco', '0845566778', 'marco.rossi@mail.com', 'Passw0rd6', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'Italy')),
('Silva', 'Ana', '0851122334', 'ana.silva@mail.com', 'Passw0rd7', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'Brazil')),
('Kim', 'Ji-woo', '0863344556', 'jiwoo.kim@mail.com', 'Passw0rd8', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'South Korea')),
('Patel', 'Raj', '0874455667', 'raj.patel@mail.com', 'Passw0rd9', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'India')),
('Van Wyk', 'Marie', '0885566778', 'marie.vanwyk@mail.com', 'Passw0rd10', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'South Africa'));

-- ---------------------------------------------------------
-- BOOKING (10 rows) - Event_ID 1-10 and Tourist_ID 1-10 from above
========

-- ---------------------------------------------------------
-- TOURIST (10 rows) - Country_ID references COUNTRY table above
-- User_Password values are SHA256 hashes (hex, 64 chars) of:
-- Passw0rd1 ... Passw0rd10 respectively
-- ---------------------------------------------------------
INSERT INTO TOURIST (Tourist_LastName, Tourist_FirstName, Contact_Number, Email_Address, User_Password, Country_ID) VALUES
('Smith', 'John', '0123456789', 'john.smith@mail.com', '963ef1140e817de9c8597680a08c4a70aea11b67cf74a4716a1b05ad9a00d11a', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'United States')),
('Nkosi', 'Thandi', '0731234567', 'thandi.n@mail.com', '64036712376af58109c972db893bf7e87b3a5a06a4bcd5aa1e5d1e069b43a9dc', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'South Africa')),
('Tanaka', 'Yuki', '0819876543', 'yuki.tanaka@mail.com', '1315b953403a0187945db10de6b2fd184a3ae87b50d28f664146391b92874f20', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'Japan')),
('Muller', 'Hans', '0827654321', 'hans.muller@mail.com', 'f108cefe68f8acc8f087858a720e47bd95808717b81a3b1dfd4e71f88b32e30d', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'Germany')),
('Dubois', 'Claire', '0765432198', 'claire.dubois@mail.com', '6b3a372bb8bf8198aa58288806594eed2d9b39700e2da58ab83b468094d352f8', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'France')),
('Silva', 'Mateus', '0712349876', 'mateus.silva@mail.com', 'd7bf65dc21a91361160c3cb545df9865771a6366bc1d2f464ab440665fdf7620', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'Brazil')),
('Khumalo', 'Lindiwe', '0798765432', 'lindiwe.k@mail.com', '371f1b44aef8e69cc82aae3db23ee871056b075499f5c55e98a594b85bad5290', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'South Africa')),
('Wilson', 'Emma', '0834567891', 'emma.wilson@mail.com', 'f3dc74ef369d0b2efd38315c06549f148c545c14017bb174af19eab7c8702dbf', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'United Kingdom')),
('Kim', 'Min-Jun', '0845678912', 'minjun.kim@mail.com', '881dba74a9f1791c929ff76f76c99127db92cf7a6874bfcc49b0ecc92730aca6', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'South Korea')),
('Patel', 'Anjali', '0856789123', 'anjali.patel@mail.com', '826469e0811957da693c88823ea545fb16fc3b504a1967b69cc32fbe59d4bc8e', (SELECT Country_ID FROM COUNTRY WHERE Country_Name = 'India'));

-- ---------------------------------------------------------
-- BOOKING (10 rows) - Event_ID 1-10, Tourist_ID 1-10 from above
>>>>>>>> origin/Hans:Project/zims_data_setup(2).sql
-- ---------------------------------------------------------
INSERT INTO BOOKING (Event_ID, Tourist_ID, Number_Tickets, Arrive_Date, Questionnaires, Payment_method, Payment_Amount, Payment_Made) VALUES
(1, 1, 2, '2026-09-10', 'None', 'Credit Card', 300.00, 1),
(2, 2, 4, '2026-09-15', 'Allergic to peanuts', 'Cash', 400.00, 0),
(3, 3, 1, '2026-09-20', 'None', 'Debit Card', 200.00, 1),
<<<<<<<< HEAD:Project/zims_data_setup(1).sql
(4, 4, 3, '2026-09-12', 'None', 'Credit Card', 360.00, 1),
(5, 5, 2, '2026-09-18', 'Wheelchair access needed', 'EFT', 360.00, 1),
(6, 6, 5, '2026-09-22', 'None', 'Cash', 450.00, 0),
(7, 7, 1, '2026-09-25', 'None', 'Credit Card', 110.00, 1),
(8, 8, 2, '2026-09-14', 'Vegetarian meal request', 'Debit Card', 500.00, 1),
(9, 9, 4, '2026-09-30', 'None', 'EFT', 1200.00, 0),
(10, 10, 3, '2026-09-28', 'None', 'Cash', 240.00, 1);
========
(4, 4, 3, '2026-09-12', 'Wheelchair access required', 'Credit Card', 360.00, 1),
(5, 5, 2, '2026-09-18', 'None', 'EFT', 360.00, 0),
(6, 6, 5, '2026-09-22', 'Vegetarian meal preference', 'Cash', 450.00, 1),
(7, 7, 2, '2026-09-25', 'None', 'Credit Card', 320.00, 1),
(8, 8, 1, '2026-09-14', 'None', 'Debit Card', 250.00, 0),
(9, 9, 4, '2026-09-28', 'None', 'Cash', 320.00, 1),
(10, 10, 2, '2026-09-30', 'Allergic to bee stings', 'Credit Card', 350.00, 1);
>>>>>>>> origin/Hans:Project/zims_data_setup(2).sql
