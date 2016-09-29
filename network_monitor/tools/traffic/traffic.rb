#!/usr/bin/ruby

# TODO look into class 'ipaddr'
require 'ipaddr'

# storing the IP
    # Local Host is being used as an example
    #'127.0.0.1'split('.').collect(&:to_i).pack('C*').unpack('N').first

class traffic
    # Being stored as an array: ["127", "0", "0", "1"]
    LOCALHOST = '127.0.0.1'.split('.')

    def initialize(name, ip, status)
        @vmName = name
        @vmIp = ip.split('.')
        @vmStatus = status
    end

    def determine_interface_utility
        # wired
        @en0 = false
        # wireless (Wi-Fi)
        @en1 = true
    end

    def is_IP_localhost?()
        if ip.eql?(LOCALHOST)
            put 'VM currently has an invalid IP. Please change network settings to a NAT.'
        end
    end
end