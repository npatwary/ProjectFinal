require 'test_helper'

class PlayerCharactersControllerTest < ActionController::TestCase
  setup do
    log_in(users(:one))
    @player_character = player_characters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_characters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_character" do
    assert_difference('PlayerCharacter.count') do
      post :create, player_character: { additionalFeaturesAndTraits: @player_character.additionalFeaturesAndTraits, age: @player_character.age, alignment: @player_character.alignment, armorClass: @player_character.armorClass, attacksDescription: @player_character.attacksDescription, background: @player_character.background, bonds: @player_character.bonds, characterAppearance: @player_character.characterAppearance, characterBackstory: @player_character.characterBackstory, classDnD: @player_character.classDnD, currentEquipmentCarryCapacity: @player_character.currentEquipmentCarryCapacity, currentHitPoints: @player_character.currentHitPoints, deathSaveFailures: @player_character.deathSaveFailures, deathSaveSuccesses: @player_character.deathSaveSuccesses, experiencePoints: @player_character.experiencePoints, eyes: @player_character.eyes, featuresAndTraits: @player_character.featuresAndTraits, flaws: @player_character.flaws, hair: @player_character.hair, height: @player_character.height, hitDice: @player_character.hitDice, ideals: @player_character.ideals, initiative: @player_character.initiative, inspiration: @player_character.inspiration, isUsed: @player_character.isUsed, level: @player_character.level, maxEquipmentCarryCapacity: @player_character.maxEquipmentCarryCapacity, maxHitPoints: @player_character.maxHitPoints, name: @player_character.name, otherProficienciesAndLanguages: @player_character.otherProficienciesAndLanguages, passiveWisdom: @player_character.passiveWisdom, personalityTraits: @player_character.personalityTraits, proficiencyBonus: @player_character.proficiencyBonus, race: @player_character.race, skin: @player_character.skin, speed: @player_character.speed, spellAttackBonus: @player_character.spellAttackBonus, spellCastingAbility: @player_character.spellCastingAbility, spellSaveDC: @player_character.spellSaveDC, temporaryHitPoints: @player_character.temporaryHitPoints, totalHitDice: @player_character.totalHitDice, treasure: @player_character.treasure, weight: @player_character.weight }
    end

    assert_redirected_to player_character_path(assigns(:player_character))
  end

  test "should show player_character" do
    get :show, id: @player_character
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_character
    puts
    assert_response :success
  end

  test "should update player_character" do
    patch :update, id: @player_character, player_character: { additionalFeaturesAndTraits: @player_character.additionalFeaturesAndTraits, age: @player_character.age, alignment: @player_character.alignment, armorClass: @player_character.armorClass, attacksDescription: @player_character.attacksDescription, background: @player_character.background, bonds: @player_character.bonds, characterAppearance: @player_character.characterAppearance, characterBackstory: @player_character.characterBackstory, classDnD: @player_character.classDnD, currentEquipmentCarryCapacity: @player_character.currentEquipmentCarryCapacity, currentHitPoints: @player_character.currentHitPoints, deathSaveFailures: @player_character.deathSaveFailures, deathSaveSuccesses: @player_character.deathSaveSuccesses, experiencePoints: @player_character.experiencePoints, eyes: @player_character.eyes, featuresAndTraits: @player_character.featuresAndTraits, flaws: @player_character.flaws, hair: @player_character.hair, height: @player_character.height, hitDice: @player_character.hitDice, ideals: @player_character.ideals, initiative: @player_character.initiative, inspiration: @player_character.inspiration, isUsed: @player_character.isUsed, level: @player_character.level, maxEquipmentCarryCapacity: @player_character.maxEquipmentCarryCapacity, maxHitPoints: @player_character.maxHitPoints, name: @player_character.name, otherProficienciesAndLanguages: @player_character.otherProficienciesAndLanguages, passiveWisdom: @player_character.passiveWisdom, personalityTraits: @player_character.personalityTraits, proficiencyBonus: @player_character.proficiencyBonus, race: @player_character.race, skin: @player_character.skin, speed: @player_character.speed, spellAttackBonus: @player_character.spellAttackBonus, spellCastingAbility: @player_character.spellCastingAbility, spellSaveDC: @player_character.spellSaveDC, temporaryHitPoints: @player_character.temporaryHitPoints, totalHitDice: @player_character.totalHitDice, treasure: @player_character.treasure, weight: @player_character.weight }
    assert_redirected_to player_character_path(assigns(:player_character))
  end

  test "should destroy player_character" do
    assert_difference('PlayerCharacter.count', -1) do
      delete :destroy, id: @player_character
    end

    assert_redirected_to player_characters_path
  end
end
