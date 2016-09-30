#!/usr/bin/ruby
# Enumeration for the Virtual Computers

BEGIN {
    puts ("System Booting Up ...")
}

# VM's should be in the StarWars name Convention
require 'io/console'

class VirtualComputers

    LOCALHOST = '127.0.0.1'
    @virtual_machine = {'vmName' => nil, 'internetProtocol' => nil, 'created_at' => nil}
    @sample__names = ['Anakin', 'ObiWan', 'JarJar']

    # def initialize(name)
    # end

    def look_for_interface_ip()
        #/Users/BryanSingh/Documents/Virtual Machines.localized/Anakin.vmwarevm
        file_path = ('../sampleDocs/vmware.log')
        query_network_interface = 'en1'
        names = File.readlines(file_path)
        matches = names.select { |name| name[/#{query_network_interface}/i] }
        puts matches
    end

    def look_for_vm_name()
        file_path = ('../sampleDocs/vmware.log')
        query_vm_name = 'displayName'
        names = File.readlines('vmware.log')
        matches = names.select { |name| name[/#{query_vm_name}/i] }
        puts matches
    end

    def check_vm_running_status()
        file_path = ('../sampleDocs/vmware.log')
        query_vm_status = ('VM not running')
        names = File.readlines('vmware.log')
        matches = names.select { |name| name[/#{query_vm_status}/i] }
        puts matches
    end

    def isvmnamevalid?()
        fileName = VirtualComputers.new
        if fileName == true
            puts 'Go'
        end
    end

    def determineNumberOfVMsRunning()
        @numberVM = sample__names.length
    end

    def permutatevms()
    end
end

virtual_machine = VirtualComputers.new
virtual_machine.look_for_interface_ip
virtual_machine.look_for_vm_name
virtual_machine.check_vm_running_status