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
localport = 'http://localhost:51664/'
url = localport + 'Log/LogProximity'                # URL to POST data to

# Function to start serial connection
def start_serial(PORT, BAUDRATE):
    print("Starting Serial on " + PORT + " with Baudrate of " + str(BAUDRATE))
    ser = serial.Serial(PORT,BAUDRATE)    
    print("Connected to: " + ser.portstr)
    return ser

# Function to POST Proximity data to Remote Server
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
	
# Function to POST Movement data to Remote Server
def postdata_movement(URL, ADDRESS, AXIS):
    values = {'DeviceAddress' : ADDRESS,
              'Axis' : AXIS }
    data = urllib.urlencode(values)
    req = urllib2.Request(URL, data)
    response = urllib2.urlopen(req)
    the_page = response.read()
    print the_page

# Function to process node
def process_node(NODE):
    # Get list of all the new connections from device buffer
    new_connections = NODE.handle_buffer()

    # Get list of all the connections lost by device
    lost_connections = NODE.compare_connections(new_connections)

    # For each lost connection, post the data to the remote server
    for connection in lost_connections:
        try:
            print NODE.address
            print connection.name
            # Process data in Thread
            post_thread = threading.Thread(target=postdata,
                                           args=(url,
                                                 NODE.address,
                                                 connection.name,
                                                 connection.start_time,
                                                 connection.end_time,
                                                 ))
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
        address_res = response['source_addr_long'].encode('hex')
        address = address_res[8:].upper()
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
            nodes.DeviceNodes[index].set_accel_data()
            acc = nodes.DeviceNodes[index].get_accel_data()
            try:
                # Process data in Thread
                process_thread = threading.Thread(target=process_node, args=(nodes.DeviceNodes[index],))
                process_thread.start()

                if acc.x == 'Y':
                    movement_thread = threading.Thread(target=postdata_movement, args=(address, 1,))
                    movement_thread.start()

                if acc.y == 'Y':
                    movement_thread = threading.Thread(target=postdata_movement, args=(address, 2,))
                    movement_thread.start()

                if acc.z == 'Y':
                    movement_thread = threading.Thread(target=postdata_movement, args=(address, 3,))
                    movement_thread.start()
            except:
                print "Error: Unable to Start Thread: Process_Thread"

    except KeyboardInterrupt:
        break

# Close Serial Connection
serial_con.close()
