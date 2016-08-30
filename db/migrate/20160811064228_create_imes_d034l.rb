class CreateImesD034l < ActiveRecord::Migration
  def change
    create_table 'imes.d034l' do |t|
      t.string :bdbh, null: false
      t.string :vbeln, null: false
      t.string :posnr, null: false
      t.decimal :wmeng
      t.string :edatu
      t.string :mbdat
      t.string :purdate
      t.string :strdate
      t.string :duedate
      t.string :aufnr
    end
    add_index 'imes.d034l', :bdbh
    add_index 'imes.d034l', [:vbeln, :posnr]
  end
end
