class AddCharacterbonusRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :characterbonus_reveal, :boolean
  end
end
