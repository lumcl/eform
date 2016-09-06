class Imes::D238h < Imesdb
  self.table_name = 'D238H'
  self.primary_keys = :bdbh

  validates_presence_of :company_site, :apply_date

  before_create  :zbefore_create

  def zbefore_create
    self.bdbh = 'TX-D238-1600001'
    self.bddm = 'D238'
  end

end
