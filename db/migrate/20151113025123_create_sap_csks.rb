class CreateSapCsks < ActiveRecord::Migration
  def change
    execute "
      create materialized view sap_csks
        build immediate refresh complete start with round(sysdate + 1) + 3/24 next sysdate + 1
      as
        select a.kostl,b.ktext,a.datbi,a.datab,a.bukrs,a.kosar,a.waers,a.prctr,a.khinr,a.func_area,a.objnr, sysdate created_at
          from sapsr3.csks@sapp a
            left join sapsr3.cskt@sapp b on b.mandt=a.mandt and b.spras='M' and b.kokrs=a.kokrs and b.kostl=a.kostl and b.datbi < to_char(sysdate,'yyyymmdd')
          where a.mandt='168' and a.kokrs='3058'
            "
    add_index :sap_csks, [:kostl, :datbi]
  end
end
