class CreateSapTcurr < ActiveRecord::Migration
  def change
    execute "
      create materialized view sap_tcurr
        build immediate refresh complete start with round(sysdate + 1) + 3/24 next sysdate + 1
      as
        select distinct a.tcurr waers,b.ktext,sysdate created_at
          from sapsr3.tcurr@sapp a
            join sapsr3.tcurt@sapp b on b.mandt=a.mandt and b.spras='M' and b.waers=a.tcurr
          where a.mandt='168' and a.kurst='M'
          order by a.tcurr
            "
    add_index :sap_tcurr, :waers
  end
end
