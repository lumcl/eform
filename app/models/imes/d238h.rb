class Imes::D238h < Imesdb
  self.table_name = 'D238H'
  self.primary_keys = :bdbh
  serialize :production_site

  validates_presence_of :company_site, :apply_date

  before_create :zbefore_create

  before_update :zbefore_update

  before_save :zbefore_save

  has_many :imes_qh_bdlcs, :class_name => 'Imes::QhBdlc', foreign_key: :bdbh, :dependent => :destroy

  has_one :imes_d238lz, :class_name => 'Imes::D238z', foreign_key: :company_site, primary_key: :company_site

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

  def str_qhlc(params)
    Imes::D238h.transaction do
      seq = 100
      if params[:shenhe].present?
        params[:shenhe].split(',').each do |name|
          Imes::QhBdlc.create(
              gsdm: gsdm, bddm: bddm, bdbh: bdbh, qhzt: 0, lxdm: 'D238',
              bzdm: seq, lclx: 'S', zwdm: 'REV', qhlx: 'R',
              yxxs: 1000, sqyh: applicant, jlsj: Time.now, ysyh: name)
          seq = seq + 100
        end
      end

      params[:hezhun].split(',').each do |name|
        Imes::QhBdlc.create(
            gsdm: gsdm, bddm: bddm, bdbh: bdbh, qhzt: 0, lxdm: 'D238',
            bzdm: seq, lclx: 'S', zwdm: 'APV', qhlx: 'A',
            yxxs: 1000, sqyh: applicant, jlsj: Time.now, ysyh: name)
        seq = seq + 100
      end

      if params[:wenyuan].present?
        params[:wenyuan].split(',').each do |name|
          Imes::QhBdlc.create(
              gsdm: gsdm, bddm: bddm, bdbh: bdbh, qhzt: 0, lxdm: 'D238',
              bzdm: seq, lclx: 'S', zwdm: 'SGWY', qhlx: 'R',
              yxxs: 1000, sqyh: applicant, jlsj: Time.now, ysyh: name)
          seq = seq + 100
        end
      end

      if params[:caigou].present?
        params[:caigou].split(',').each do |name|
          Imes::QhBdlc.create(
              gsdm: gsdm, bddm: bddm, bdbh: bdbh, qhzt: 0, lxdm: 'D238',
              bzdm: seq, lclx: 'S', zwdm: 'CGJL', qhlx: 'I',
              yxxs: 1000, sqyh: applicant, jlsj: Time.now, ysyh: name)
          seq = seq + 100
        end
      end

      if params[:yanfa].present?
        params[:yanfa].split(',').each do |name|
          Imes::QhBdlc.create(
              gsdm: gsdm, bddm: bddm, bdbh: bdbh, qhzt: 0, lxdm: 'D238',
              bzdm: seq, lclx: 'S', zwdm: 'SGJL', qhlx: 'I',
              yxxs: 1000, sqyh: applicant, jlsj: Time.now, ysyh: name)
          seq = seq + 100
        end
      end

      if params[:zhihui].present?
        params[:zhihui].split(',').each do |name|
          Imes::QhBdlc.create(
              gsdm: gsdm, bddm: bddm, bdbh: bdbh, qhzt: 0, lxdm: 'D238',
              bzdm: seq, lclx: 'P', zwdm: 'ZH', qhlx: 'I',
              yxxs: 1000, sqyh: applicant, jlsj: Time.now, ysyh: name)
          seq = seq + 100
        end
      end

      Imes::QhBdlc.create(
          gsdm: gsdm, bddm: bddm, bdbh: bdbh, qhzt: 0, lxdm: 'D238',
          bzdm: 9999, lclx: 'S', zwdm: 'SQYH', qhlx: 'Z',
          yxxs: 1000, sqyh: applicant, jlsj: Time.now, ysyh: applicant)

      Imes::QhBdtx.create(
          gsdm: gsdm, bddm: bddm, bdbh: bdbh, bdtx: "D238 Confirm #{bdbh} #{bdrq} #{applicant}"
      )
      self.bdnr = params[:bdnr]
      self.bdzt = 'X'
      save
    end
  end
end
