class CreateSavingThroughsTableForClasses < ActiveRecord::Migration
  def change
    create_table :saving_throughs_table_for_classes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
