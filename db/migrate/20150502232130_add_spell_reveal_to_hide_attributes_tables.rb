class AddSpellRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :spell_reveal, :boolean
  end
end
