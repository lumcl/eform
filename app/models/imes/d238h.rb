class Imes::D238h < Imesdb
  self.table_name = 'D238H'
  self.primary_keys = :bdbh
  serialize :production_site

  validates_presence_of :company_site, :apply_date

  before_create :zbefore_create

  before_update :zbefore_update

  before_save :zbefore_save

  has_many :imes_qh_bdlcs, :class_name => 'Imes::QhBdlc', foreign_key: :bdbh, :dependent => :destroy

  def zbefore_create
    #sql = "select bdqz,bdhm from qh_bdbh where gsdm = '"+self.company_site+"' and bddm = 'D238' and bdyr= '"+DateTime.parse(Time.now.to_s).strftime('%Y').to_s+"' "
  end

  def zbefore_update
  end

  def zbefore_save
    assign_bdbh if bdbh.blank?
  end

  def production_sites
    eval(production_site)
  end

  def assign_bdbh
    imes_qh_bdbhs = Imes::QhBdbh.find_by(gsdm: self.company_site,bddm:'D238', bdyr: Date.today.strftime('%Y'))
    new_bdhm = imes_qh_bdbhs.bdhm + 1
    imes_qh_bdbhs.bdhm = new_bdhm
    imes_qh_bdbhs.save

    self.bdrq = Time.now
    self.gsdm = company_site
    self.bdzt = 0
    self.bdbh = "#{imes_qh_bdbhs.bdqz}#{new_bdhm}"
    self.bddm = 'D238'
  end

end
