class Sap::T001 < ActiveRecord::Base
  self.primary_key = :bukrs

  def self.select_options
    Sap::T001.select("bukrs, bukrs ||' - '|| butxt butxt ").order(:bukrs)
  end
end
