class CreateSapT001 < ActiveRecord::Migration
  def change
    execute "
      create materialized view sap_t001
        build immediate refresh complete start with round(sysdate + 1) + 3/24 next sysdate + 1
      as
        select bukrs,butxt,waers,opvar,mwskv,mwska,sysdate created_at from sapsr3.t001@sapp where mandt='168' and ktopl='3058'
              "
    add_index :sap_t001, :bukrs
  end
end
