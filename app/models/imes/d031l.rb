class Imes::D031l < Imesdb

  self.table_name = 'D031L'
  self.primary_keys = :bdbh

  belongs_to :imes_d031h, :class_name => 'Imes::D031h', foreign_key: 'bdbh'
end
