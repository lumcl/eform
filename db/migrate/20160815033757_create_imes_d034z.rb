class CreateImesD034z < ActiveRecord::Migration
  def change
    create_table 'imes.d034z', id: false do |t|
      t.string :vtweg, null: false
      t.string :shenhe
      t.string :caigou
      t.string :shengguan
      t.string :wenyuan
      t.string :zhihui
    end
  end
end
