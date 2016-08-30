class Sap::Tcurr < ActiveRecord::Base
  self.primary_key = :waers

  def self.select_options
    Sap::Tcurr.select("waers, waers ||' - '|| ktext ktext ").order(:waers)
  end
end
