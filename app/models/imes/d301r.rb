class Imes::D301r < Imesdb

  self.table_name = 'D301R'
  self.primary_keys = :bdbh

  belongs_to :imes_d301r, :class_name => 'Imes::D301r', foreign_key: 'bdbh'
end
