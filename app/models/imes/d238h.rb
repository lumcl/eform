class Imes::D238h < Imesdb
  self.table_name = 'D238H'
  self.primary_keys = :bdbh

  validates_presence_of :company_site, :apply_date

  before_create :zbefore_create

  before_update :zbefore_update

  def zbefore_create
    self.bdrq = DateTime.now
    self.bdbh = 'TX-D238-1600003'
    self.bddm = 'D238'
  end

  def zbefore_update
  end

  def production_sites
    eval(production_site)
  end
end
