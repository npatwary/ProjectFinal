class CreatePlayerCharacters < ActiveRecord::Migration
  def change
    create_table :player_characters do |t|
      t.boolean :isUsed
      t.string :name
      t.string :classDnD
      t.integer :level
      t.string :background
      t.string :race
      t.string :alignment
      t.integer :experiencePoints
      t.string :inspiration
      t.integer :proficiencyBonus
      t.integer :armorClass
      t.integer :initiative
      t.integer :speed
      t.integer :currentHitPoints
      t.integer :maxHitPoints
      t.integer :temporaryHitPoints
      t.string :totalHitDice
      t.string :hitDice
      t.integer :deathSaveSuccesses
      t.integer :deathSaveFailures
      t.string :personalityTraits
      t.string :ideals
      t.string :bonds
      t.string :flaws
      t.string :attacksDescription
      t.string :passiveWisdom
      t.string :otherProficienciesAndLanguages
      t.integer :maxEquipmentCarryCapacity
      t.integer :currentEquipmentCarryCapacity
      t.string :featuresAndTraits
      t.integer :age
      t.string :height
      t.string :weight
      t.string :eyes
      t.string :skin
      t.string :hair
      t.string :characterAppearance
      t.string :characterBackstory
      t.string :additionalFeaturesAndTraits
      t.string :treasure
      t.string :spellCastingAbility
      t.string :spellSaveDC
      t.string :spellAttackBonus

      t.timestamps null: false
    end
  end
end
