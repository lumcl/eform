class CreateImesD034h < ActiveRecord::Migration
  def change
    create_table 'imes.d034h', id: false do |t|
      t.string :vbeln, null: false
      t.string :vtweg
      t.string :audat
      t.string :auart
      t.string :ernam
      t.string :auartx
      t.string :matnr, null: false
      t.string :werks
      t.string :pwerk
      t.string :kunnr, null: false
      t.string :name1
      t.string :addr1
      t.string :bstkd
      t.string :kdmat
      t.string :inco1
      t.string :inco2
      t.string :vbsed
      t.string :quote
      t.string :waerk
      t.decimal :netpr, precision: 15, scale: 6, default: 0
      t.decimal :exrate, precision: 15, scale: 6, default: 0
      t.decimal :mat, precision: 15, scale: 6, default: 0
      t.decimal :lab, precision: 15, scale: 6, default: 0
      t.decimal :ovh, precision: 15, scale: 6, default: 0
      t.decimal :mch, precision: 15, scale: 6, default: 0
      t.decimal :profit, precision: 15, scale: 6, default: 0
      t.string :sqyh
      t.date :sqsj
      t.string :qhyh
      t.date :qhsj
      t.string :bdjg
      t.string :bdfd
      t.string :gsdm
      t.string :bdbh, null: false
      t.string :bddm
      t.string :bdzt
      t.text :mark1
      t.text :mark2
      t.string :rfc_type
      t.date :rfc_at
      t.text :rfc_msg
      t.text :bdnr
    end
    add_index 'imes.d034h', :bdbh, unique: true
    add_index 'imes.d034h', :vbeln, unique: true
    add_index 'imes.d034h', :kunnr
    add_index 'imes.d034h', :matnr
  end
end
