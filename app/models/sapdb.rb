class Sapdb < ActiveRecord::Base
  establish_connection :sapdb
  # connection.raw_connection.recv_timeout = 150
  # connection.raw_connection.send_timeout = 10
  self.table_name = :dual
  self.primary_key = :dummy
end
