class Imes::D238h < Imesdb
  self.table_name = 'D238H'
  self.primary_keys = :bdbh

  validates_presence_of :company_site, :apply_date

  def create_record
    Imes::D238h.before_save

  end
end
