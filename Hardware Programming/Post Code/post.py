import threading        # Used to create Threads
import urllib           # Used to encrypt data to transmit on HTTP 
import urllib2          # Used to transmit data on HTTP
import time
from datetime       import datetime 

# Global Variables
localport = 'http://localhost:51664/'
url = localport + 'Log/LogProximity'                # URL to POST data to
starttime = datetime.now()

print url
    
# Function to POST data to Remote Server
def postdata(URL, DEVICEA, DEVICEB, STARTTIME, ENDTIME):
    values = {'DeviceReceivedAddress' : DEVICEA,
              'DeviceConnectedAddress' : DEVICEB,
              'ConncetionStart': STARTTIME,
              'ConnectionEnd' : ENDTIME }
    data = urllib.urlencode(values)
    req = urllib2.Request(URL, data)
    response = urllib2.urlopen(req)
    the_page = response.read()
    print the_page

# Main loop
try:
    while True:
        endtime = datetime.now()
        addressA = '0013A20040BDBA4F'
        addressB = '0013A20040C053F6'

        print 'From: ' + addressA
        print 'Connected: ' + addressB
        print 'Start Time: ' + str(starttime)
        print 'End Time: ' + str(endtime)
        
        # Start thread to post data
        post_thread = threading.Thread(target=postdata, args=(url, addressA, addressB, starttime, endtime))
        post_thread.start()

        time.sleep(25)
except KeyboardInterrupt:
     # Exit Python
    print("Exiting")
