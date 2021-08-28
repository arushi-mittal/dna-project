import pymysql
import pymysql.cursors
import time
import dateutil.parser
import re
import datetime

def isdate (dom) :
	try:
		if re.match(r'\d{4}-\d{2}-\d{2}', dom):
			start = datetime.datetime(1952, 8, 14, 0, 0, 0)
			d1 = dateutil.parser.parse(dom)
			d2 = datetime.datetime.today()
			if d1 <= d2 and d1 >= start:
				return True
		return False
	except:
		return False


def select ():
	print("You have chosen: Select\n")
	airline = input("Enter an airline code:  ")
	flag = 1
	while (flag == 1):
		if len(airline) == 2 and airline.isupper() and airline.isalnum():
				flag = 0;
		else:
			print("Airline code must have 2 characters and uppercase characters")
			airline = input("Enter an Airline Code:  ")
	print("\n\n\n")
	with db.cursor() as data:
		data.execute('SELECT * FROM Airplane WHERE airline_code=%s', airline)
		rows = data.fetchall()
		if (rows):
			name = 'airline_code'
			vid = 'vehicle_id'
			dom = 'date_of_manufacture'
			model = 'model'
			if (rows):
				print("{0:^15} {1:^15} {2:^25} {3:^15}\n".format(name, vid, dom, model))
				for row in rows:
					name = row['airline_code']	
					vid = row['vehicle_id']
					dom = str(row['date_of_manufacture'])
					model = row['model']
					print("{0:^15} {1:^15} {2:^25} {3:^15}\n".format(name, vid, dom, model))
				print("\n\n\n")
		else:
			print("Airline code does not exist\n\n")

def project ():
	print("You have chosen: Project\n")
	journey = input("Enter a Journey ID:  ")
	print("\n\n\n")
	with db.cursor() as data:
			data.execute('SELECT title, first_name, last_name FROM Passenger WHERE journey_id=%s',journey)
			rows = data.fetchall()
			title = 'title'
			fn = 'first_name'
			ln = 'last_name'
			if (rows):
				print("{0:^6} {1:^55} {2:^55}\n".format(title, fn, ln))
				for row in rows:
					title = row['title']
					fn = row['first_name']
					ln = row['last_name']
					print("{0:^6} {1:^55} {2:^55}\n".format(title, fn, ln))
				print("\n\n\n")
			else:
				print("No results found\n\n")

def aggregate ():
	print("You have chosen: Aggregate")
	flag = 1
	while flag == 1:
		airport = input("Enter an Airport Code:  ")
		if (airport.isupper() and len(airport) == 3 and airport.isalpha()):
			flag = 0
			break
		print("Airport code must be an uppercase string of 3 characters")
		airport = input("Enter an Airport Code:  ")
	with db.cursor() as data:
		data.execute('SELECT * FROM Airport WHERE airport_code=%s', airport)
		if (data.fetchall()):
			data.execute('SELECT COUNT(journey_id) FROM Journey WHERE airport_code=%s', airport)
			rows = data.fetchall()
			if rows:
				print("Total number of flights departing to ",airport, ": ",rows[0]['COUNT(journey_id)'])
		else:
			print("The airport does not exist in the database. Try again")
	print("\n\n\n")
			

def search ():
	print("You have chosen: Search\n")
	flag = 1
	while flag == 1:
		journey = input("Enter the Journey ID that needs to be searched:  ")
		if (len(journey) == 5 and journey.isdigit()):
			with db.cursor() as data:
				data.execute('SELECT * FROM Journey WHERE journey_id=%s', journey)
				if (data.fetchall()):
					flag = 0
					break
		print("Journey ID must be a 5 digit number present in the database")
	name = input("Enter the name, or part of the name of a passenger:  ")
	with db.cursor() as data:
		query = "SELECT * FROM Passenger WHERE journey_id=%s AND (first_name LIKE %s OR last_name LIKE %s)"
		namex= "%" + name + "%"
		data.execute(query, (journey, namex, namex))
		rows = data.fetchall()
		if (rows):
			pnr = 'pnr_number'
			dob = 'date_of_birth'
			title = 'title'
			fn = 'first_name'
			ln = 'last_name'
			journey = 'journey_id'
			print("{0:^10} {1:^15} {2:^7} {3:^20} {4:^20} {5:^12}\n".format(pnr, dob, title, fn, ln, journey))
			for row in rows:
				pnr = row['pnr_number']
				dob = str(row['date_of_birth'])
				title = row['title']
				fn = row['first_name']
				ln = row['last_name']
				journey = str(row['journey_id'])
				print("{0:^10} {1:^15} {2:^7} {3:^20} {4:^20} {5:^12}\n".format(pnr, dob, title, fn, ln, journey))
		else:
			print("No match found")


	print("\n\n\n")

def insert ():
	print("You have chosen: Insert")
	flag = 1
	airline = input("Enter an Airline Code:  ")
	while (flag == 1):
		if len(airline) == 2 and airline.isupper() and airline.isalnum():
				flag = 0
		else:
			print("Airline code must have 2 characters and uppercase characters")
			airline = input("Enter an Airline Code:  ")
	flag = 1
	vid = input("Enter Vehicle ID: ")
	while (flag == 1):
		if (len(vid) == 4 and vid.isdigit()):
			flag = 0
		else:
			print("Vehicle ID must have 4 digits")
			vid = input("Enter Vehicle ID: ")
	flag = 1
	dom = input("Enter Date of Manufacture: ")
	while (flag == 1):
		if (isdate(dom)):
			flag = 0
		else:
			print("Date must be a valid date in the format YYYY-MM-DD")
			dom = input("Enter Date of Manufacture: ")	
	flag = 1
	model = input("Enter the Model:  ")
	while (flag == 1):
		temp = model.replace(" ", "")
		if (temp.isalnum()) :
			flag = 0
		else:
			print("Model name must be an alphanumeric string (spaces allowed) less than 15 characters")
			model = input("Enter the Model:  ")
	with db.cursor() as data:
		data.execute('SELECT * FROM Airplane WHERE airline_code=%s', airline)
		if (data.fetchall()):
			data.execute('SELECT * FROM Airplane WHERE airline_code=%s AND vehicle_id=%s', (airline, vid))
			if (not data.fetchall()):
				if (data.execute('INSERT INTO Airplane VALUES (%s, %s, %s, %s)', (airline, vid, dom, model))):
					print("\n\nSuccessfully inserted\n\n")
				else:
					print("Error inserting\n\n")
			else:
				print("Duplicates not allowed\n\n")
		else:
			print("\n\nError Inserting. Airline code does not exist. Try again.\n\n")
	

def update ():
	print("You have chosen: Update")
	flag = 1
	while flag == 1:
		journey = input("Enter the Journey ID that needs to be updated:  ")
		if (len(journey) == 5 and journey.isdigit()):
			with db.cursor() as data:
				data.execute('SELECT * FROM Journey WHERE journey_id=%s', journey)
				if (data.fetchall()):
					flag = 0
					break
		print("Journey ID must be a 5 digit number present in the database")
	flag = 1
	ht = input("Enter the home terminal: ")
	while flag == 1:
		if ht.isdigit():
			if int(ht) <= 150:
				flag = 0
				break
		print("Enter an integer value less than 150 for home terminal value")
		ht = input("Enter the home terminal: ")
	with db.cursor() as data:
		data.execute('UPDATE Journey SET home_terminal=%s WHERE journey_id=%s', (ht, journey))
		print("\n\n\nHome terminal for the journey", journey, " was updated to ", ht, "\n\n\n")

def delete ():
	print("You have chosen: Delete")
	pnr = input("Enter PNR Number:  ")
	flag = 1
	while (flag == 1):
		if pnr.isalnum() and len(pnr) == 6 and pnr.isupper():
			flag = 0
		else:
			print("PNR Number must be 6 alphanumeric characters")
			pnr = input("Enter PNR Number:  ")
	flag = 0
	with db.cursor() as data:
		data.execute('SELECT * FROM Luggage WHERE pnr_number=%s', pnr)
		rows = data.fetchall()
		if (rows):
			flag = 1
			data.execute('DELETE FROM Luggage WHERE pnr_number=%s', pnr)
			print("Passenger with PNR Number ", pnr, " deleted successfully from Luggage")
		data.execute('SELECT * FROM Passenger_nationality WHERE pnr_number=%s', pnr)
		rows = data.fetchall()
		if (rows):
			flag = 1
			data.execute('DELETE FROM Passenger_nationality WHERE pnr_number=%s', pnr)
			print("Passenger with PNR Number ", pnr, " deleted successfully from Passenger_nationality")
			
		data.execute('SELECT * FROM Passenger_Phone_Number WHERE pnr_number=%s', pnr)
		rows = data.fetchall()
		if (rows):
			flag = 1
			data.execute('DELETE FROM Passenger_Phone_Number WHERE pnr_number=%s', pnr)
			print("Passenger with PNR Number ", pnr, " deleted successfully from Passenger_Phone_Number")
			
		data.execute('SELECT * FROM Passenger WHERE pnr_number=%s', pnr)		
		rows = data.fetchall()
		if (rows):
			flag = 1
			data.execute('DELETE FROM Passenger WHERE pnr_number=%s', pnr)	
			print("Passenger with PNR Number ", pnr, " deleted successfully from Passenger")
	if flag == 0:
		print("The PNR Number ", pnr, " does not exist")
			




def analysis ():
	print("You have chosen: Analysis")
	flag = 1
	while flag == 1:
		journey = input("Enter the Journey ID:  ")
		if (len(journey) == 5 and journey.isdigit()):
			with db.cursor() as data:
				data.execute('SELECT * FROM Journey WHERE journey_id=%s', journey)
				if (data.fetchall()):
					flag = 0
					break
		print("Journey ID must be a 5 digit number present in the database")
	with db.cursor() as data:
		data.execute('SELECT COUNT(pnr_number) FROM Passenger, Journey WHERE Passenger.journey_id=%s AND Passenger.journey_id=Journey.journey_id', journey)
		rows = data.fetchall()
		if rows:
			print("Total number of passengers traveling on journey ",journey, ": ",rows[0]['COUNT(pnr_number)'])



def analysis2 ():
	print("You have chosen: Analysis")
	flag = 1
	while flag == 1:
		journey = input("Enter the Journey ID:  ")
		if (len(journey) == 5 and journey.isdigit()):
			with db.cursor() as data:
				data.execute('SELECT * FROM Journey WHERE journey_id=%s', journey)
				if (data.fetchall()):
					flag = 0
					break
		print("Journey ID must be a 5 digit number present in the database")
	with db.cursor() as data:
		data.execute('SELECT SUM(weight) FROM Luggage, Passenger, Journey WHERE Journey.journey_id=%s AND Passenger.journey_id=Journey.journey_id AND Luggage.pnr_number=Passenger.pnr_number', journey)
		rows = data.fetchall()
		if rows:
			print("Total weight of luggage on journey ",journey, ": %.2f" % rows[0]['SUM(weight)'])

def prompt ():
	print("Queries")
	print("	 1. Selection: Find all the airplanes for a given airline code")
	print("	 2. Projection: For a given Journey ID, display the full names of all the passengers")
	print("	 3. Aggregate: Find the total number of flights departing from home airport to a another aiport given its airport code")
	print("	 4. Search: Search for passengers on a given Journey ID, by entering name or part of name")
	print("	 5. Insert: Given airplane details, insert a new airplane into the database")
	print("	 6. Update: Given the Journey ID of a journey, update the value of the terminal it must take off from to the value provided")
	print("	 7. Delete: Given a PNR number, delete the corresponding passenger from the database")
	print("  8. Analysis: Find the number of passengers traveling on a journey given a Journey ID")
	print("  9. Analysis: Find the total weight of luggage on a given journey")

	a = input("\n\nEnter a command:  ")
	print("\n\n")
	if (a == "exit"):
		a = 0
		return a
	try:
		a = int(a)
		if a < 1 or a > 9:
			print("Invalid query, Try again\n")
			a = -1
		return a
	except:
		print("Invalid query, Try again\n")
		return -1

def connect () :
	global db
	print("To connect to the database:\n\n")
	db = pymysql.connect(
		host=input("Enter host name: "),
		user=input("Enter username: "), 
		password=input("Enter password: "), 
		db="transport",
		cursorclass=pymysql.cursors.DictCursor,
		port=int(input("Enter port: "))
		)

def main ():
	connect()
	if (db.open):
		print("Connection Successful!\n")
		print("Enter the query number to perform a query and follow instructions. To exit, enter 'exit' without the quotes.\n")
		while (1):
			ret = prompt()
			while (ret == -1):
				ret = prompt()
			if ret == 0:
				db.close()
				print("\nExiting Program\n")
				break
			if (ret == 1):
				select()

			elif (ret == 2):
				project()

			elif (ret == 3):
				aggregate()

			elif (ret == 4):
				search()

			elif (ret == 5):
				insert()

			elif (ret == 6):
				update()

			elif (ret == 7):
				delete()
			elif (ret == 8):
				analysis()
			elif (ret == 9):
				analysis2()
			db.commit()
			time.sleep(3)

	else:
		print("Failed to connect. Check credentials and try again")

main()