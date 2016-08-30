class Imes::QhBdlc < Imesdb

  self.table_name = 'QH_BDLC'
  self.primary_keys = :bdbh, :bzdm
  has_one :imes_qh_bdtx, :class_name => 'Imes::QhBdtx', foreign_key: :bdbh, :dependent => :destroy

  def self.validates_approver
    users = []
    User.all_email.each do |row|
      users.append row.mail.first.split('@').first.upcase
    end
    list = Imes::QhBdlc.where("qhzt < 3")
    list.each do |row|
      if users.include?(row.ysyh) == false
        row.qhzt = '9'
        row.qhyh = 'SYSTEM'
        row.qhnr = '------'
        row.qhjg = 'Y'
        row.qhsj = Time.now
        row.save
        puts row.bdbh
      end
    end
  end

  def create_hui_qian(email_list)
    sql = "
      select bzdm from (select bzdm from qh_bdlc where bdbh=? and bzdm > ? order by bzdm) where rownum = 1
    "
    rows = Imes::QhBdlc.find_by_sql([sql,bdbh,bzdm])
    max_bzdm = rows.present? ? rows.first.bzdm : 999
    next_bzdm = bzdm + 1
    emails = []
    email_list.split(',').each do |email|
      emails.append email if (User.search("#{email}@l-e-i.com")).present?
    end

    emails.each do |email|
      new_obj = self.dup
      new_obj.qhzt = 0
      new_obj.bdbh = bdbh
      new_obj.bzdm = next_bzdm
      new_obj.zwdm = ''
      new_obj.qhlx = 'I'
      new_obj.jlsj = Time.now
      new_obj.yjsj = ''
      new_obj.yxsj = Time.now
      new_obj.ysyh = email
      new_obj.dlyh = ''
      new_obj.qhyh = ''
      new_obj.qhsj = ''
      new_obj.qhjg = ''
      new_obj.qhnr = ''
      new_obj.qhfd = ''
      new_obj.save
      next_bzdm = next_bzdm + 1
      next_bzdm = 8001 if next_bzdm == max_bzdm
    end

    if qhjg.eql?('H')
      #會簽后重簽自己
      new_obj = self.dup
      new_obj.qhzt = 0
      new_obj.bdbh = bdbh
      new_obj.bzdm = next_bzdm
      new_obj.zwdm = ''
      new_obj.jlsj = Time.now
      new_obj.yjsj = ''
      new_obj.yxsj = Time.now
      new_obj.dlyh = ''
      new_obj.qhyh = ''
      new_obj.qhsj = ''
      new_obj.qhjg = ''
      new_obj.qhnr = ''
      new_obj.qhfd = ''
      new_obj.save
      self.qhlx = 'R' if qhlx.eql?('A')
    end

  end

end
