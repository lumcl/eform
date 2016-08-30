class Imes::D034h < Imesdb
  self.table_name = 'D034H'
  self.primary_keys = :bdbh

  validates_uniqueness_of :vbeln

  has_many :imes_d034ls, :class_name => 'Imes::D034l', foreign_key: :bdbh, :dependent => :destroy
  has_many :imes_d034ms, :class_name => 'Imes::D034m', foreign_key: :bdbh, :dependent => :destroy
  has_one :imes_d034lz, :class_name => 'Imes::D034z', foreign_key: :vtweg, primary_key: :vtweg
  has_many :imes_qh_bdlcs, :class_name => 'Imes::QhBdlc', foreign_key: :bdbh, :dependent => :destroy

  def self.saprfc
    Imes::D034h.where(rfc_type: 'E').each do |row|
      if row.bdjg.eql?('Y')
        row.after_approved
      else
        row.after_rejected
      end
    end
  end

  def str_qhlc(params)
    Imes::D034h.transaction do
      seq = 100
      if params[:shenhe].present?
        params[:shenhe].split(',').each do |name|
          Imes::QhBdlc.create(
              gsdm: gsdm, bddm: bddm, bdbh: bdbh, qhzt: 0, lxdm: 'D034',
              bzdm: seq, lclx: 'S', zwdm: 'REV', qhlx: 'R',
              yxxs: 1000, sqyh: sqyh, jlsj: Time.now, ysyh: name)
          seq = seq + 100
        end
      end

      params[:hezhun].split(',').each do |name|
        Imes::QhBdlc.create(
            gsdm: gsdm, bddm: bddm, bdbh: bdbh, qhzt: 0, lxdm: 'D034',
            bzdm: seq, lclx: 'S', zwdm: 'APV', qhlx: 'A',
            yxxs: 1000, sqyh: sqyh, jlsj: Time.now, ysyh: name)
        seq = seq + 100
      end

      if params[:wenyuan].present?
        params[:wenyuan].split(',').each do |name|
          Imes::QhBdlc.create(
              gsdm: gsdm, bddm: bddm, bdbh: bdbh, qhzt: 0, lxdm: 'D034',
              bzdm: seq, lclx: 'S', zwdm: 'SGWY', qhlx: 'R',
              yxxs: 1000, sqyh: sqyh, jlsj: Time.now, ysyh: name)
          seq = seq + 100
        end
      end

      if params[:caigou].present?
        params[:caigou].split(',').each do |name|
          Imes::QhBdlc.create(
              gsdm: gsdm, bddm: bddm, bdbh: bdbh, qhzt: 0, lxdm: 'D034',
              bzdm: seq, lclx: 'S', zwdm: 'CGJL', qhlx: 'I',
              yxxs: 1000, sqyh: sqyh, jlsj: Time.now, ysyh: name)
          seq = seq + 100
        end
      end

      if params[:shengguan].present?
        params[:shengguan].split(',').each do |name|
          Imes::QhBdlc.create(
              gsdm: gsdm, bddm: bddm, bdbh: bdbh, qhzt: 0, lxdm: 'D034',
              bzdm: seq, lclx: 'S', zwdm: 'SGJL', qhlx: 'I',
              yxxs: 1000, sqyh: sqyh, jlsj: Time.now, ysyh: name)
          seq = seq + 100
        end
      end

      if params[:zhihui].present?
        params[:zhihui].split(',').each do |name|
          Imes::QhBdlc.create(
              gsdm: gsdm, bddm: bddm, bdbh: bdbh, qhzt: 0, lxdm: 'D034',
              bzdm: seq, lclx: 'P', zwdm: 'ZH', qhlx: 'I',
              yxxs: 1000, sqyh: sqyh, jlsj: Time.now, ysyh: name)
          seq = seq + 100
        end
      end

      Imes::QhBdlc.create(
          gsdm: gsdm, bddm: bddm, bdbh: bdbh, qhzt: 0, lxdm: 'D034',
          bzdm: 9999, lclx: 'S', zwdm: 'SQYH', qhlx: 'Z',
          yxxs: 1000, sqyh: sqyh, jlsj: Time.now, ysyh: sqyh)

      Imes::QhBdtx.create(
          gsdm: gsdm, bddm: bddm, bdbh: bdbh, bdtx: "SO Confirm #{name1} #{matnr} #{werks}"
      )
      self.bdnr = params[:bdnr]
      self.bdzt = 'X'
      save
    end
  end

  def after_approved
    after_rfc Saprfc::BapiSalesOrderChange.reason_code(vbeln, ' ')
  end

  def after_rejected
    after_rfc Saprfc::BapiSalesOrderChange.reason_code(vbeln, '06')
  end

  def after_rfc(rfc_messages)
    self.rfc_at = Time.now
    message = []
    send_mail = false
    rfc_messages.each do |row|
      self.rfc_type = row[:type]
      send_mail = true if row[:type].eql?('E')
      message.append "#{row[:type]} #{row[:id]} #{row[:number]} #{row[:message]}"
    end
    self.rfc_msg = message.join('\n')
    save

    if send_mail
      Mail.defaults do
        delivery_method :smtp, address: '172.31.1.253', port: 25
      end
      Mail.deliver do
        from 'lum.cl@l-e-i.com'
        to 'lum.cl@l-e-i.com'
        subject "D034H SAPRFC ERROR MSG"
        body rfc_msg
      end
    end
  end

  def create_record
    sql = "
            with
              tvbak as (
                select a.erdat,a.auart,f.bezei,a.vtweg,a.waerk,a.bukrs_vf,a.bstnk,
                       a.kunnr,d.name1,a.vgbel,a.vsbed,g.vtext,b.inco1,b.inco2,
                       c.kunnr kunnr_d,e.stras,a.vkgrp,a.ernam
                  from sapsr3.vbak a
                    left join sapsr3.vbkd b on b.mandt=a.mandt and b.vbeln=a.vbeln and b.posnr='000000'
                    left join sapsr3.vbpa c on c.mandt=a.mandt and c.vbeln=a.vbeln and c.posnr='000000' and c.parvw='WE'
                    left join sapsr3.kna1 d on d.mandt=a.mandt and d.kunnr=a.kunnr
                    left join sapsr3.kna1 e on e.mandt=c.mandt and e.kunnr=c.kunnr
                         join sapsr3.tvakt f on f.mandt=a.mandt and f.spras='M' and f.auart=a.auart
                         join sapsr3.tvsbt g on g.mandt=a.mandt and g.spras='M' and g.vsbed=a.vsbed
                  where a.mandt='168' and a.vbeln=?),
              ttcurr as (
                select nvl(b.ukurs,1) ukurs, rownum rid
                  from tvbak a left join sapsr3.tcurr b on b.mandt='168' and b.kurst='M' and b.tcurr='RMB' and b.fcurr=a.waerk
                  order by b.gdatu)
              select *
                from tvbak,ttcurr
                where rid = 1
             "
    rows = Sapdb.find_by_sql([sql, vbeln])
    if rows.present?
      row = rows.first
      self.audat = row.erdat
      self.ernam = row.ernam
      self.vtweg = row.vtweg
      self.auart = row.auart
      self.auartx = row.bezei
      self.kunnr = row.kunnr
      self.name1 = row.name1
      self.addr1 = row.stras
      self.bstkd = row.bstnk
      self.inco1 = row.inco1
      self.inco2 = row.inco2
      self.vbsed = "#{row.vsbed} #{row.vtext}"
      self.quote = row.vgbel
      self.waerk = row.waerk
      self.exrate = row.ukurs
      self.gsdm = row.bukrs_vf
      self.bddm = 'D034'
      self.bdbh = "#{row.vtweg}-D034-#{vbeln}"

      sql = "
            select a.posnr,a.matnr,a.kdmat,a.waerk,(a.netpr/a.kpein) netpr,
             a.werks,a.vstel,b.edatu,b.wmeng,b.mbdat
        from sapsr3.vbap a
          join sapsr3.vbep b on b.mandt=a.mandt and b.vbeln=a.vbeln and b.posnr=a.posnr and b.wmeng <> 0
        where a.mandt='168' and a.vbeln='#{vbeln}' and a.abgru='07'
      "
      vbaps = Sapdb.find_by_sql sql
      if vbaps.present?
        vbap = vbaps.first
        self.matnr = vbap.matnr
        self.werks = vbap.werks
        self.pwerk = determine_pwerk
        self.kdmat = vbap.kdmat
        if waerk == 'TWD' or waerk == 'JPY'
          self.netpr = vbap.netpr * 100
        else
          self.netpr = vbap.netpr
        end

        sql = "select stprs,matam,labam,mcham,ovham from zcost where bwkey=? and matnr=?"
        zcosts = Sapco.find_by_sql([sql, pwerk, matnr])
        if zcosts.present?
          self.mat = zcosts.first.matam
          self.lab = zcosts.first.labam
          self.ovh = zcosts.first.ovham
          self.mch = zcosts.first.mcham
          self.profit = profit
        end

        self.mark1 = Saprfc::RfcReadText.shipping_mark(vbeln, vbap.posnr, 'Z001')
        self.mark2 = Saprfc::RfcReadText.shipping_mark(vbeln, vbap.posnr, 'Z002')
        Imes::D034h.transaction do
          vbaps.each do |vbap|

            Imes::D034l.create!(
                bdbh: bdbh,
                vbeln: vbeln,
                posnr: vbap.posnr,
                wmeng: vbap.wmeng,
                mbdat: vbap.mbdat,
                edatu: vbap.edatu)
          end
          self.save!
        end
      end
    end
  end

  def determine_pwerk
    if werks == '101A' or werks == '921A' or werks == '701A'
      if vtweg == 'PH'
        '111A'
      elsif vtweg == 'DT'
        '481A'
      else
        '381A'
      end
    else
      werks
    end
  end

  def unit_cost
    mat + lab + ovh + mch
  end

  def profit
    (netpr * exrate) - unit_cost
  end

  def profit_percentage
    return 0 if netpr == 0
    (profit * 100) / (netpr * exrate)
  end

end
