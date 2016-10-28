class Imes::D238z < Imesdb
  self.table_name = 'D238Z'
  self.primary_keys = :company_site

  belongs_to :imes_d238h, :class_name => 'Imes::D238h', foreign_key: :company_site

  def self.approver(sap_user_id)
    Imes::D238z.where(company_site: sap_user_id[0..1]).pluck(:hezhun).join(',') if sap_user_id.present?
  end
end
