import threading        # Used to create Threads
import urllib           # Used to encrypt data to transmit on HTTP 
import urllib2          # Used to transmit data on HTTP
import time

# Global Variables
localport = 'http://localhost:51664/'
count = 0
insert_amount = 100
    
# Function to insert Company
def addCompany(COMPANYNAME):
    url = localport + 'Simulate/AddCompany'
    values = {'CompanyName' : COMPANYNAME}
    data = urllib.urlencode(values)
    req = urllib2.Request(url, data)
    response = urllib2.urlopen(req)
    the_page = response.read()
    print the_page

# Function to insert User for Company
def addUser(USERNAME, PASSWORD, COMPANYNAME):
    url = localport + 'Simulate/AddUser'
    values = { 'Username' : USERNAME,
               'Password' : PASSWORD,
               'CompanyName' : COMPANYNAME}
    data = urllib.urlencode(values)
    req = urllib2.Request(url, data)
    response = urllib2.urlopen(req)
    the_page = response.read()
    print the_page

# Main loop
try:
    print 'Starting Company and User insert'
    while count <= insert_amount:        
        count = count + 1
        print 'Company: ' + str(count)
        companyname = str(count)
        username = "user_" + str(count)
        print 'Username: ' + username
        password = username + "@" + companyname
        print 'Password: ' + password
        
        company_thread = threading.Thread(target=addCompany, args=(companyname,))
        company_thread.start()
        time.sleep(1)

        user_thread = threading.Thread(target=addUser, args=(username, password, companyname,))
        user_thread.start()
        time.sleep(1)
		
except KeyboardInterrupt:
     # Exit Python
    print("Exiting")
