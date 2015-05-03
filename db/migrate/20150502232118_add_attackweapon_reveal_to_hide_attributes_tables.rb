class AddAttackweaponRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :attackweapon_reveal, :boolean
  end
end
