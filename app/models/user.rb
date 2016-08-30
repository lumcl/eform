class User < ActiveRecord::Base
  self.table_name = 'users'
  self.primary_key = 'uuid'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable,:registerable,
  # :validatable

  #devise :database_authenticatable, :recoverable, :rememberable, :trackable
  devise :ldap_authenticatable, :rememberable, :trackable, :validatable

  def to_s
    email
  end

  def self.search(mail)
    ldap = Net::LDAP.new :host => '172.28.1.253', # your LDAP host name or IP goes here,
                         :port => '389', # your LDAP host port goes here,
                         :base => 'O=leader' # the base of your AD tree goes here
    ldap.bind

    ldap.search :filter => Net::LDAP::Filter.eq('mail', "*#{mail.downcase}*"),
                :attributes => ['mail']
  end

  def self.all_email
    ldap = Net::LDAP.new :host => '172.28.1.253', # your LDAP host name or IP goes here,
                         :port => '389', # your LDAP host port goes here,
                         :base => 'O=leader' # the base of your AD tree goes here
    ldap.bind

    ldap.search :filter => Net::LDAP::Filter.present('mail'),
                :attributes => ['mail']
  end

  def self.validate_mail_id(array)
    ldap = Net::LDAP.new :host => '172.28.1.253', # your LDAP host name or IP goes here,
                         :port => '389', # your LDAP host port goes here,
                         :base => 'O=leader' # the base of your AD tree goes here
    ldap.bind
    hash = {}
    array.each do |mail|
      if  mail.include?('/') or mail.include?(' ')
        result = nil
      else
        if mail.include?('@l-e-i.com')
          email = mail.downcase
        else
          email = "#{mail.downcase}@l-e-i.com"
        end
        result = ldap.search :filter => Net::LDAP::Filter.eq('mail', email),
                             :attributes => ['mail']
      end
      if result.present?
        hash[mail] = 'OK'
      else
        hash[mail] = 'NG'
      end
    end
    return hash
  end

  def self.manager(email)
    sql = "SELECT MANAGER FROM USERS WHERE USERID=?"
    ws_manager = ''
    Imesdb.find_by_sql([sql, email.split('@').first.upcase]).each do |row|
      ws_manager = row.manager
    end
    ws_manager
  end

end
