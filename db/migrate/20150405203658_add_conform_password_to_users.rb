class AddConformPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :conform_password, :string
  end
end
