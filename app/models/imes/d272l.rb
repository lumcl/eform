class Imes::D272l < Imesdb

  self.table_name = 'D272L'
  self.primary_keys = :id

  belongs_to :imes_d272h, :class_name => 'Imes::D272h', foreign_key: :bdbh
end