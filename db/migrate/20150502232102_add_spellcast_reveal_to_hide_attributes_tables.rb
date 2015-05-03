class AddSpellcastRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :spellcast_reveal, :boolean
  end
end
