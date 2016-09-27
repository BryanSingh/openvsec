class GetIP < VirtualComputers

    File.open("/user/local/widgets/data").each { |line|
        puts line if line =~ /blue/
    }
end