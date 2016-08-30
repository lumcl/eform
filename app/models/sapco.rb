class Sapco < ActiveRecord::Base
  establish_connection :sapco

  self.table_name = 'dual'
  self.primary_key = 'dummy'

end