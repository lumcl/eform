class Imes::D301h < Imesdb

  self.table_name = 'D301H'
  self.primary_keys = :bdbh

  has_many :imes_qh_bdlcs, :class_name => 'Imes::QhBdlc', foreign_key: :bdbh
  has_many :imes_d301rs, :class_name => 'Imes::D301r', foreign_key: :bdbh
end
