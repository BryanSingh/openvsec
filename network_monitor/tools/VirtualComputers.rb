# Enummeration for the Virtual Computers
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
class VirtualComputers
    virtual_machine = {'vmName' => nil, 'internetProtocol' => nil, 'created_at' => nil}

    def initialize(name)

    end

    #Grab all the virtual machine's with the specified regular expression
    def getVmFileNames()
        # Filename with 10 characters
        name_regex = ('[A-Za-z0-10_]{2}(?:[A-Za-z0-9_]{2,})?')

      if name_regex == isVmNameValid?()
        puts 'Yes. This works.'
      end
    end

    def isVmNameValid?()
    end
end
