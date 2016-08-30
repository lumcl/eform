class Imes::D034l < Imesdb
  self.table_name = 'D034L'
  self.primary_key = :id
  self.sequence_name = 'IMES.D034L_SEQ'

  belongs_to :imes_d034h, :class_name => 'Imes::D034h', foreign_key: 'bdbh'

end
