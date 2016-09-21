require 'rbconfig'

class command_line

    if ruby_version < (2.2)

    def new_connection(client)
        # TODO This is for Dr. Plante
        puts "Welcome #{client}"

        client.write("Hello from Network Analyzer")
        client.close
    end
end