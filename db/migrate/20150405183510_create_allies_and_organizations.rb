class CreateAlliesAndOrganizations < ActiveRecord::Migration
  def change
    create_table :allies_and_organizations do |t|
      t.references :playercharacter, index: true
      t.string :name
      t.string :description
      t.string :symbolDnD

      t.timestamps null: false
    end
    add_foreign_key :allies_and_organizations, :player_characters
  end
end
