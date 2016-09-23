import socket
import os

# host to listen

host = "192.168.0.196"

# create a raw socket and bind it to the public interface

if os.name == "nt":
    socket_protocol = socket.IPPROTO_IP
else:
    socket_protocol = socket.IPPROTO_IP

sniffer = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket_protocol)

sniffer.bind((host, 0))

#trying to get the IP header in the capture
sniffer.setsockopt(socket.IPPROTO_IP, socket.IP_HDRINCL, 1)

if os.name == "nt":
    sniffer.iotcl(scket.SIO_RCVALL, socket.RCVALL_ON)

print sniffer.recvfrom(65565)

if os.name == "nt":
    sniffer.iotcl(socket.SIO_RCVALL, socket.RCVALL_ON)