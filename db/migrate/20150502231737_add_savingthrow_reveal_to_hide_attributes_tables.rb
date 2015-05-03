class AddSavingthrowRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :savingthrow_reveal, :boolean
  end
end
