#!/usr/bin/env ruby
require 'socket'
require 'timeout'
unless ARGV.length == 2
  abort "Usage: ruby #{__FILE__} HOST PORT"
end

def port_open?(ip, port, seconds=1)
  # => checks if a port is open or not on a remote host
  Timeout::timeout(seconds) do
    begin
      TCPSocket.new(ip, port).close
      true
    rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, SocketError
      false
    end
  end
  rescue Timeout::Error
    false
end

HOST = ARGV[0]
PORT = ARGV[1]

if port_open?(HOST, PORT)
  puts "[OPEN]: Port #{PORT} is open on host #{HOST}"
else
  puts "[NOT OPEN]: Port #{PORT} is not open on host #{HOST}"
end