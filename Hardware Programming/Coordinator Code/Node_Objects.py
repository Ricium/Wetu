from datetime import datetime               # Used for connection times

def strip_non_ascii(string):
    ''' Returns the string without non ASCII characters'''
    stripped = (c for c in string if 48 <= ord(c) <= 57 or 65 <= ord(c) <= 90 or 97 <= ord(c) <= 122)
    return ''.join(stripped)

# Class for WiFi Nodes
class AnimalNode:
    def __init__(self, _name, _time, _signal):
        self.name = _name                   # Name of WiFi Access Point (Device Name)
        self.start_time = _time             # Time Node Connected to Parent Node
        self.strength = _signal             # Signal Strength of Connection
        self.end_time = datetime.now()      # Connection lost time

    def lose_connection(self, _time):
        self.end_time = _time               # Set end time

    def get_connection_time(self, fromtime):
        if fromtime == 1:
            return (datetime.now() - self.start_time).total_seconds()
        else:
            return (self.end_time - self.start_time).total_seconds()
            

    def AnimalNode(object):
        pass

# Class for XBee Nodes
class DeviceNode:
    def __init__(self, addr):
        self.address = addr                 # Address of Node in Mesh Network (Device Address)
        self.connected = []                 # List of Animal Nodes
        self.buffer = []                    # Buffer to store incoming data

    def add_node(self, module):
        self.connected.append(module)       # Add node to list

    # Check if node is connected
    def is_connected(self, name):
        for mod in self.connected:   
            if mod.name == name:
                return True

    # Find index of node
    def find(self, name):
        count = 0
        for node in self.connected:
            if node.name == name:
                return count
            count = count + 1

    # Find time node was connected
    def connection_time(self, name):
        node = self.find(name)
        con_time = self.connected[node].get_connection_time(1)
        return con_time

    # Get length of buffer
    def buffer_length(self):
        return len(self.get_buffer())

    # Check if buffer is full
    def buffer_at_end(self):
        if "~" in self.get_buffer():
            return True
        else:
            return False

    # Get buffer
    def get_buffer(self):
        return ''.join(self.buffer)

    # Add data to buffer
    def add_buffer(self, data):
        self.buffer.append(data)

    # Clean buffer
    def clear_buffer(self):
        self.buffer = []

    # Process Buffer
    def handle_buffer(self):
        data = self.get_buffer()
        lines = data.split('\r\n')
        connections = []
        lost_connections = []
        for line in lines:
            start_index = line.find('"')
            if not start_index == -1:
                start_index = start_index + 1;
                end_index = line.find('"', start_index)   
                if not end_index == -1:
                    text = line[start_index:end_index+6]
                    name = strip_non_ascii(text[0:text.find('"')])
                    signal = text[text.find('"')+2:]

                    if signal.endswith(',"'):
                        signal = signal[:len(signal)-2]
                        
                    if signal.endswith(','):
                        signal = signal[:len(signal)-1]
                    
                    if int(signal) >= -40:
                        module = AnimalNode(name, datetime.now(), signal)
                        connections.append(module)
        self.clear_buffer()
        return connections

    # Get Lost Connections
    def compare_connections(self, connections):
        lost_connections = []
        for module in self.connected:
            found = False
            for new_module in connections:
                if module.name == new_module.name:
                    found = True
            if not found:
                module.lose_connection(datetime.now())
                time_had = (module.end_time - module.start_time).total_seconds()
                print 'Connection: ' + module.name + ' lost after: ' + str(time_had) + ' seconds'
                lost_connections.append(module)
                self.connected.remove(module)                

        for new_module in connections:
            if not self.is_connected(new_module.name):
                print 'Adding connection: ' + new_module.name
                self.add_node(new_module)

        return lost_connections

    def DeviceNode(object):
        pass

# Class for All Connected Devices
class Nodes:
    def __init__(self):
        self.DeviceNodes = []

    # Add Node
    def add_node(self, node):
        self.DeviceNodes.append(node)
        return self.find(node.address)

    # Check if Node is connected
    def is_connected(self, addr):
        for node in self.DeviceNodes:
            if node.address == addr:
                return True

    # Find index of Node
    def find(self, address):
        count = 0       
        for node in self.DeviceNodes:
            if node.address == address:
                return count
            count = count + 1
