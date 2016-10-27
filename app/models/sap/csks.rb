class Sap::Csks < ActiveRecord::Base
  self.primary_keys = :kostl

  def self.dept_list
    sql = "select min(kostl) kostl, kostl||'-'||ktext ktext from sap_csks group by kostl||'-'||ktext order by kostl"
    Sap::Csks.find_by_sql(sql)
  end

end
