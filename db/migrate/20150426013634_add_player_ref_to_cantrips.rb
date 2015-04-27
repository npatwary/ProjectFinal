class AddPlayerRefToCantrips < ActiveRecord::Migration
  def change
    add_reference :cantrips, :playercharacter, index: true
    add_foreign_key :cantrips, :playercharacters
  end
end
