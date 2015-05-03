class AddAttackdescriptionRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :attackdescription_reveal, :boolean
  end
end
