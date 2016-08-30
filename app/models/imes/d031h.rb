class Imes::D031h < Imesdb

  self.table_name = 'D031H'
  self.primary_keys = :bdbh

  has_many :imes_qh_bdlcs, :class_name => 'Imes::QhBdlc', foreign_key: :bdbh
  has_many :imes_d031ls, :class_name => 'Imes::D031l', foreign_key: :bdbh
end
