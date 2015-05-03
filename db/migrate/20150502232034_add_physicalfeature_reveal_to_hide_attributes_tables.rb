class AddPhysicalfeatureRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :physicalfeature_reveal, :boolean
  end
end
