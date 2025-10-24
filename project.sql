create database project
use project
-- Branch Table
create table Branch (
    Branch_ID int primary key,
    Branch_Name varchar(20),
    Location varchar(20),
    IFSC_Code varchar(20) unique
);
-- Customer Table
create table Customer (
    Customer_ID int primary key,
    Name varchar(30) not null,
    DOB date,
    Address varchar(50),
    Phone_No varchar(15),
    Email varchar(30),
    Branch_ID int,
    foreign key (Branch_ID) references Branch(Branch_ID)
);
-- Employee Table
create table Employee (
    Employee_ID int primary key,
    Employee_Name varchar(30),
    Role varchar(20),
    Branch_ID int,
    Email varchar(30),
    Phone varchar(15),
    Hire_Date date,
    Salary varchar(10),
    foreign key (Branch_ID) references Branch(Branch_ID)
);
-- Account Table
create table Account (
    Account_ID int primary key,
    Customer_ID int,
    Branch_ID int,
    Account_Type varchar(20),
    Balance decimal(15,2),
    Open_Date date,
    Status varchar(20),
    foreign key (Customer_ID) references Customer(Customer_ID),
    foreign key (Branch_ID) references Branch(Branch_ID)
);
-- Card Table
create table Card (
    Card_ID int primary key,
    Account_ID int,
    Card_Number varchar(20) unique,
    Card_Type varchar(20),
    Expiry_Date date,
    CVV int,
    foreign key (Account_ID) references Account(Account_ID)
);
alter table card drop column cvv

-- Transaction Table
create table Transaction (
    Transaction_ID int primary key,
    Account_ID int,
    Transaction_Date datetime,
    Amount decimal(15,2),
    Transaction_Type varchar(50),
    Status varchar(20),
    foreign key (Account_ID) references Account(Account_ID)
);
-- Fraud_Report Table
create table Fraud_Report (
    Fraud_ID int primary key,
    Transaction_ID int,
    Fraud_Type varchar(50),
    Report_Date datetime,
    Description text,
    Status varchar(30),
    foreign key (Transaction_ID) references Transaction(Transaction_ID)
);
-- inserting records

insert into Branch (Branch_ID, Branch_Name, Location, IFSC_Code) values
(101, 'Main Branch', 'Chennai', 'BANK000101'),
(102, 'Anna Nagar Branch', 'Chennai', 'BANK000102'),
(103, 'Coimbatore Central', 'Coimbatore', 'BANK000103'),
(104, 'Madurai Main', 'Madurai', 'BANK000104'),
(105, 'Salem Branch', 'Salem', 'BANK000105'),
(106, 'Trichy Branch', 'Trichy', 'BANK000106'),
(107, 'Erode Branch', 'Erode', 'BANK000107'),
(108, 'Vellore Branch', 'Vellore', 'BANK000108'),
(109, 'Tirunelveli Branch', 'Tirunelveli', 'BANK000109'),
(110, 'Kanchipuram Branch', 'Kanchipuram', 'BANK000110'),
(111, 'Coimbatore East', 'Coimbatore', 'BANK000111'),
(112, 'Chennai North', 'Chennai', 'BANK000112'),
(113, 'Madurai East', 'Madurai', 'BANK000113'),
(114, 'Salem South', 'Salem', 'BANK000114'),
(115, 'Trichy North', 'Trichy', 'BANK000115'),
(116, 'Erode West', 'Erode', 'BANK000116'),
(117, 'Vellore South', 'Vellore', 'BANK000117'),
(118, 'Tirunelveli North', 'Tirunelveli', 'BANK000118'),
(119, 'Kanchipuram East', 'Kanchipuram', 'BANK000119'),
(120, 'Chennai Central', 'Chennai', 'BANK000120'),
(121, 'Coimbatore West', 'Coimbatore', 'BANK000121'),
(122, 'Madurai North', 'Madurai', 'BANK000122'),
(123, 'Salem East', 'Salem', 'BANK000123'),
(124, 'Trichy South', 'Trichy', 'BANK000124'),
(125, 'Erode North', 'Erode', 'BANK000125'),
(126, 'Vellore East', 'Vellore', 'BANK000126'),
(127, 'Tirunelveli South', 'Tirunelveli', 'BANK000127'),
(128, 'Kanchipuram South', 'Kanchipuram', 'BANK000128'),
(129, 'Chennai East', 'Chennai', 'BANK000129'),
(130, 'Coimbatore North', 'Coimbatore', 'BANK000130');


insert into Customer (Customer_ID, Name, DOB, Address, Phone_No, Email, Branch_ID) values
(201, 'Anand Kumar', '1990-03-15', '12 MG Road, Chennai', '9000011111', 'anand@gmail.com', 102),
(202, 'Lakshmi Devi', '1988-07-22', '45 Anna Nagar, Chennai', '9000011112', 'lakshmi@gmail.com', 102),
(203, 'Vikram Singh', '1995-11-10', '23 Race Course, Coimbatore', '9000011113', 'vikram@gmail.com', 103),
(204, 'Sita Ramesh', '1992-02-05', '78 KK Nagar, Madurai', '9000011114', 'sita@gmail.com', 114),
(205, 'Karthik B', '1998-09-25', '9 New Street, Salem', '9000011115', 'karthik@gmail.com', 115),
(206, 'Divya Nair', '1993-04-12', '15 Gandhi Road, Chennai', '9000011116', 'divya@gmail.com', 121),
(207, 'Ravi Chandran', '1985-06-30', '67 Lake View, Coimbatore', '9000011117', 'ravi@gmail.com', 103),
(208, 'Preethi Raj', '1999-11-19', '22 TVS Nagar, Madurai', '9000011118', 'preethi@gmail.com', 104),
(209, 'Manoj Kumar', '1987-08-23', '89 North Street, Salem', '9000011119', 'manoj@gmail.com', 115),
(210, 'Nisha Thomas', '1991-05-09', '34 Alwarpet, Chennai', '9000011120', 'nisha@gmail.com', 117),
(211, 'Sanjay Patel', '1990-10-10', '10 MG Street, Coimbatore', '9000011121', 'sanjay@gmail.com', 109),
(212, 'Pooja Sharma', '1997-02-11', '11 Gandhi Nagar, Chennai', '9000011122', 'pooja@gmail.com', 101),
(213, 'Rajesh Mehta', '1989-12-05', '55 Race Course, Coimbatore', '9000011123', 'rajesh@gmail.com', 123),
(214, 'Sneha Das', '1996-09-07', '19 KK Nagar, Madurai', '9000011124', 'sneha@gmail.com', 124),
(215, 'Arjun Reddy', '1993-03-03', '23 North Street, Salem', '9000011125', 'arjun@gmail.com', 115),
(216, 'Meena George', '1984-07-21', '10 MG Road, Chennai', '9000011126', 'meena@gmail.com', 111),
(217, 'Hari Prasad', '1992-01-17', '40 Anna Nagar, Chennai', '9000011127', 'hari@gmail.com', 102),
(218, 'Kavya Pillai', '1998-06-09', '77 Race Course, Coimbatore', '9000011128', 'kavya@gmail.com', 123),
(219, 'Rohit Menon', '1986-12-30', '88 KK Nagar, Madurai', '9000011129', 'rohit@gmail.com', 106),
(220, 'Priya Iyer', '1995-08-12', '5 New Street, Salem', '9000011130', 'priya@gmail.com', 106),
(221, 'Deepak S', '1991-11-01', '14 Gandhi Road, Chennai', '9000011131', 'deepak@gmail.com', 108),
(222, 'Anjali Rao', '1994-05-24', '56 Lake View, Coimbatore', '9000011132', 'anjali@gmail.com', 110),
(223, 'Vishal K', '1997-07-18', '33 TVS Nagar, Madurai', '9000011133', 'vishal@gmail.com', 110),
(224, 'Keerthi M', '1999-10-20', '17 North Street, Salem', '9000011134', 'keerthi@gmail.com', 120),
(225, 'Rahul Varma', '1988-09-16', '90 Alwarpet, Chennai', '9000011135', 'rahul@gmail.com', 130),
(226, 'Neha Gupta', '1996-02-02', '21 MG Street, Coimbatore', '9000011136', 'neha@gmail.com', 112),
(227, 'Vijay Anand', '1985-11-13', '44 Gandhi Nagar, Chennai', '9000011137', 'vijay@gmail.com', 121),
(228, 'Aishwarya N', '1993-12-25', '66 Race Course, Coimbatore', '9000011138', 'aishwarya@gmail.com', 103),
(229, 'Suresh Babu', '1992-04-04', '12 KK Nagar, Madurai', '9000011139', 'suresh@gmail.com', 104),
(230, 'Janani R', '1998-08-28', '8 New Street, Salem', '9000011140', 'janani@gmail.com', 116);

insert into Employee (Employee_ID, Employee_Name, Role, Branch_ID, Email, Phone, Hire_Date, Salary) values
(701, 'Ramesh Kumar', 'Branch Manager', 101, 'ramesh.kumar@bankcorp.com', '9876543210', '2018-02-15', 85000),
(702, 'Priya Sharma', 'Teller', 101, 'priya.sharma@bankcorp.com', '9876501123', '2020-06-10', 42000),
(703, 'Arun Das', 'Fraud Analyst', 102, 'arun.das@bankcorp.com', '9876502211', '2019-03-20', 65000),
(704, 'Deepa Menon', 'Customer Service', 103, 'deepa.menon@bankcorp.com', '9876503312', '2021-04-05', 40000),
(705, 'Rahul Nair', 'Loan Officer', 104, 'rahul.nair@bankcorp.com', '9876504455', '2017-11-12', 58000),
(706, 'Sneha Gupta', 'Fraud Investigator', 105, 'sneha.gupta@bankcorp.com', '9876505566', '2018-09-23', 72000),
(707, 'Karthik Reddy', 'Accountant', 106, 'karthik.reddy@bankcorp.com', '9876506677', '2019-07-15', 55000),
(708, 'Lakshmi Iyer', 'Cashier', 117, 'lakshmi.iyer@bankcorp.com', '9876507788', '2021-02-10', 38000),
(709, 'Anil Mehta', 'Security Officer', 108, 'anil.mehta@bankcorp.com', '9876508899', '2016-10-30', 46000),
(710, 'Divya Patel', 'Assistant Manager', 119, 'divya.patel@bankcorp.com', '9876509900', '2018-08-01', 72000),
(711, 'Vikram Singh', 'IT Officer', 121, 'vikram.singh@bankcorp.com', '9876511111', '2020-09-05', 60000),
(712, 'Neha Verma', 'Fraud Analyst', 112, 'neha.verma@bankcorp.com', '9876512222', '2021-06-12', 64000),
(713, 'Suresh Pillai', 'Loan Officer', 103, 'suresh.pillai@bankcorp.com', '9876513333', '2017-03-08', 59000),
(714, 'Pooja Joshi', 'Customer Service', 124, 'pooja.joshi@bankcorp.com', '9876514444', '2020-11-25', 41000),
(715, 'Ravi Shankar', 'Branch Manager', 115, 'ravi.shankar@bankcorp.com', '9876515555', '2016-01-19', 87000),
(716, 'Meena George', 'Fraud Investigator', 106, 'meena.george@bankcorp.com', '9876516666', '2018-10-10', 70000),
(717, 'Tarun Malhotra', 'Accountant', 107, 'tarun.malhotra@bankcorp.com', '9876517777', '2019-12-18', 53000),
(718, 'Asha Balan', 'Cashier', 128, 'asha.balan@bankcorp.com', '9876518888', '2022-03-14', 37000),
(719, 'Manoj Kumar', 'Fraud Analyst', 119, 'manoj.kumar@bankcorp.com', '9876519999', '2021-01-22', 66000),
(720, 'Shreya Dutta', 'Teller', 101, 'shreya.dutta@bankcorp.com', '9876520000', '2022-02-08', 40000),
(721, 'Ajay Jain', 'Security Officer', 106, 'ajay.jain@bankcorp.com', '9876521111', '2018-12-09', 47000),
(722, 'Nisha Rao', 'Assistant Manager', 129, 'nisha.rao@bankcorp.com', '9876522222', '2019-05-16', 69000),
(723, 'Vivek Iyer', 'Fraud Investigator', 130, 'vivek.iyer@bankcorp.com', '9876523333', '2017-07-21', 72000),
(724, 'Kiran Bhat', 'Loan Officer', 125, 'kiran.bhat@bankcorp.com', '9876524444', '2020-10-28', 60000),
(725, 'Leela Menon', 'Cashier', 106, 'leela.menon@bankcorp.com', '9876525555', '2021-08-03', 39000),
(726, 'Sanjay Rao', 'Fraud Analyst', 107, 'sanjay.rao@bankcorp.com', '9876526666', '2019-09-14', 65000),
(727, 'Preeti Nair', 'Customer Service', 108, 'preeti.nair@bankcorp.com', '9876527777', '2021-04-11', 42000),
(728, 'Mohit Singh', 'IT Officer', 110, 'mohit.singh@bankcorp.com', '9876528888', '2018-05-18', 61000),
(729, 'Ritika Ghosh', 'Branch Manager', 110, 'ritika.ghosh@bankcorp.com', '9876529999', '2016-09-07', 88000),
(730, 'Varun Sharma', 'Fraud Investigator', 110, 'varun.sharma@bankcorp.com', '9876530000', '2022-01-12', 68000);


insert into Account (Account_ID, Customer_ID, Branch_ID, Account_Type, Balance, Open_Date, Status) values
(301, 201, 101, 'Savings', 85000.00, '2020-05-10', 'Active'),
(302, 202, 112, 'Current', 150000.00, '2019-08-20', 'Active'),
(303, 203, 103, 'Savings', 60000.00, '2021-01-15', 'Active'),
(304, 204, 124, 'Savings', 45000.00, '2022-06-12', 'inActive'),
(305, 205, 105, 'Current', 120000.00, '2018-03-25', 'Active'),
(306, 206, 120, 'Savings', 52000.00, '2021-03-15', 'Active'),
(307, 207, 110, 'Current', 97000.00, '2020-11-05', 'Active'),
(308, 208, 101, 'Savings', 34000.00, '2022-08-01', 'Active'),
(309, 209, 105, 'Current', 155000.00, '2019-07-25', 'Active'),
(310, 210, 110, 'Savings', 48000.00, '2021-12-10', 'Active'),
(311, 211, 130, 'Current', 132000.00, '2019-09-30', 'Active'),
(312, 212, 117, 'Savings', 41000.00, '2022-03-19', 'inActive'),
(313, 213, 117, 'Savings', 66500.00, '2021-07-22', 'Active'),
(314, 214, 105, 'Savings', 23000.00, '2023-01-05', 'Active'),
(315, 215, 107, 'Current', 143000.00, '2020-04-18', 'Active'),
(316, 216, 103, 'Current', 98000.00, '2018-11-27', 'Active'),
(317, 217, 103, 'Savings', 56000.00, '2022-02-10', 'inActive'),
(318, 218, 102, 'Savings', 72000.00, '2021-05-09', 'inActive'),
(319, 219, 104, 'Current', 110000.00, '2020-09-12', 'Active'),
(320, 220, 104, 'Savings', 36000.00, '2023-03-21', 'Active'),
(321, 221, 105, 'Savings', 51000.00, '2021-08-08', 'Active'),
(322, 222, 125, 'Savings', 84000.00, '2020-07-15', 'Active'),
(323, 223, 127, 'Current', 124000.00, '2019-10-11', 'Active'),
(324, 224, 123, 'Savings', 29500.00, '2023-04-02', 'Active'),
(325, 225, 123, 'Current', 175000.00, '2018-02-18', 'Active'),
(326, 226, 119, 'Savings', 43000.00, '2022-05-05', 'Active'),
(327, 227, 129, 'Savings', 61500.00, '2021-06-23', 'Active'),
(328, 228, 110, 'Current', 99000.00, '2020-03-17', 'inActive'),
(329, 229, 130, 'Savings', 27000.00, '2022-10-10', 'Active'),
(330, 230, 109, 'Current', 134000.00, '2019-12-25', 'Active');

insert into Card (Card_ID, Account_ID, Card_Number, Card_Type, Expiry_Date) values
(601, 301, '4567123400011111', 'Debit', '2028-05-31'),
(602, 302, '4567123400012222', 'Credit', '2027-11-30'),
(603, 303, '4567123400013333', 'Debit', '2026-07-31'),
(604, 304, '4567123400014444', 'Debit', '2029-03-31'),
(605, 305, '4567123400015555', 'Credit', '2028-09-30'),
(606, 306, '4567123400016666', 'Debit', '2027-01-31'),
(607, 307, '4567123400017777', 'Credit', '2029-04-30'),
(608, 308, '4567123400018888', 'Debit', '2026-10-31'),
(609, 309, '4567123400019999', 'Credit', '2027-08-31'),
(610, 310, '4567123400020001', 'Debit', '2028-06-30'),
(611, 311, '4567123400020002', 'Credit', '2029-01-31'),
(612, 312, '4567123400020003', 'Debit', '2026-12-31'),
(613, 313, '4567123400020004', 'Debit', '2028-10-31'),
(614, 314, '4567123400020005', 'Debit', '2027-02-28'),
(615, 315, '4567123400020006', 'Credit', '2029-07-31'),
(616, 316, '4567123400020007', 'Credit', '2028-03-31'),
(617, 317, '4567123400020008', 'Debit', '2027-09-30'),
(618, 318, '4567123400020009', 'Debit', '2026-08-31'),
(619, 319, '4567123400020010', 'Credit', '2029-05-31'),
(620, 320, '4567123400020011', 'Debit', '2028-12-31'),
(621, 321, '4567123400020012', 'Debit', '2027-06-30'),
(622, 322, '4567123400020013', 'Debit', '2029-09-30'),
(623, 323, '4567123400020014', 'Credit', '2028-02-29'),
(624, 324, '4567123400020015', 'Debit', '2027-11-30'),
(625, 325, '4567123400020016', 'Credit', '2029-08-31'),
(626, 326, '4567123400020017', 'Debit', '2026-09-30'),
(627, 327, '4567123400020018', 'Debit', '2028-04-30'),
(628, 328, '4567123400020019', 'Credit', '2029-10-31'),
(629, 329, '4567123400020020', 'Debit', '2027-05-31'),
(630, 330, '4567123400020021', 'Credit', '2028-07-31');

insert into Transaction (Transaction_ID, Account_ID, Transaction_Date, Amount, Transaction_Type, Status) values
(401, 301, '2025-01-05', 5000.00, 'Withdrawal', 'Success'),
(402, 302, '2025-01-06', 12000.00, 'Deposit', 'Success'),
(403, 303, '2025-01-07', 2500.00, 'Transfer', 'Success'),
(404, 304, '2025-01-08', 15000.00, 'Withdrawal', 'Failed'),
(405, 305, '2025-01-09', 7500.00, 'Deposit', 'Success'),
(406, 306, '2025-01-10', 3000.00, 'Payment', 'Success'),
(407, 307, '2025-01-11', 9000.00, 'Withdrawal', 'Success'),
(408, 308, '2025-01-12', 4000.00, 'Transfer', 'Pending'),
(409, 309, '2025-01-13', 11000.00, 'Deposit', 'Success'),
(410, 310, '2025-01-14', 6000.00, 'Payment', 'Success'),
(411, 311, '2025-01-15', 8000.00, 'Withdrawal', 'Success'),
(412, 312, '2025-01-16', 2500.00, 'Deposit', 'Success'),
(413, 313, '2025-01-17', 7000.00, 'Transfer', 'Failed'),
(414, 314, '2025-01-18', 3500.00, 'Payment', 'Success'),
(415, 315, '2025-01-19', 15000.00, 'Deposit', 'Success'),
(416, 316, '2025-01-20', 9500.00, 'Withdrawal', 'Success'),
(417, 317, '2025-01-21', 2000.00, 'Payment', 'Pending'),
(418, 318, '2025-01-22', 6700.00, 'Transfer', 'Success'),
(419, 319, '2025-01-23', 3000.00, 'Deposit', 'Success'),
(420, 320, '2025-01-24', 2500.00, 'Withdrawal', 'Success'),
(421, 321, '2025-01-25', 8000.00, 'Deposit', 'Success'),
(422, 322, '2025-01-26', 2200.00, 'Payment', 'Failed'),
(423, 323, '2025-01-27', 12500.00, 'Withdrawal', 'Success'),
(424, 324, '2025-01-28', 4600.00, 'Transfer', 'Success'),
(425, 325, '2025-01-29', 14000.00, 'Deposit', 'Success'),
(426, 326, '2025-01-30', 3200.00, 'Payment', 'Success'),
(427, 327, '2025-02-01', 5800.00, 'Withdrawal', 'Success'),
(428, 328, '2025-02-02', 9100.00, 'Transfer', 'Pending'),
(429, 329, '2025-02-03', 4000.00, 'Deposit', 'Success'),
(430, 330, '2025-02-04', 13500.00, 'Withdrawal', 'Success');

insert into Fraud_Report (Fraud_ID, Transaction_ID, Fraud_Type, Report_Date, Description, Status) values
(501, 401, 'Phishing', '2025-01-06', 'Unauthorized withdrawal detected from online phishing scam.', 'Resolved'),
(502, 402, 'Card Skimming', '2025-01-07', 'ATM card cloned and used for deposit reversal.', 'Investigating'),
(503, 403, 'Account Takeover', '2025-01-08', 'Customer account accessed from unknown IP address.', 'Pending'),
(504, 404, 'Unauthorized Transfer', '2025-01-09', 'Failed transfer suspected as brute-force attempt.', 'Resolved'),
(505, 405, 'Money Laundering', '2025-01-10', 'Multiple deposits detected under different names.', 'Investigating'),
(506, 406, 'Fake Payment', '2025-01-11', 'Payment made using fraudulent credit card.', 'Resolved'),
(507, 407, 'Internal Fraud', '2025-01-12', 'Employee-assisted withdrawal beyond limit.', 'Pending'),
(508, 408, 'Phishing', '2025-01-13', 'Suspicious login from foreign location detected.', 'Resolved'),
(509, 409, 'Transaction Reversal', '2025-01-14', 'Deposit reversed without authorization.', 'Investigating'),
(510, 410, 'Identity Theft', '2025-01-15', 'Fake ID used to initiate card payment.', 'Pending'),
(511, 411, 'Fake Account', '2025-01-16', 'Account created with stolen personal details.', 'Resolved'),
(512, 412, 'Card Skimming', '2025-01-17', 'Duplicate ATM card detected in another city.', 'Investigating'),
(513, 413, 'Phishing', '2025-01-18', 'Customer shared OTP on fake website.', 'Resolved'),
(514, 414, 'Unauthorized Access', '2025-01-19', 'Multiple failed login attempts noted.', 'Pending'),
(515, 415, 'Money Laundering', '2025-01-20', 'High-value deposits with unclear source.', 'Investigating'),
(516, 416, 'Internal Fraud', '2025-01-21', 'Employee manually cleared suspicious withdrawal.', 'Resolved'),
(517, 417, 'Fake Payment', '2025-01-22', 'Payment reversed from unverified merchant.', 'Pending'),
(518, 418, 'Phishing', '2025-01-23', 'Fraudulent link shared via email.', 'Resolved'),
(519, 419, 'Card Skimming', '2025-01-24', 'Multiple swipes detected at compromised ATM.', 'Investigating'),
(520, 420, 'Identity Theft', '2025-01-25', 'Withdrawal made using fake KYC documents.', 'Resolved'),
(521, 421, 'Unauthorized Transfer', '2025-01-26', 'Transfer initiated from unknown device.', 'Pending'),
(522, 422, 'Phishing', '2025-01-27', 'Fraudulent email tricked customer to share PIN.', 'Resolved'),
(523, 423, 'Fake Account', '2025-01-28 ', 'Account opened using fake documents. ', 'Investigating'),
(524, 424, 'Money Laundering', '2025-01-29', 'Suspicious fund transfers between linked accounts.', 'Pending'),
(525, 425, 'Transaction Reversal', '2025-01-30', 'Reversal issued for failed transaction without logs.', 'Resolved'),
(526, 426, 'Unauthorized Access', '2025-01-31', 'Login from multiple devices in different states.', 'Investigating'),
(527, 427, 'Internal Fraud', '2025-02-01', 'Cashier manually approved unverified withdrawal.', 'Pending'),
(528, 428, 'Phishing', '2025-02-02', 'Customer redirected to fake banking portal.', 'Resolved'),
(529, 429, 'Identity Theft', '2025-02-03', 'Multiple accounts linked with same ID number.', 'Investigating'),
(530, 430, 'Fake Payment', '2025-02-04', 'Credit card used for unapproved online transaction.', 'Resolved');

select * from branch
select * from customer
select * from employee
select * from account
select * from card
select * from transaction
select * from fraud_report

alter table transaction
modify column transaction_date DATE;
alter table fraud_report
modify column report_date DATE;
update fraud_report set  report_date = '2025-01-28' where fraud_id=523

-- QUERYS
-- comparison operator 

-- The bank manager wants to find customers who have account balances greater than ₹50,000.
select round(balance),branch_id, customer_id, account_id from account where balance > 50000
-- HR wants to identify employees who are earning less than ₹40,000, so they can review pay adjustments.
select salary , employee_name, employee_id from employee where salary < 40000
-- The fraud department wants to see all reports where the status is not equal to 'Resolved'.
select fraud_id, fraud_type, status from fraud_report where status <> 'resolved'

-- aggregate function

-- Calculate the average balance for each branch.
select round(avg(balance)) , branch_id from account group by  branch_id
-- Find the highest transaction amount done in the bank.
select max(amount) from transaction
-- Count the number of transactions for each transaction type (Deposit, Withdrawal, Transfer, Payment)
select count(transaction_type) as count, transaction_type from transaction
group by transaction_type
-- List branches where the total account balance exceeds 500,000.
select round(sum(balance)) as account_balance, branch_id from account
group by branch_id having sum(balance) > 50000

-- logical function

-- The bank wants to identify customers who have balances greater than ₹50,000 and belong to branch 101 or 102.
select balance, customer_id, branch_id from account
where balance > 50000 and branch_id in (101,102)
-- Management wants to find transactions that are Withdrawals over ₹20,000 or Deposits below ₹1,000 — both are considered unusual.
select amount, transaction_type from transaction 
where (transaction_type='withdrawal' and amount > 20000) or (transaction_type='deposit' and amount < 1000)
-- The fraud team wants to find all fraud reports not yet resolved and where fraud type is either “Phishing” or “Card Skimming.”
select status,fraud_type,transaction_id from fraud_report 
where status <> 'resolved' and (fraud_type='phishing' or fraud_type='card skimming')
-- HR wants to find employees who are managers or have salary above ₹60,000, but not from branch 102.
select Employee_ID, employee_Name, Role, Salary, Branch_ID from Employee
where (Role = 'Manager' or Salary > 60000) and Branch_ID <> 102;

-- limit, like, between and, distinct

-- The manager wants to view the top 5 customers who have the highest account balance.
select customer_id, balance from account order by balance desc limit 5
-- The bank wants to check the latest 3 transactions recorded.
select transaction_id, account_id, amount, transaction_date from transaction order by transaction_date desc limit 3
-- The manager wants a list of customers whose names start with the letter 'A'.
select name from customer where name like "a%"
-- HR wants to find employees whose role includes the word “Manager.”
select branch_id, employee_name, role from employee where role like "%manager%"
-- Audit team wants to list all transactions where amount is between ₹10,000 and ₹30,000.
select transaction_id, amount from transaction where amount between 10000 and 30000
-- Find all accounts that were opened between 2024-01-01 and 2024-12-31.
select account_id, customer_id, open_date from account where open_date between '2022-01-01' and '2022-12-31'
-- Find all unique branches that have at least one account.
select distinct branch_id from account
-- Get all unique transaction types from the transaction table.
select distinct transaction_type from transaction

-- joins

-- List all customers along with their account details.
select a.customer_id, a.name, b.account_id, b.account_type, b.balance
from customer as a 
join account as b on a.customer_id=b.customer_id
-- Show all transactions along with the customer’s name who made them.
select a.customer_id, a.name, b.transaction_id, b.amount 
from transaction as b
join account as c on c.account_id = b.account_id
join customer as a on a.customer_id = c.customer_id
-- Find all accounts that do not have a card issued.
select a.account_id, b.name ,c.card_id
from account as a
join customer as b on a.customer_id=b.customer_id
join card as c on a.account_id=c.account_id
where c.card_id is null;
-- Display all fraud reports along with the customer name who owns the account involved in the fraud.
select a.customer_id,a.name,b.account_id,c.transaction_id,d.fraud_type
from customer as a
join account as b on a.customer_id=b.customer_id
join transaction as c on b.account_id=c.account_id
join fraud_report as d on c.transaction_id=d.transaction_id

-- joins with where, group by,having, order by

-- Find the total balance per branch for active accounts only, and show branches with total balance over ₹100,000, sorted by total balance descending.
select b.branch_id,b.branch_name, sum(a.balance) as tbalance
from branch as b
join account as a on a.branch_id-b.branch_id
where a.status='active'
group by b.branch_id,b.branch_name
having sum(a.balance) > 100000
order by tbalance desc
-- Calculate the average transaction amount for each account type (Savings, Current), only for transactions above ₹1,000, and sort by average descending.
select round(avg(t.amount),2),a.account_type
from transaction as t
join account as a on a.account_id= t.account_id
where t.amount > 1000
group by a.account_type
order by avg(t.amount) desc
-- Find the number of frauds reported for each branch, only include branches with more than 5 frauds, and sort by branch ID ascending.
select b.branch_id, b.branch_name, count(f.fraud_id)
from fraud_report as f
join transaction as t on t.transaction_id=f.transaction_id
join account as a on a.account_id=t.account_id
join branch as b on b.branch_id=a.branch_id
group by b.branch_id,b.branch_name 
having count(f.fraud_id) > 5
order by b.branch_id asc
-- Find the top 3 customers who have the highest total transaction amount, considering only completed transactions.
select c.customer_id, c.name, sum(t.amount)
from customer as c 
join account as a on a.customer_id=c.customer_id
join transaction as t on a.account_id=t.account_id
where t.status='success'
group by c.customer_id, c.name
order by sum(t.amount) desc
limit 3
-- List all branches that have reported more than 2 different types of frauds, along with the number of fraud types.
select b.branch_id, b.branch_name, count(f.fraud_type)
from branch as b
join account as a on a.branch_id=b.branch_id
join transaction as t on a.account_id= t.account_id
join fraud_report as f on f.transaction_id= t.transaction_id
group by b.branch_id, b.branch_name
having count(f.fraud_type) > 2
order by count(f.fraud_type) desc

-- union and union all

-- The manager wants a list of customers from branch 101 or branch 102 in a single result set.
select customer_id,branch_id,name
from customer where branch_id=101
union
select customer_id,branch_id,name
from customer where branch_id=102
-- or
select customer_id,branch_id,name
from customer where branch_id=101 or branch_id=102
-- Get a combined list of all customers and employees from branch 101 or 102, showing their branch and role/type.
select c.customer_id,c.name,a.account_id,b.branch_id
from customer as c
join account as a on a.customer_id=c.customer_id
join branch as b on b.branch_id=c.branch_id
where c.branch_id=101 or c.branch_id=102
union
select e.employee_id,e.employee_name,e.role, b.branch_id
from employee as e
join branch as b on e.branch_id=b.branch_id
where e.branch_id=102 or e.branch_id=101
-- Get a combined list of all customers from branch 101 and all employees from branch 102, keeping all records, including duplicates if any, along with branch names.
select c.Customer_ID AS Person_ID, c.Name AS Person_Name, b.Branch_Name, 'Customer' AS Role_Type
from Customer as c
join Branch as b ON c.Branch_ID = b.Branch_ID
where c.Branch_ID = 101
union all
select e.Employee_ID AS Person_ID, e.employee_Name AS Person_Name, b.Branch_Name, e.Role AS Role_Type
from Employee as e
join Branch as b ON e.Branch_ID = b.Branch_ID
where e.Branch_ID = 102;

-- veiw

-- list every customer with their branch name.
create view branch_customer_list as 
select c.customer_id, c.name,b.branch_name
from customer as c
join branch as b on b.branch_id=c.branch_id
-- show each customer’s accounts and balances.
create view customer_balance as 
select c.customer_id, c.name, a.account_id, a.balance
from customer as c
join account as a on a.customer_id=c.customer_id

select * from branch_customer_list
select * from customer_balance

-- subquery

-- Get all customers whose balance is higher than the overall average balance.
select c.customer_id, c.name, c.branch_id, a.balance 
from customer as c 
join account as a on a.customer_id=c.customer_id
where c.customer_id in (select customer_id from account 
where balance > ( select avg(balance) from account));
-- Identify all transactions where the amount is greater than the average of all transactions.
select transaction_id, account_id, amount from transaction
where amount > (select avg(amount) from transaction)

-- stored procedure

/* The bank manager wants to regularly check customers with balances above a certain amount in a specific branch.
Instead of writing a query every time, we can create a stored procedure that accepts two inputs. */
delimiter $$
create procedure customerbalance(in branchid int, in cus_bal int)
begin
	select
		c.customer_id,c.name, b.branch_name,a.account_id,a.balance
        from customer as c
        join account as a on c.customer_id=a.customer_id
        join branch as b on b.branch_id=c.branch_id
        where c.Branch_ID = branchid
		and a.Balance > cus_bal
		order by a.Balance desc;
end $$
delimiter ;
/* The fraud investigation team often needs to review all fraud cases reported within a specific time period (for example, for weekly or monthly reports).
Instead of writing a new query each time, they can call a stored procedure that accepts two dates as inputs.*/
delimiter $$
create procedure fraudreport(in startdate date , in enddate date)
begin
	select
		f.fraud_id, f.transaction_id,a.account_id,c.customer_id,c.name, f.fraud_type
        from fraud_report as f
        join transaction as t on t.transaction_id=f.transaction_id
        join account as a on a.account_id=t.account_id
        join customer as c on a.customer_id=c.customer_id
        where f.report_date between startdate and enddate
        order by f.report_date asc;
end $$
delimiter ;

call customerbalance (104, 1000);
call fraudreport ('2025-01-01', '2025-01-20')

-- conditional funcation

-- Classify customers into “Low”, “Medium”, or “High” balance categories based on the sample account balances we generated
select c.customer_id,c.name,a.balance, 
case
	when a.balance < 50000 then 'low'
    when a.balance between 50000 and 70000 then 'medium'
    else 'high'
end as bal_cat
from customer as c
join account as a on a.customer_id=c.customer_id
order by a.balance asc;

-- We want to mark transactions above ₹20,000 as “High”, otherwise “Low”.
select transaction_id, account_id, amount,
if (amount > 5000, 'high', 'low') as level
from transaction
order by amount asc;