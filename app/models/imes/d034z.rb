class Imes::D034z < Imesdb
  self.table_name = 'D034Z'
  self.primary_keys = :vtweg

  belongs_to :imes_d034h, :class_name => 'Imes::D034h', foreign_key: :vtweg

  def self.approver(sap_user_id)
    Imes::D034z.where(vtweg: sap_user_id[0..1]).pluck(:hezhun).join(',') if sap_user_id.present?
  end
end
