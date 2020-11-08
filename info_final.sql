CREATE DATABASE transport;
SHOW databases;
USE transport;

CREATE TABLE Airline (airline_name varchar(20) NOT NULL, PRIMARY KEY (airline_name) );

INSERT INTO Airline (airline_name) VALUES ('IndiGo');
INSERT INTO Airline (airline_name) VALUES ('SpiceJet');
INSERT INTO Airline (airline_name) VALUES ('GoAir');
INSERT INTO Airline (airline_name) VALUES ('Vistara');

CREATE TABLE Airplane (airline_code varchar(10) NOT NULL, vehicle_id int NOT NULL, date_of_manufacture date, model varchar(15), PRIMARY KEY (airline_code, vehicle_id) );

INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('6E', 8089, '2015-07-06', 'Airbus A320 CEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('6E', 7117, '2017-08-21', 'Airbus A321 NEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('6E', 6321, '2015-02-11', 'Airbus A320 NEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('6E', 7231, '2014-06-23', 'Airbus A320 CEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('6E', 9122, '2016-11-06', 'Airbus A321 NEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('SG', 2176, '2014-05-16', 'Boeing 737-700');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('SG', 5732, '2017-03-16', 'Boeing 737-700');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('SG', 2766, '2018-01-19', 'Boeing 737-700');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('SG', 3628, '2015-12-13', 'Boeing 737-700');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('SG', 4579, '2016-03-15', 'Boeing 737-800');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('G8', 4398, '2017-04-22', 'Airbus A320 CEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('G8', 8597, '2012-04-20', 'Airbus A320 CEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('G8', 4595, '2015-03-21', 'Airbus A320 CEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('G8', 9537, '2013-09-14', 'Airbus A320 CEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('UK', 3856, '2018-10-13', 'Airbus A320 NEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('UK', 9164, '2018-10-01', 'Airbus A321 NEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('UK', 8337, '2016-10-23', 'Airbus A321 NEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('UK', 3336, '2017-11-13', 'Airbus A320 NEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('UK', 8226, '2016-06-27', 'Airbus A320 NEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('UK', 7544, '2018-10-12', 'Airbus A321 NEO');
INSERT INTO Airplane (airline_code, vehicle_id, date_of_manufacture, model) VALUES ('UK', 4399, '2017-04-12', 'Airbus A320 NEO');

CREATE TABLE Codename (airline_code varchar(10) NOT NULL, airline varchar(15) NOT NULL, PRIMARY KEY (airline_code), FOREIGN KEY (airline) REFERENCES Airline(airline_name), FOREIGN KEY (airline_code) REFERENCES Airplane(airline_code) );

INSERT INTO Codename (airline_code, airline) VALUES ('6E', 'IndiGo');
INSERT INTO Codename (airline_code, airline) VALUES ('SG', 'SpiceJet');
INSERT INTO Codename (airline_code, airline) VALUES ('G8', 'GoAir');
INSERT INTO Codename (airline_code, airline) VALUES ('UK', 'Vistara');

CREATE TABLE Airport (airport_code varchar(20) NOT NULL, city varchar(20), country varchar(20), airport_name varchar(40), PRIMARY KEY (airport_code) );

INSERT INTO Airport (airport_code, city, country, airport_name) VALUES ('BOM', 'Mumbai', 'India', 'Mumbai International Airport');
INSERT INTO Airport (airport_code, city, country, airport_name) VALUES ('COK', 'Kochi', 'India', 'Cochin International Airport');
INSERT INTO Airport (airport_code, city, country, airport_name) VALUES ('BLR', 'Bengaluru', 'India', 'Kempegowda International Airport');
INSERT INTO Airport (airport_code, city, country, airport_name) VALUES ('MAA', 'Chennai', 'India', 'Chennai International Airport');
INSERT INTO Airport (airport_code, city, country, airport_name) VALUES ('IXR', 'Ranchi', 'India', 'Birsa Munda Airport');
INSERT INTO Airport (airport_code, city, country, airport_name) VALUES ('IDR', 'Indore', 'India', 'Devi Ahilyabai Holkar Airport');

CREATE TABLE Terminal (terminal_number int NOT NULL, airport_code varchar(20) NOT NULL, journey_id int, PRIMARY KEY (terminal_number, airport_code) );

INSERT INTO Terminal (terminal_number, journey_id, airport_code) VALUES (5, 65453, 'BLR');
INSERT INTO Terminal (terminal_number, journey_id, airport_code) VALUES (4, 65409, 'IDR');
INSERT INTO Terminal (terminal_number, journey_id, airport_code) VALUES (22, 27322, 'BOM');
INSERT INTO Terminal (terminal_number, journey_id, airport_code) VALUES (20, 27262, 'IXR');
INSERT INTO Terminal (terminal_number, journey_id, airport_code) VALUES (1, 78431, 'MAA');
INSERT INTO Terminal (terminal_number, journey_id, airport_code) VALUES (19, 32723, 'COK');
INSERT INTO Terminal (terminal_number, journey_id, airport_code) VALUES (30, 65520, 'IXR');
INSERT INTO Terminal (terminal_number, journey_id, airport_code) VALUES (17, 65420, 'MAA');
INSERT INTO Terminal (terminal_number, journey_id, airport_code) VALUES (16, 65620, 'COK');
INSERT INTO Terminal (terminal_number, journey_id, airport_code) VALUES (40, 27266, 'IDR');

CREATE TABLE Journey (journey_id int NOT NULL, arrival_time datetime, departure_time datetime, airline_code varchar(20), vehicle_id int, terminal_no int, home_terminal int, airport_code varchar(20), PRIMARY KEY (journey_id), FOREIGN KEY (airline_code, vehicle_id) REFERENCES Airplane(airline_code, vehicle_id), FOREIGN KEY (terminal_no, airport_code) REFERENCES Terminal(terminal_number, airport_code) );

INSERT INTO Journey (journey_id, arrival_time, departure_time, airline_code, vehicle_id, terminal_no, home_terminal, airport_code) VALUES (65453, '2020-10-05 05:20:00', '2020-10-05 04:00:00', '6E',  8089, 5, 20, 'BLR');
INSERT INTO Journey (journey_id, arrival_time, departure_time, airline_code, vehicle_id, terminal_no, home_terminal, airport_code) VALUES (65409, '2020-10-05 14:00:00', '2020-10-05 12:40:00', '6E',  7231, 4, 14, 'IDR');
INSERT INTO Journey (journey_id, arrival_time, departure_time, airline_code, vehicle_id, terminal_no, home_terminal, airport_code) VALUES (27322, '2020-10-05 15:20:00', '2020-10-05 16:40:00', 'SG',  2176, 22, 13, 'BOM');
INSERT INTO Journey (journey_id, arrival_time, departure_time, airline_code, vehicle_id, terminal_no, home_terminal, airport_code) VALUES (27262, '2020-10-05 15:30:00', '2020-10-05 17:10:00', 'SG',  2766, 20, 12, 'IXR');
INSERT INTO Journey (journey_id, arrival_time, departure_time, airline_code, vehicle_id, terminal_no, home_terminal, airport_code) VALUES (78431, '2020-10-05 17:20:00', '2020-10-05 16:10:00', 'G8',  8597, 1, 30, 'MAA');
INSERT INTO Journey (journey_id, arrival_time, departure_time, airline_code, vehicle_id, terminal_no, home_terminal, airport_code) VALUES (32723, '2020-10-05 17:30:00', '2020-10-05 16:20:00', 'UK',  3336, 19, 31, 'COK');
INSERT INTO Journey (journey_id, arrival_time, departure_time, airline_code, vehicle_id, terminal_no, home_terminal, airport_code) VALUES (65420, '2020-10-05 16:00:00', '2020-10-05 17:40:00', '6E',  6321, 17, 27, 'MAA');
INSERT INTO Journey (journey_id, arrival_time, departure_time, airline_code, vehicle_id, terminal_no, home_terminal, airport_code) VALUES (65520, '2020-10-05 19:20:00', '2020-10-05 20:30:00', '6E',  9122, 30, 31, 'IXR');
INSERT INTO Journey (journey_id, arrival_time, departure_time, airline_code, vehicle_id, terminal_no, home_terminal, airport_code) VALUES (65620, '2020-10-05 17:30:00', '2020-10-05 18:30:00', '6E',  7117, 19, 29, 'COK');
INSERT INTO Journey (journey_id, arrival_time, departure_time, airline_code, vehicle_id, terminal_no, home_terminal, airport_code) VALUES (27266, '2020-10-05 22:40:00', '2020-10-05 23:40:00', 'SG',  5732, 40, 42, 'IDR');

ALTER TABLE Terminal
ADD FOREIGN KEY (airport_code) REFERENCES Airport(airport_code),
ADD FOREIGN KEY (journey_id) REFERENCES Journey(journey_id);

CREATE TABLE Passenger (pnr_number varchar(10) NOT NULL, date_of_birth date, title ENUM('Mr', 'Mrs', 'Ms', 'Inf'), first_name varchar(15), last_name varchar(15), journey_id int, PRIMARY KEY (pnr_number), FOREIGN KEY (journey_id) REFERENCES Journey(journey_id) );
#titles is a new datatype

INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X3919C', '2000-12-12', 'Ms', 'Sanya', 'Rai', 65453);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X4017B', '2000-09-11', 'Ms', 'Deepika', 'Lakra', 65453);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X3721C', '2000-10-08', 'Ms', 'Tavishi', 'Singh', 65409);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X219HY', '1996-11-12', 'Mr', 'Ranbir', 'Kapoor', 65409);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X313H1', '1991-03-07', 'Mr', 'Siddharth', 'Malhotra', 65409);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X61CB1', '1969-04-20', 'Ms', 'Anjali', 'Singh', 27322);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X23CB2', '1989-07-03', 'Mr', 'Ayushman', 'Khurana', 27322);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X741C1', '1993-05-22', 'Mr', 'Tom', 'Holland', 27262);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X732C6', '2001-07-21', 'Ms', 'Akanksha', 'Anushree', 27262);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X3862B', '1985-07-12', 'Mr', 'Virat', 'Kohli', 78431);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X3442C', '2000-10-28', 'Ms', 'Malaika', 'Agrawal', 78431);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X3371C', '1984-09-07', 'Mr', 'Fawad', 'Khan', 32723);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X324BC', '2000-09-23', 'Ms', 'Aisha', 'Jamal', 32723);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X2217H', '1982-05-10', 'Mr', 'Ranveer', 'Singh', 65420);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X1316B', '1986-11-10', 'Mr', 'Varun', 'Dhawan', 65420);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X4418F', '1988-04-20', 'Mr', 'Farhan', 'Akhtar', 65520);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X1318G', '1986-12-12', 'Mr', 'Rajkumar', 'Rao', 65520);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X550BF', '2000-08-20', 'Ms', 'Brinda', 'Agrawal', 65620);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X440HG', '1998-02-10', 'Mr', 'Sachin Chandani', '', 65620);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X309BH', '1998-04-13', 'Mr', 'Himanshu', 'Maheswari', 27266);
INSERT INTO Passenger (pnr_number, date_of_birth, title, first_name, last_name, journey_id) VALUES ('X476CB', '1999-08-11', 'Mr', 'Devesh', 'Vijaywargiya', 27266);

CREATE TABLE Luggage (pnr_number varchar(10), weight float(1), FOREIGN KEY (pnr_number) REFERENCES Passenger(pnr_number) );

INSERT INTO Luggage (pnr_number, weight) VALUES ('X3919C', 3.0);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X4017B', 5.2);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X3721C', 8.1);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X219HY', 7.7);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X313H1', 7.4);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X61CB1', 5.0);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X23CB2', 10.7);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X741C1', 4.5);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X732C6', 11.3);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X3862B', 5.1);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X3442C', 10.0);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X3371C', 3.8);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X324BC', 5.9);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X2217H', 4.0);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X1316B', 6.2);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X4418F', 8.0);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X1318G', 3.9);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X550BF', 6.0);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X440HG', 9.2);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X309BH', 10.1);
INSERT INTO Luggage (pnr_number, weight) VALUES ('X476CB', 4.5);

CREATE TABLE Passenger_Phone_Number (pnr_number varchar(10), phone_number bigint, FOREIGN KEY (pnr_number) REFERENCES Passenger(pnr_number) );

INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X3919C', 9226478362);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X3919C', 9835148307);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X4017B', 8236844637);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X3721C', 8933672265);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X219HY', 7235866584);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X313H1', 7568219275);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X23CB2', 9938208574);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X23CB2', 8403857123);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X741C1', 9826409712);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X732C6', 9204618590);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X3862B', 9235739573);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X3862B', 9957025631);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X3442C', 8305704731);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X3371C', 9461270804);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X324BC', 9304727850);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X2217H', 9194637752);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X1316B', 8446337927);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X4418F', 7128947264);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X1318G', 9328497440);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X1318G', 8227185932);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X550BF', 836275943);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X440HG', 7182937274);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X309BH', 9878675536);
INSERT INTO Passenger_Phone_Number (pnr_number, phone_number) VALUES ('X476CB', 9372292175);

CREATE TABLE Passenger_nationality (pnr_number varchar(10), nationality varchar(25), FOREIGN KEY (pnr_number) REFERENCES Passenger(pnr_number) );
#nat is a new datatype

INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X3919C', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X4017B', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X3721C', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X219HY', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X313H1', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X61CB1', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X23CB2', 'Indians');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X741C1', 'British');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X732C6', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X732C6', 'Singaporean');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X3862B', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X3442C', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X3371C', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X3371C', 'Pakistani');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X324BC', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X2217H', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X1316B', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X4418F', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X1318G', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X550BF', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X440HG', 'Indian');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X309BH', 'British');
INSERT INTO Passenger_nationality (pnr_number, nationality) VALUES ('X476CB', 'British');

CREATE TABLE Crew (crew_id int NOT NULL, years_of_exp float(1), no_of_members int, PRIMARY KEY (crew_id) );

INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (9987, 2.3, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (8876, 1.5, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (7765, 2.5, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (6654, 1.0, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (5543, 4.5, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (4432, 5.0, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (1123, 6.5, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (2234, 6.0, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (3345, 7.2, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (4456, 3.5, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (5567, 4.0, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (6678, 5.5, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (7789, 8.0, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (8891, 3.2, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (9910, 4.5, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (1010, 7.5, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (3321, 4.6, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (2210, 3.5, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (1100, 5.0, 7);
INSERT INTO Crew (crew_id, years_of_exp, no_of_members) VALUES (1000, 7.2, 7);

CREATE TABLE Books (journey_id int NOT NULL, c_crew_id int NOT NULL, a_crew_id int NOT NULL, PRIMARY KEY (journey_id, c_crew_id, a_crew_id), FOREIGN KEY(journey_id) REFERENCES Journey(journey_id), FOREIGN KEY (c_crew_id) REFERENCES Crew(crew_id), FOREIGN KEY (a_crew_id) REFERENCES Crew(crew_id) );

INSERT INTO Books (journey_id, c_crew_id, a_crew_id) VALUES (65453, 1123, 9987);
INSERT INTO Books (journey_id, c_crew_id, a_crew_id) VALUES (65409, 2234, 8876);
INSERT INTO Books (journey_id, c_crew_id, a_crew_id) VALUES (27322, 3345, 7765);
INSERT INTO Books (journey_id, c_crew_id, a_crew_id) VALUES (27262, 4456, 6654);
INSERT INTO Books (journey_id, c_crew_id, a_crew_id) VALUES (78431, 5567, 5543);
INSERT INTO Books (journey_id, c_crew_id, a_crew_id) VALUES (32723, 6678, 4432);
INSERT INTO Books (journey_id, c_crew_id, a_crew_id) VALUES (65520, 7789, 3321);
INSERT INTO Books (journey_id, c_crew_id, a_crew_id) VALUES (65420, 8891, 2210);
INSERT INTO Books (journey_id, c_crew_id, a_crew_id) VALUES (65620, 9910, 1100);
INSERT INTO Books (journey_id, c_crew_id, a_crew_id) VALUES (27266, 1010, 1000);

CREATE TABLE Attendant_Crew (crew_id int NOT NULL, head_attendant varchar(50), asst_attendant varchar(50), safety_incharge varchar(50), asst_safety_incharge varchar(50), head_server varchar(50), PRIMARY KEY (crew_id), FOREIGN KEY (crew_id) REFERENCES Crew(crew_id) );

INSERT INTO Attendant_Crew (crew_id, head_attendant, asst_attendant, safety_incharge, asst_safety_incharge, head_server) VALUES (9987, 'Kamal Karlapalem', 'Kishan Adapa', 'Vipul Chhabra', 'Bharathi Joshi', 'Samhita Kanaparthy');
INSERT INTO Attendant_Crew (crew_id, head_attendant, asst_attendant, safety_incharge, asst_safety_incharge, head_server) VALUES (8876, 'Mohit Kuri', 'Jaidev Shriram', 'Bhavyajeet Singh', 'Mallika Subramanian', 'Jyoti Sunkara');
INSERT INTO Attendant_Crew (crew_id, head_attendant, asst_attendant, safety_incharge, asst_safety_incharge, head_server) VALUES (7765, 'Amitabh Bacchan', 'Abhishekh Bacchan', 'Aishwarya Rai', 'Jaya Bacchan', 'Aaradhya Bacchan');
INSERT INTO Attendant_Crew (crew_id, head_attendant, asst_attendant, safety_incharge, asst_safety_incharge, head_server) VALUES (6654, 'Shivavenkata Rajshekhara', 'Srinivasana Trichipalli', 'Yekyaparampeel Perambatur', 'Chinnaswami Muttuswami', 'Venugopal Iyer');
INSERT INTO Attendant_Crew (crew_id, head_attendant, asst_attendant, safety_incharge, asst_safety_incharge, head_server) VALUES (5543, 'Devi Prasad', 'Ghanshyam', 'Raju', 'Baburao Ganpatrao Apte', 'Chya Maila');
INSERT INTO Attendant_Crew (crew_id, head_attendant, asst_attendant, safety_incharge, asst_safety_incharge, head_server) VALUES (4432, 'Phineas Flynn', 'Ferb Fletcher', 'Isabella Garcia Shapiro', 'Baljeet', 'Buford Van Stomm');
INSERT INTO Attendant_Crew (crew_id, head_attendant, asst_attendant, safety_incharge, asst_safety_incharge, head_server) VALUES (3321, 'Anuradha Panikar', 'Chaman Jhinga', 'Khadak Singh', 'Kabira Speaking', 'Chhota Chetan');
INSERT INTO Attendant_Crew (crew_id, head_attendant, asst_attendant, safety_incharge, asst_safety_incharge, head_server) VALUES (2210, 'Kachra Seth', 'Munna Bhai', 'Tiwari', 'Anjali', 'Pappu');
INSERT INTO Attendant_Crew (crew_id, head_attendant, asst_attendant, safety_incharge, asst_safety_incharge, head_server) VALUES (1100, 'Uday Shetty', 'Majnu Bhai', 'Sagar Pandey', 'Ranvir Dhanraj Xaka', 'Lucky Xaka');
INSERT INTO Attendant_Crew (crew_id, head_attendant, asst_attendant, safety_incharge, asst_safety_incharge, head_server) VALUES (1000, 'Rajiv Saini', 'Sanjana Shetty', 'Dayal Ghunghroo', 'Payal Ghungroo', 'Ishika');

CREATE TABLE Cockpit_Crew (crew_id int NOT NULL, pilot varchar(50), co_pilot varchar(50), PRIMARY KEY (crew_id), FOREIGN KEY(crew_id) REFERENCES Crew(crew_id) );

INSERT INTO Cockpit_Crew (crew_id, pilot, co_pilot) VALUES (1123, 'Pahulpreet Singh', 'Meghna Mishra');
INSERT INTO Cockpit_Crew (crew_id, pilot, co_pilot) VALUES (2234, 'Dhruvee Birla', 'Keshav Bajaj');
INSERT INTO Cockpit_Crew (crew_id, pilot, co_pilot) VALUES (3345, 'Rishabh Jaglaan', 'Kshitijaa Khanna');
INSERT INTO Cockpit_Crew (crew_id, pilot, co_pilot) VALUES (4456, 'Rishabh Khanna', 'Kshitijaa Jaglaan');
INSERT INTO Cockpit_Crew (crew_id, pilot, co_pilot) VALUES (5567, 'Arushi Birla', 'Dhruvee Mittal');
INSERT INTO Cockpit_Crew (crew_id, pilot, co_pilot) VALUES (6678, 'Eshan Gupta', 'Anjali Singh');
INSERT INTO Cockpit_Crew (crew_id, pilot, co_pilot) VALUES (7789, 'Eshan Singh', 'Anjali Gupta');
INSERT INTO Cockpit_Crew (crew_id, pilot, co_pilot) VALUES (8891, 'Pahulpreet Khanna', 'Rishabh Singh');
INSERT INTO Cockpit_Crew (crew_id, pilot, co_pilot) VALUES (9910, 'Pahulpreet Eye', 'The Third Singh');
INSERT INTO Cockpit_Crew (crew_id, pilot, co_pilot) VALUES (1010, 'Pahulpreet Vishwanathan', 'Karthik Singh');

SHOW tables;