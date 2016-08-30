class Imesdb < ActiveRecord::Base
  establish_connection :imesdb
  # connection.raw_connection.recv_timeout = 150
  # connection.raw_connection.send_timeout = 10
  # self.primary_key = 'email'
  # self.table_name = 'imes.users'
  self.table_name = :dual
  self.primary_key = :dummy
end
