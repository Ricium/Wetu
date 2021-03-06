import threading        # Used to create Threads
import urllib           # Used to encrypt data to transmit on HTTP 
import urllib2          # Used to transmit data on HTTP
import time
from datetime       import datetime 

# Global Variables
localport = 'http://localhost:51664/'
url = localport + 'Log/LogMovement'                # URL to POST data to
starttime = datetime.now()

print url
    
# Function to POST data to Remote Server
def postdata(URL, ADDRESS, AXIS):
    values = {'DeviceAddress' : ADDRESS,
              'Axis' : AXIS }
    data = urllib.urlencode(values)
    req = urllib2.Request(URL, data)
    response = urllib2.urlopen(req)
    the_page = response.read()
    print the_page

# Main loop
try:
    while True:
        addressA = '40C053F6'

        print 'From: ' + addressA
        print 'Axis: X (=1)'
        
        # Start thread to post data
        post_thread = threading.Thread(target=postdata, args=(url, addressA, 1,))
        post_thread.start()

        time.sleep(50)
except KeyboardInterrupt:
     # Exit Python
    print("Exiting")
