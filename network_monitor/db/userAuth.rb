require 'dbi'

begin
    #connect to MySQL Server
    # localhost : 127.0.0.1
    dbh = DBI.connect('DBI:MYSQL:TESTDB:localhost', 'root', 'toor')

end