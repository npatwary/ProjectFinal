class CreateWealths < ActiveRecord::Migration
  def change
    create_table :wealths do |t|
      t.references :PlayerCharacter, index: true
      t.integer :copper
      t.integer :silver
      t.integer :electrum
      t.integer :gold
      t.integer :platinum

      t.timestamps null: false
    end
    add_foreign_key :wealths, :PlayerCharacters
  end
end
