class AddAdditionalfeatureRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :additionalfeature_reveal, :boolean
  end
end
