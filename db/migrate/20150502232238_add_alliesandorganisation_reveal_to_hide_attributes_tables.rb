class AddAlliesandorganisationRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :alliesandorganisation_reveal, :boolean
  end
end
