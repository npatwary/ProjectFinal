class CreateSkillsTableForClasses < ActiveRecord::Migration
  def change
    create_table :skills_table_for_classes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
