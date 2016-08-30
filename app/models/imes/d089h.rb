class Imes::D089h < Imesdb

  self.table_name = 'D089H'
  self.primary_keys = :bdbh

  has_many :imes_qh_bdlcs, :class_name => 'Imes::QhBdlc', foreign_key: :bdbh
  has_one :imes_qh_bdtx, :class_name => 'Imes::QhBdtx', foreign_key: :bdbh
  has_many :imes_d089ls, :class_name => 'Imes::D089l', foreign_key: :bdbh
end
