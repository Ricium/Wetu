import serial                                               # Used to communicate via Serial
import threading                                            # Used to create Threads
import urllib                                               # Used to encrypt data to transmit on HTTP 
import urllib2                                              # Used to transmit data on HTTP
from datetime       import datetime                         # Used to retrieve Date and Time
from xbee           import ZigBee                           # Used to handle packets from XBee
from Node_Objects   import AnimalNode, DeviceNode, Nodes    # Node Structures

# Global Variables
nodes = Nodes()                                             # Node object - Will contain all network data
port = 'COM4'                                               # Serial Port of XBee
baudrate = 19200                                            # Required Baudrate
url = 'http://127.0.0.1/project/poster.php'                 # URL to POST data to

# Function to start serial connection
def start_serial(PORT, BAUDRATE):
    print("Starting Serial on " + PORT + " with Baudrate of " + str(BAUDRATE))
    ser = serial.Serial(PORT,BAUDRATE)    
    print("Connected to: " + ser.portstr)
    return ser

# Function to process node
def process_node(NODE):
    # Get list of all the new connections from device buffer
    new_connections = NODE.handle_buffer()

    # Get list of all the connections lost by device
    lost_connections = NODE.compare_connections(new_connections)

    # For each lost connection, post the data to the remote server
    for connection in lost_connections:
        try:
            # Process data in Thread
            post_thread = threading.Thread(target=post_data,
                                           args=(NODE.address, connection.name,
                                                 connection.start_time,
                                                 connection.end_time,
                                                 connection.strength,
                                                 url,))
            post_thread.start()
        except:
            print "Error: Unable to Start Thread: Post_Thread"

# Function to post data to remote server
def post_data(FROM, TO, START, END, STRENGTH,URL):
    values = {'from' : FROM,
              'to' : TO,
              'start' : START,
              'end' : END,
              'strength' : STRENGTH}                    # Post Parameters
    data = urllib.urlencode(values)                     # Encode Parameters
    req = urllib2.Request(URL, data)                    # Create HTTP Request
    response = urllib2.urlopen(req)                     # Open HTTP Request
    the_page = response.read()                          # Return Response

# Start Serial Connection
serial_con = start_serial(port, baudrate)

# Open connection to XBee
XB = ZigBee(serial_con)

# Main loop
while True:
    try:
        # Get Response from XBee
        response = XB.wait_read_frame()

        # Get Source Address of the Response 
        address = response['source_addr_long'].encode('hex')
        print 'Packet Received From: ' + address 

        # Check if Device in List
        if not nodes.is_connected(address):
            print 'Adding new Device: ' + address
            device_node = DeviceNode(address)
            index = nodes.add_node(device_node)
        else:
            # Find Node
            index = nodes.find(address)

        # Rebuild data from Device by adding to the packet buffer
        nodes.DeviceNodes[index].add_buffer(response['rf_data'])

        # Check if packet buffer for the Device is full
        if nodes.DeviceNodes[index].buffer_at_end():
            print 'Node: ' + address + ' buffer is full' 
            try:
                # Process data in Thread
                process_thread = threading.Thread(target=process_node, args=(nodes.DeviceNodes[index],))
                process_thread.start()
            except:
                print "Error: Unable to Start Thread: Process_Thread"

    except KeyboardInterrupt:
        break

# Close Serial Connection
serial_con.close()
