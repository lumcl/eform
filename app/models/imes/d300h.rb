class Imes::D300h < Imesdb

  self.table_name = 'D300H'
  self.primary_keys = :bdbh

  has_many :imes_qh_bdlcs, :class_name => 'Imes::QhBdlc', foreign_key: :bdbh
end
