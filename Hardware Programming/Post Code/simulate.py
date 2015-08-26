import threading        	# Used to create Threads
import urllib           	# Used to encrypt data to transmit on HTTP 
import urllib2          	# Used to transmit data on HTTP
import time
import json					# Used to Parse Data from Server
from random import randint	# Used to Generate Random Values

# Class to Classify Users
class User:
    def __init__(self, _name):
        self.name = _name			# UserId from Database
        self.companies = []			# List of Companies associated with User

    def add_company(self, _company):	
        self.companies.append(_company)

    def User(object):
        pass

# Class to Classify Data
class Service:
    def __init__(self):
        self.users = []			# List of Users in Database
        
    def add_user(self, _user):
        self.users.append(_user)

    def Service(object):
        pass

# Global Variables
localport = 'http://localhost:51664/'
service = Service()

# Function to get all Users in Database
def getUsers():
    url = localport + 'Simulate/GetKeys'
    values = {}
    data = urllib.urlencode(values)
    req = urllib2.Request(url, data)
    response = urllib2.urlopen(req)
    the_page = response.read().decode('utf-8')
    json_obj = json.loads(the_page)

	# For each User get the User's Companies
    for i in range(0,len(json_obj)):
        user = User(json_obj[i])        
        companies = getCompanies(user.name)
        for company in companies:
            user.add_company(company)
        service.add_user(user)
        
    
# Function to get Companies associated with User
def getCompanies(USERKEY):
    url = localport + 'Simulate/GetCompany'
    values = {'Userkey' : USERKEY}
    data = urllib.urlencode(values)
    req = urllib2.Request(url, data)
    response = urllib2.urlopen(req)
    the_page = response.read().decode('utf-8')
    json_obj = json.loads(the_page)
    return json_obj

# Add a new Animal connected with a Device in Database
def addAnimal(ADDRESS, NAME, TAG, COMPANY, USERKEY):
	# Insert Device
    DEVICEID = insertDevice(ADDRESS, COMPANY, USERKEY)
	# Insert Animal connected with Device
    insertAnimal(NAME, TAG, DEVICEID, COMPANY, USERKEY)

# Function to insert a new Device in Database
def insertDevice(ADDRESS, COMPANY, USERKEY):
    url = localport + 'Simulate/InsertDevice'
    values = {'Address' : ADDRESS,
              'CompanyId' : COMPANY,
              'UserKey' : USERKEY}
    data = urllib.urlencode(values)
    req = urllib2.Request(url, data)
    response = urllib2.urlopen(req)
    the_page = response.read()
    return the_page

# Function to insert a new Animal in Database
def insertAnimal(NAME, TAG, DEVICEID, COMPANY, USERKEY):
    url = localport + 'Simulate/InsertAnimal'
    values = {'Name' : NAME,
              'Tag' : TAG,
              'DeviceId' : DEVICEID,
              'CompanyId' : COMPANY,
              'UserKey' : USERKEY}
    data = urllib.urlencode(values)
    req = urllib2.Request(url, data)
    response = urllib2.urlopen(req)
    the_page = response.read()

# Main loop
try:
	# Get all the Users in the database
    user_thread = threading.Thread(target=getUsers, args=())
    user_thread.start()
    time.sleep(0.5)   

	# Insert 100 Devices and Animals in Database per user per company
    for user in service.users:
        for company in user.companies:			
            for i in range(1,100):
                address = str(user.name) + '@' +  str(company) + str(i)
                name = 'Cow ' +  str(user.name) +  str(company) + str(i)
                tag = randint(0,10000)

                print 'Adding Animal: ' + name + ' for User: ' + str(user.name) + ' @ ' + str(company) + ' Address: ' + address
                device_thread = threading.Thread(target=addAnimal, args=(address, name, tag, company, user.name,))
                device_thread.start()
                time.sleep(0.5)

except KeyboardInterrupt:
     # Exit Python
    print("Exiting")
