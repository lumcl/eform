class CreateImesD238h < ActiveRecord::Migration
  def change
    create_table 'imes.d238h', id: false do |t|
      t.string :company_site
      t.string :required_department
      t.string :applicant
      t.string :sro_no
      t.string :customer_name
      t.string :customer_id
      t.string :lei_design_no
      t.string :asset_code
      t.date :apply_date
      t.string :beneficiary
      t.string :charge_code
      t.string :electronic_engineer
      t.string :electronic_engineer_ext
      t.string :mechanical_engineer
      t.string :mechanical_engineer_ext
      t.decimal :cavity_quantity, precision: 15, scale: 6, default: 0
      t.string :tooling_life
      t.string :ee_spec
      t.string :power_application
      t.string :currency
      t.decimal :target_price, precision: 15, scale: 6, default: 0
      t.decimal :est_qty, precision: 15, scale: 6, default: 0
      t.decimal :est_product_life, precision: 15, scale: 6, default: 0
      t.decimal :est_cost, precision: 15, scale: 6, default: 0
      t.decimal :gross_profit, precision: 15, scale: 6, default: 0
      t.string :lei_drawing
      t.string :tooling_schedule
      t.string :tooling_drawing
      t.string :approval_record
      t.date :est_delivery_date
      t.decimal :required_sample_amount, precision: 15, scale: 6, default: 0
      t.string :required_sample_color
      t.string :production_site
      t.string :new_tooling_proposal
      t.string :apply_item
      t.string :tooling_category
      t.string :ac_pin
      t.decimal :payment_provider, precision: 15, scale: 6, default: 0
      t.decimal :est_tooling_charge, precision: 15, scale: 6, default: 0
      t.decimal :est_safty_charge, precision: 15, scale: 6, default: 0
      t.decimal :est_profit_after_1st_year, precision: 15, scale: 6, default: 0
      t.string :verification_requirement
      t.string :m_e_department
      t.string :specified_material
      t.string :attachment
      t.string :purchasing_department
      t.string :supplier
      t.string :reason
      t.string :attachment01
      t.string :tooling_material
      t.decimal :min_life_cycle_tooling, precision: 15, scale: 6, default: 0
      t.decimal :related_cost, precision: 15, scale: 6, default: 0
      t.decimal :tooling_cost, precision: 15, scale: 6, default: 0
      t.decimal :unit_price, precision: 15, scale: 6, default: 0
      t.string :est_tooling_schedule
      t.string :t1
      t.string :ppr
      t.string :mp
      t.string :execution_requirement
      t.string :me_en_department
      t.date :open_tooling_date
      t.string :verification_status
      t.string :fail_reason_desc
      t.string :attachment11
      t.string :lei_p_n
      t.string :c_e_department
      t.date :approval_date
      t.string :attachment1
      t.string :verification_status
      t.string :fail_reason
      t.string :component_approval_code
      t.string :purchasing_department
      t.date :approval_date
      t.string :attachment21
      t.string :approval_schedule
      t.string :sales_department
      t.date :est_payment_date
      t.date :est
      t.decimal :payment1, precision: 15, scale: 6, default: 0
      t.date :actual_payment_receipt_date
      t.decimal :actual, precision: 15, scale: 6, default: 0
      t.decimal :payment2, precision: 15, scale: 6, default: 0
      t.decimal :est_forecasted_demand, precision: 15, scale: 6, default: 0
      t.decimal :actual_demand, precision: 15, scale: 6, default: 0
      t.decimal :cus_pay_amount, precision: 15, scale: 6, default: 0
      t.decimal :cus_pay_accrued_into, precision: 15, scale: 6, default: 0
      t.decimal :lei_pay_amount, precision: 15, scale: 6, default: 0
      t.decimal :lei_pay_accrued_into, precision: 15, scale: 6, default: 0
      t.string :gsdm
      t.string :bddm, null: false
      t.string :bdbh, null: false
      t.date :bdrq
      t.string :bdzt
      t.string :qhyh
      t.date :qhsj
      t.date :yxsj
      t.string :jlyh
      t.date :jlsj
      t.string :gxyh
      t.date :gxsj
      t.string :bdjg
      t.string :bdfd
      t.timestamps null: false
    end

    add_index 'imes.d238h', :bdbh, unique: true
  end
end
