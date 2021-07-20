# Data and Applications Course Project

### Project Details

The universe of discourse is a Home Airport. The database stores the details of all the flights departing from the Home Airport (in one day) including the destination airport and terminal, the take-off terminal, along with details about the passengers, crew, airplane and airline.


### Running The Program

```bash
$ cd M.A.D
$ mysql -h -p --port < info.sql
$ python3 cli.py
```
- Enter the directory M.A.D and run mysql as you would on a normal machine, but redirect the contents of info.sql into the command. (Eg: mysql -h -p --port < info.sql). This would load the transport database onto your local machine.
- Next run python3 cli.py
- Follow the prompts and enter the hostname, username, password and port name without any leading spaces. This would connect the database to the python interface.
- Enter a query number and follow the prompts to execute those queries.

We used MySQL to create the tables and insert the sample data. PyMySQL was used to implement the queries.

The following queries are available:
1. Selection: Find all the airplanes for a given airline code
2. Projection: For a given Journey ID, display the full names of all the passengers
3. Aggregate: Find the total number of flights departing from home airport to a another aiport given its airport code
4. Search: Search for passengers on a given Journey ID, by entering name or part of name
5. Insert: Given airplane details, insert a new airplane into the database
6. Update: Given the Journey ID of a journey, update the value of the terminal it must take off from to the value provided.
7. Delete: Given a PNR number, delete the corresponding passenger from the database
8. Analysis: Find the number of passengers traveling on a journey given a Journey ID
9. Analysis: Find the total weight of luggage on a given journey

Changes made from initial phases:
- We have added an attribute home_terminal to the Journey table. This was done to indicate which terminal in the home airport the flight takes off from. The terminal and airport to which it is travelling was already included.
- We have made airline_code in Codename a foreign key to airline_code in Airplane, as this had been omitted earlier.
- The data type for airport_code in Airport has been corrected to varchar.
- We have made changes to the queries mentioned in our requirement doc, as we found that those queries were flawed. The update, delete and insert operations remain the same.
- The attribute ‘number’ of the terminal entity has been renamed to ‘terminal_number’ for sake of clarity.
Assumptions:

- We assume that a passenger can realistically only depart on one journey from the Home Airport in a day.
- Queries have restrictions that ensure no insert, update or deletion anomalies are caused keeping in mind the impact of incorrect management of foreign keys. 
	
### Contributors
#### Arushi Mittal - https://github.com/arushi-mittal/
#### Dhruvee Birla - https://github.com/dhruvxx
#### Meghna Mishra - https://github.com/meghna-mishra
