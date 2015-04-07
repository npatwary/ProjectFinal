class PlayerCharactersController < ApplicationController
  before_action :set_player_character, only: [:show, :edit, :update, :destroy]

  @@ability_names = ['Strength', 'Dexterity', 'Constitution', 'Intelligence', 'Wisdom', 'Charisma']
  @@skill_names = ['Acrobatics', 'Animal Handling', 'Arcana', 'Athletics', 'Deception', 'History', 'Insight', 'Intimidation', 'Investigation', 'Medicine', 'Nature', 'Perception', 'Performance', 'Religion', 'Sleight of Hand', 'Stealth', 'Survival']
  @@skill_abilities = ['Dex', 'Wis', 'Int','Str', 'Cha', 'Int', 'Wis', 'Cha', 'Int', 'Wis', 'Int', 'Wis', 'Cha', 'Cha', 'Int', 'Dex', 'Dex', 'Wis']
  # GET /player_characters
  # GET /player_characters.json
  def index
    @player_characters = PlayerCharacter.all
  end

  # GET /player_characters/1
  # GET /player_characters/1.json
  def show
  end

  # GET /player_characters/new
  def new
    @player_character = PlayerCharacter.new

    if @player_character.ability_scores.empty?
      @@ability_names.each do |n|
          @player_character.ability_scores.build(name: n)
      end
    end
    if @player_character.saving_throws.empty?
      @@ability_names.each do |n|
        @player_character.saving_throws.build(name: n)
      end
    end
    if @player_character.skills.empty?
      Hash[@@skill_names.zip(@@skill_abilities)].each do |n, a|
        @player_character.skills.build(name: n, ability: a)
      end
    end
    @player_character.attack_weapons.build if @player_character.attack_weapons.empty?
    @player_character.armor_and_shields.build if @player_character.armor_and_shields.empty?    
    @player_character.build_wealth if @player_character.wealth.nil?
    @player_character.allies_and_organizations.build if @player_character.allies_and_organizations.empty?
  end

  # GET /player_characters/1/edit
  def edit
  end

  # POST /player_characters
  # POST /player_characters.json
  def create
    @player_character = PlayerCharacter.new(player_character_params)

    respond_to do |format|
      if @player_character.save
        format.html { redirect_to @player_character, notice: 'Player character was successfully created.' }
        format.json { render :show, status: :created, location: @player_character }
      else
        format.html { render :new }
        format.json { render json: @player_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_characters/1
  # PATCH/PUT /player_characters/1.json
  def update
    respond_to do |format|
      if @player_character.update(player_character_params)
        format.html { redirect_to @player_character, notice: 'Player character was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_character }
      else
        format.html { render :edit }
        format.json { render json: @player_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_characters/1
  # DELETE /player_characters/1.json
  def destroy
    @player_character.destroy
    respond_to do |format|
      format.html { redirect_to player_characters_url, notice: 'Player character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_player_character
      @player_character = PlayerCharacter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_character_params
      params.require(:player_character).permit(:isUsed, :name, :classDnD, :level, :background, :race, :alignment, :experiencePoints, :inspiration, :proficiencyBonus, :armorClass, :initiative, :speed, :currentHitPoints, :maxHitPoints, :temporaryHitPoints, :totalHitDice, :hitDice, :deathSaveSuccesses, :deathSaveFailures, :personalityTraits, :ideals, :bonds, :flaws, :attacksDescription, :passiveWisdom, :otherProficienciesAndLanguages, :maxEquipmentCarryCapacity, :currentEquipmentCarryCapacity, :featuresAndTraits, :age, :height, :weight, :eyes, :skin, :hair, :characterAppearance, :characterBackstory, :additionalFeaturesAndTraits, :treasure, :spellCastingAbility, :spellSaveDC, :spellAttackBonus)
    end
    # def ability_score_params
    #   params.require(:ability_score).permit(:name, :score, :modifier)
    # end
  end
