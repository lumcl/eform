class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :company, :string
    add_column :users, :role, :string
    add_column :users, :job_title, :string
    add_column :users, :job_level, :string
    add_column :users, :region, :string
    add_column :users, :factory, :string
    add_column :users, :product_line, :string
    add_column :users, :cost_center, :string
    add_column :users, :waers, :string
  end
end
