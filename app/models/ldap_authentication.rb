class LdapAuthentication 
  require 'net/ldap'

  attr_reader :host, :port, :username, :password
  attr_accessor :ldap

  def initialize(host, port, username, password)
    @host = host
    @port = port
    @username = username
    @password = password
    establish_connection
  end

  def establish_connection
    @ldap = Net::LDAP.new(host: host, port: port)
  end

  def authorized?
    begin
      ldap.bind(method: :simple, username: "uid=#{username}, ou=Users, o=f4, dc=htw-berlin, dc=de", password: password)
    rescue
      false
    end
  end
end
