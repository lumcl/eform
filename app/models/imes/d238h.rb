class Imes::D238h < Imesdb
  self.table_name = 'D238H'
  self.primary_keys = :bdbh

  validates_presence_of :company_site, :apply_date

  before_create :zbefore_create

  before_update :zbefore_update

  def zbefore_create
    #sql = "select bdqz,bdhm from qh_bdbh where gsdm = '"+self.company_site+"' and bddm = 'D238' and bdyr= '"+DateTime.parse(Time.now.to_s).strftime('%Y').to_s+"' "
    @imes_qh_bdbhs = Imes::QhBdbh.find_by(gsdm: self.company_site,bddm:'D238', bdyr: DateTime.parse(Time.now.to_s).strftime('%Y').to_s) #.find_by_sql(sql)

    self.bdrq = DateTime.now
    puts @imes_qh_bdbhs.bdqz
    puts '\n'
    puts '**************'
    self.bdbh = @imes_qh_bdbhs.bdqz.to_s+(@imes_qh_bdbhs.bdhm+1).to_s
    puts self.bdbh
    self.bddm = 'D238'

    bdhm = @imes_qh_bdbhs.bdhm

    @imes_qh_bdbhs.bdhm = bdhm +1
    puts '________************_________'
    puts @imes_qh_bdbhs.bdhm
    puts '________************_________'
    #@imes_qh_bdbhs.save
  end

  def zbefore_update
  end

  def production_sites
    eval(production_site)
  end
end
