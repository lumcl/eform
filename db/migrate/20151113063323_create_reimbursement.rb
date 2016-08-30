class CreateReimbursement < ActiveRecord::Migration
  def change
    create_table :reimbursement, id: false do |t|
      t.string :uuid, null: false
      t.string :name
      t.string :bukrs
      t.string :belnr
      t.string :gjahr
      t.string :blart
      t.date :budat
      t.date :bldat
      t.string :waers
      t.float :wrbtr, default: 0
      t.string :subject
      t.text :body
      t.boolean :approved
      t.string :status
      t.boolean :deleted
      t.string :owner_id
      t.string :creator_id
      t.string :updater_id
      t.string :creator_ip
      t.string :updater_ip

      t.timestamps null: false
    end
    add_index :reimbursement, :uuid, unique: true
    add_index :reimbursement, :name
  end
end
