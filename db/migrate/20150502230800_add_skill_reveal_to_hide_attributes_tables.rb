class AddSkillRevealToHideAttributesTables < ActiveRecord::Migration
  def change
    add_column :hide_attributes_tables, :skill_reveal, :boolean
  end
end
