class Imes::Q001h < Imesdb

  self.table_name = 'Q001H'
  self.primary_keys = :bdbh

  has_many :imes_qh_bdlcs, :class_name => 'Imes::QhBdlc', foreign_key: :bdbh
  has_one :imes_qh_bdtx, :class_name => 'Imes::QhBdtx', foreign_key: :bdbh
  has_many :imes_q001ls, :class_name => 'Imes::Q001l', foreign_key: :bdbh

  def jcfs_text
    case jcfs
      when 'diy' then '自行進入DT廠'
      when 'diytx' then '自行進入TX廠'
      when 'airport' then '機場接人'
      when 'station' then '鎮江火車站接人'
      when 'other' then '其他'
    end
  end

  def jcdd_text
    case jcdd
      when 'restaurant' then '飯店'
      when 'canteen' then '公司餐廳'
      when 'diy' then '自行解決'
    end
  end

  def zsap_text
    case zsap
      when 'hotel' then '酒店'
      when 'dom' then '高舍'
      when 'txdom' then '東舍'
      when 'diy' then '自行解決'
      when 'no' then '不需要'
    end
  end

  def hyzy_option(option)
    case option
      when 'r101' then 'R101'
      when 'r102' then 'R102'
      when 'r103' then 'R103'
      when 'r104' then 'R104'
      when 'frontdesk' then '前台'
      when 'rdcenter' then '工程中心'
      when 'sxA' then '三相A'
      when 'sxB' then '三相B'
      when 'sxC' then '三相C'
    end
  end

  def hyzy_text(options)
    hyzy_text = ''
    options.split(',').each do |option|
      hyzy_text = "#{hyzy_text}, " if hyzy_text.present?
      hyzy_text = "#{hyzy_text}#{hyzy_option(option)}"
    end
    return hyzy_text
  end

  def qtzy_option(option)
    case option
      when 'welcomebrd' then '歡迎牌'
      when 'flower' then '迎賓盆花'
      when 'coffe' then '咖啡'
      when 'tea' then '茶水'
      when 'water' then '礦泉水'
    end
  end

  def qtzy_text(options)
    qtzy_text = ''
    options.split(',').each do |option|
      qtzy_text = "#{qtzy_text}, " if qtzy_text.present?
      qtzy_text = "#{qtzy_text}#{qtzy_option(option)}"
    end
    return qtzy_text
  end


end
