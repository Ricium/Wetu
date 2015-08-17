import serial           # Used to make serial connections
import threading        # Used to create Threads
import urllib           # Used to encrypt data to transmit on HTTP 
import urllib2          # Used to transmit data on HTTP
#import Xbee

# Global Variables
port = 'COM4'                                   # COM Port where XBee is connected
baudrate = 19200                                # Baudrate required
packet = []                                     # Databuffer to store incoming data
url = 'http://127.0.0.1/project/poster.php'     # URL to POST data to
url_param = 'data'                              # Parameter of POST data
filename = 'Test.txt'                           # Name of text file to save data

# Function to start serial connection
def startserial(PORT, BAUDRATE):
    print("Starting Serial on " + PORT + " with Baudrate of " + str(BAUDRATE))
    ser = serial.Serial(PORT,BAUDRATE)    
    print("Connected to: " + ser.portstr)
    return ser
    
# Function to POST data to Remote Server
def postdata(DATA, DATA_PARAM, URL):
    print("Post Thread Started")
    values = {DATA_PARAM : DATA}
    data = urllib.urlencode(values)
    req = urllib2.Request(URL, data)
    response = urllib2.urlopen(req)
    the_page = response.read()
    print("Post Thread Ended")

# Function to save data in text file
def savedata(DATA, FILENAME):
    print("Text Thread Started")
    file_txt = open(FILENAME,'a')
    file_txt.write(DATA)
    file_txt.close()
    print("Text Thread Ended")

# Start Serial Connection
con = startserial(port, baudrate)

# Main loop
try:
    while True:
        # Read each character received on serial
        for character in con.read():
            packet.append(character)

            # Convert packet to string
            str_packet = ''.join(str(chr_packet) for chr_packet in packet)

            # Check for EOL Character
            if character == '~':
                # Start thread to post data
                post_thread = threading.Thread(target=postdata, args=(str_packet, url_param, url))
                post_thread.start()

                # Start thread to save data in text file
                text_thread = threading.Thread(target=savedata, args=(str_packet, filename))
                text_thread.start()

                # Print out data received
                print("Line: " + str_packet)
                packet = []

                # Restart loop            
                break
except KeyboardInterrupt:
    # Close serial connection and stop main loop
    print("Closing Serial connection on " + port)           
    con.close()
    # Exit Python
    print("Exiting")
