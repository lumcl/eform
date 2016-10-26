class Imes::QhBdbh < Imesdb
  self.table_name = 'QH_BDBH'
  self.primary_keys = [:gsdm, :bddm, :bdyr]
end
