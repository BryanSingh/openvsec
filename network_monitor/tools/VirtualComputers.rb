#!/usr/bin/ruby
# Enumeration for the Virtual Computers

BEGIN {
    puts ("System Booting Up ...")
}
module Enum
  Enumerable

  def each(&block)
    @key = key
    @value = value
  end

  def key
    @key
  end

  def value
    @value
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMedthods
    def define(key, value)
        @hash ||= {}
        @hash[key] = self.new(key, value)
    end

    def const_missing(key)
        @hash[key].value
    end

    def each
        @hash.each do |key, value|
            yeild key, value
        end
    end

    def all
        @hash.values
    end

    def all_to_hash
        hash = {}
        each do |key, value|
            hash[key] = value.value
        end
        hash
    end
end
end

# VM's should be in the StarWars name Convention
require 'io/console'
class VirtualComputers

    LOCALHOST = 127.0.0.1
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

    #Grab all the virtual machine's with the specified regular expression
    def getvmfilenames()
        # Filename with 10 characters
        name_regex = ('[A-Za-z0-10_]{2}(?:[A-Za-z0-9_]{2,})?')

      if name_regex == isVmNameValid?()
        puts 'Yes. This works.'
      end
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
end