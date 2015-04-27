class ChangeMapFromGame < ActiveRecord::Migration
  def change
  	change_column :games, :map, :string
  end
end
