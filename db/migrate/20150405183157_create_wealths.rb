class CreateWealths < ActiveRecord::Migration
  def change
    create_table :wealths do |t|
      t.references :playercharacter, index: true
      t.integer :copper,:default => 0
      t.integer :silver,:default => 0
      t.integer :electrum,:default => 0
      t.integer :gold,:default => 0
      t.integer :platinum,:default => 0

      t.timestamps null: false
    end
    add_foreign_key :wealths, :player_characters
  end
end
