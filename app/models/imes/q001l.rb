class Imes::Q001l < Imesdb

  self.table_name = 'Q001L'
  self.primary_keys = :id

  belongs_to :imes_q001h, :class_name => 'Imes::q001h', foreign_key: 'bdbh'
end
