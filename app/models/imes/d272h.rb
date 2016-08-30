class Imes::D272h < Imesdb
  self.table_name = 'D272H'
  self.primary_keys = :bdbh

  has_many :imes_qh_bdlcs, :class_name => 'Imes::QhBdlc', foreign_key: :bdbh
  has_one :imes_qh_bdtx, :class_name => 'Imes::QhBdtx', foreign_key: :bdbh
  has_many :imes_d272ls, :class_name => 'Imes::D272l', foreign_key: :bdbh
end
