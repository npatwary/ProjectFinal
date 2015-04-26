class CreatePlayerCharacterClasses < ActiveRecord::Migration
  def change
    create_table :player_character_classes do |t|
      t.string  :name
      t.string  :hitDice
      t.integer :currentHitPoint
      t.string  :maximumHitPoint
      t.text    :armorProficiency
      t.text    :weaponProficiency
      t.text    :toolsProfiency

      t.text    :savingThroughs, :default => [].to_yaml
      t.text    :proficientSkills, :default => [].to_yaml
      t.text    :equipment, :default => [].to_yaml


      t.integer :spellcastAbility
      t.integer :spellSaveDC
      t.integer :spellAttackBonus
      
      t.timestamps null: false
    end
  end
end
