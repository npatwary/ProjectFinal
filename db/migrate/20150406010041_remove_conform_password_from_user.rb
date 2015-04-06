class RemoveConformPasswordFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :conform_password, :string
  end
end
