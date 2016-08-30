class CreateImesD034m < ActiveRecord::Migration
  def change
    create_table 'imes.d034m', id: false do |t|
      t.string :uuid, null: false
      t.string :d034l_id, null: false
      t.string :bdbh, null: false
      t.string :vbeln, null: false
      t.string :posnr, null: false
      t.string :aufnr, null: false
      t.string :strdate
      t.string :duedate
      t.string :creator

      t.timestamps null: false
    end
    add_index 'imes.d034m', :uuid, unique: true
    add_index 'imes.d034m', [:vbeln, :posnr]
    add_index 'imes.d034m', :d034l_id
    add_index 'imes.d034m', :aufnr
  end
end
