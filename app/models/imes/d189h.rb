class Imes::D189h < Imesdb

  self.table_name = 'D189H'
  self.primary_keys = :bdbh

  has_many :imes_qh_bdlcs, :class_name => 'Imes::QhBdlc', foreign_key: :bdbh
end
