class Imes::D089l < Imesdb

  self.table_name = 'D089L'
  self.primary_keys = :id

  belongs_to :imes_d089h, :class_name => 'Imes::D089h', foreign_key: :bdbh
end