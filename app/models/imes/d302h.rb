class Imes::D302h < Imesdb

  self.table_name = 'D302H'
  self.primary_keys = :bdbh

  has_many :imes_qh_bdlcs, :class_name => 'Imes::QhBdlc', foreign_key: :bdbh
end
