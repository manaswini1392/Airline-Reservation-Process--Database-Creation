/* -- Database for Airline Reservation --
*--Create passenger Table to fetch passenger details */
create table passenger
  (passenger_id NUMBER(6) CONSTRAINT pss_p_id PRIMARY KEY,
  first_name VARCHAR2(20),
  last_name VARCHAR2(25) CONSTRAINT pss_lname_nn NOT NULL,
  email VARCHAR2(25) CONSTRAINT pss_email_nn NOT NULL
  CONSTRAINT pss_email_uk UNIQUE,
  phone_number VARCHAR2(20),
  p_address_line1 VARCHAR2(100),
  p_state VARCHAR2(10),
  p_zipcode NUMBER(6),
  unique_identification VARCHAR2(20) CONSTRAINT pss_uid_nn NOT NULL
  );
/*-- Create Payment Table to fetch the payment details */
create table payment
  (payment_id NUMBER(6) CONSTRAINT pmt_p_id PRIMARY KEY,
  amount NUMBER(10),
  payment_date DATE CONSTRAINT pmt_date_nn NOT NULL,
  payment_status VARCHAR2(10) CONSTRAINT pmt_sts_nn NOT NULL,
  payment_method VARCHAR2(20)
  );
/*-- Create Flights Table to fetch Flights Details */
create table flights
  (flight_id NUMBER(6) CONSTRAINT flg_p_id PRIMARY KEY,
  departure_city VARCHAR(20) CONSTRAINT flg_dc_nn NOT NULL,
  arrival_city VARCHAR(20) CONSTRAINT flg_ac_nn NOT NULL
  );

/*-- Create table Schedule to fetch the flight schedule details */
create table schedule
  (schedule_id NUMBER(6) CONSTRAINt sch_p_id PRIMARY KEY,
  departure_datetime TIMESTAMP,
  flight_id NUMBER(6) CONSTRAINT sch_fk_fid REFERENCES flights(flight_id),
  arrival_datetime TIMESTAMP CONSTRAINT sch_adt_nn NOT NULL,
  seats_available NUMBER(6),
  fare NUMBER(8,2) CONSTRAINT sch_fare_nn NOT NULL,
  flight_status VARCHAR(20)
  );
  
/*-- Create Table Booking to fetch the booking details of passenger */
create table booking
    (booking_id NUMBER(6) CONSTRAINT bkg_p_id PRIMARY KEY,
    passenger_id NUMBER(6) CONSTRAINT bkg_fk_id REFERENCES passenger(passenger_id),
    payment_id NUMBER(6) CONSTRAINT bkg_fk_pmtid REFERENCES payment(payment_id),
    schedule_id NUMBER(6) CONSTRAINT bkg_fk_fid REFERENCES schedule(schedule_id),
    status VARCHAR(20)
    );
    
/*-- Insert values into table Passenger */
insert into passenger values(101,'Pallavi','Singh','pallavi@gmail.com','123456789','#415 250 main Hartford','CT',06106,'J17798');
insert into passenger values(102,'Pranitha','Buddiga','pranitha@gmail.com','234567890','#236 250 main Hartford','CT',06106,'PK798');
insert into passenger values(103,'Manaswini','Rayappureddi','manaswini@gmail.com','345678901','#333 250 main Hartford','NJ',05825,'MNS798');
insert into passenger values(104,'Deepak','Sisodia','deepak@gmail.com','456789012','#302 9 fredric clemens','TX',06105,'DS7758');
insert into passenger values(105,'Vinod','Nakkala','vinod@gmail.com','567890123','#902 360 main dallas','LA',12345,'VN8632');

/*-- Insert values into table Flights */
insert into flights values(4536,'Hartford','Denver');
insert into flights values(4537,'Hartford','Denver');
insert into flights values(7860,'New York','SanFrancisco');
insert into flights values(7861,'New York','SanFrancisco');
insert into flights values(1234,'New York','Dallas');
insert into flights values(6789,'Dallas','Denver');
insert into flights values(5432,'San Deigo','Hartford');

/*-- Insert values into table Payment */
insert into payment values(012345,500,'01-Jan-2016','CNF','Credit Card');
insert into payment values(012346,700,'04-Feb-2016','CNF','Debit Card');
insert into payment values(012347,600,'13-Apr-2016','CNF','Net banking');
insert into payment values(012348,500,'15-Jul-2015','CNF','Credit Card');
insert into payment values(012349,800,'27-Jan-2016','Failed','Credit Card');
insert into payment values(012350,750,'19-Aug-2015','CNF','Debit Card');
insert into payment values(012351,900,'17-Aug-2015','CNF','Net Banking');
insert into payment values(012352,580,'06-Jan-2016','CNF','Credit Card');
insert into payment values(012353,550,'10-Oct-2016','Failed','Debit Card');

/*-- Insert value into table schedule */
insert into schedule values(1101,'31-Dec-15 10:30:00 PM',4536,'01-Jan-16 03:00:00 AM',34 ,500.00,'Reached');
insert into schedule values(1102,'31-Dec-15 10:00:00 AM',4537,'31-Dec-15 03:00:00 PM',02 ,650.00,'Reached');
insert into schedule values(1103,'31-Dec-15 11:30:00 AM',7860,'31-Dec-15 07:00:00 PM',00 ,700.00,'Reached');
insert into schedule values(1104,'31-Dec-15 07:30:00 AM',7861,'31-Dec-15 02:30:00 PM',04 ,800.00,'Reached');
insert into schedule values(1105,'31-Dec-15 10:30:00 PM',1234,'31-Dec-15 11:55:00 PM',03 ,600.00,'Reached');
insert into schedule values(1106,'31-Dec-15 06:30:00 AM',6789,'31-Dec-15 09:30:00 AM',02 ,350.00,'Reached');
insert into schedule values(1107,'31-Dec-15 08:30:00 PM',5432,'31-Dec-15 11:30:00 PM',00 ,500.00,'Reached');

insert into schedule values(1108,'01-Feb-16 10:30:00 PM',4536,'02-Feb-16 03:00:00 AM',02 ,500.00,'Reached');
insert into schedule values(1109,'01-Feb-16 10:00:00 AM',4537,'01-Feb-16 03:00:00 PM',02 ,650.00,'Reached');
insert into schedule values(1110,'01-Feb-16 11:30:00 AM',7860,'01-Feb-16 07:00:00 PM',00 ,700.00,'Reached');
insert into schedule values(1111,'01-Feb-16 07:30:00 AM',7861,'01-Feb-16 02:30:00 PM',04 ,800.00,'Reached');
insert into schedule values(1112,'01-Feb-16 10:30:00 PM',1234,'01-Feb-16 11:55:00 PM',03 ,600.00,'Reached');
insert into schedule values(1113,'01-Feb-16 06:30:00 AM',6789,'01-Feb-16 09:30:00 AM',02 ,350.00,'Reached');
insert into schedule values(1114,'01-Feb-16 08:30:00 PM',5432,'01-Feb-16 11:30:00 PM',00 ,500.00,'Reached');

insert into schedule values(1115,'15-Jul-16 10:30:00 PM',4536,'16-Jul-16 03:00:00 AM',32 ,500.00,'Scheduled');
insert into schedule values(1116,'15-Jul-16 10:00:00 AM',4537,'15-Jul-16 03:00:00 PM',14 ,650.00,'Scheduled');
insert into schedule values(1117,'15-Jul-16 11:30:00 AM',7860,'15-Jul-16 07:00:00 PM',52 ,700.00,'Scheduled');
insert into schedule values(1118,'15-Jul-16 07:30:00 AM',7861,'15-Jul-16 02:30:00 PM',34 ,800.00,'Scheduled');
insert into schedule values(1119,'15-Jul-16 10:30:00 PM',1234,'15-Jul-16 11:55:00 PM',09 ,600.00,'Scheduled');
insert into schedule values(1120,'15-Jul-16 06:30:00 AM',6789,'15-Jul-16 09:30:00 AM',26 ,350.00,'Scheduled');
insert into schedule values(1121,'15-Jul-16 08:30:00 PM',5432,'15-Jul-16 11:30:00 PM',00 ,500.00,'Scheduled');

insert into schedule values(1122,'27-Aug-16 10:30:00 PM',4536,'28-Aug-16 03:00:00 AM',32 ,800.00,'Scheduled');
insert into schedule values(1123,'27-Aug-16 10:00:00 AM',4537,'27-Aug-16 03:00:00 PM',14 ,350.00,'Scheduled');
insert into schedule values(1124,'27-Aug-16 11:30:00 AM',7860,'27-Aug-16 07:00:00 PM',52 ,500.00,'Scheduled');
insert into schedule values(1125,'27-Aug-16 07:30:00 AM',7861,'27-Aug-16 02:30:00 PM',34 ,330.00,'Scheduled');
insert into schedule values(1126,'27-Aug-16 10:30:00 PM',1234,'27-Aug-16 11:55:00 PM',09 ,620.00,'Scheduled');
insert into schedule values(1127,'27-Aug-16 06:30:00 AM',6789,'27-Aug-16 09:30:00 AM',26 ,350.00,'Scheduled');
insert into schedule values(1128,'27-Aug-16 08:30:00 PM',5432,'27-Aug-16 11:30:00 PM',00 ,250.00,'Scheduled');

/*-- Insert values into booking tables */
insert into booking values(111,101,12345,1107,'CNF');
insert into booking values(112,101,12349,1125,'FAILED');
insert into booking values(113,102,12348,1109,'CNF');
insert into booking values(114,102,12350,1103,'CNF');
insert into booking values(115,102,12352,1116,'CNF');
insert into booking values(116,103,12347,1128,'CNF');
insert into booking values(117,103,12351,1121,'CNF');
insert into booking values(118,105,12346,1107,'CNF');
insert into booking values(119,105,12353,1104,'FAILED');