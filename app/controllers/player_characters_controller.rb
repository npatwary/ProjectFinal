class PlayerCharactersController < ApplicationController
  before_action :set_player_character, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  # GET /player_characters
  # GET /player_characters.json
  def index
    @player_characters = current_user.player_characters
  end

  # GET /player_characters/1
  # GET /player_characters/1.json
  def show
    @player_character = PlayerCharacter.find(params[:id])
  end

  # GET /player_characters/new
  def new
    @player_character = PlayerCharacter.new()
  end

  # GET /player_characters/1/edit
  def edit
  end

  # POST /player_characters
  # POST /player_characters.json
  def create
    @player_character = current_user.player_characters.new(player_character_params)
    # if user want to add/remove weapons or shields, else do normal create function
    if params[:add_attack_weapon]
      @player_character.attack_weapons.build
      render :new
    elsif params[:remove_attack_weapon]
      # nested model that have _destroy attribute = 1 automatically deleted by rails
      render :new
    elsif params[:add_armor_and_shield]
      @player_character.armor_and_shields.build
      render :new
    elsif params[:remove_armor_and_shield]
      render :new
    elsif params[:add_cantrip]
      @player_character.cantrips.build
      render :new
    else
      # normal create function
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
  end

  # PATCH/PUT /player_characters/1
  # PATCH/PUT /player_characters/1.json
  def update
    # if user want to add/remove wweapons or shields
    

   if params[:add_attack_weapon]
      # rebuild the attack weapon attributes that doesn't have an id
      unless params[:player_character][:attack_weapons_attributes].blank?
        for attribute in params[:player_character][:attack_weapons_attributes]
          puts attribute
          unless attribute.last.has_key?(:id)
            @player_character.attack_weapons.build(attribute.last.except(:_destroy)) 
          end
        end
      end
      # add one more empty attack_weapons attribute
      @player_character.attack_weapons.build
      render :edit
    elsif params[:remove_attack_weapon]
      # collect all marked for delete attack_weapon ids
      removed_attack_weapons = params[:player_character][:attack_weapons_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
      # physically delete the attack_weapons from database
      AttackWeapon.delete(removed_attack_weapons)
      flash[:notice] = "Attack weapon(s) removed."
      for attribute in params[:player_character][:attack_weapons_attributes]
        # rebuild attack_weapon attributes that doesn't have an id and its _destroy attribute is not 1
        @player_character.attack_weapons.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
      end
      render :edit

    elsif params[:add_armor_and_shield]
      # rebuild the armor and shields attributes that doesn't have an id
      unless params[:player_character][:armor_and_shields_attributes].blank?
        for attribute in params[:player_character][:armor_and_shields_attributes]
          @player_character.armor_and_shields.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
        end
      end
      # add one more empty armor_and_shields attribute
      @player_character.armor_and_shields.build
      render :edit

    elsif params[:remove_armor_and_shield]
      # collect all marked for delete attack_weapon ids
      removed_attack_weapons = params[:player_character][:armor_and_shields_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
      # physically delete the attack_weapons from database
      ArmorAndShield.delete(removed_attack_weapons)
      flash[:notice] = "Armor and Shield(s) removed."
      for attribute in params[:player_character][:armor_and_shields_attributes]
        # rebuild armor and shield attributes that doesn't have an id and its _destroy attribute is not 1
        @player_character.armor_and_shields.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
      end
      render :edit


    elsif params[:add_cantrip]
      # rebuild the cantrips attributes that doesn't have an id
      unless params[:player_character][:cantrips_attributes].blank?
        for attribute in params[:player_character][:cantrips_attributes]
          @player_character.cantrips.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
        end
      end
      # add one more empty cantrips attribute
      @player_character.cantrips.build
      render :edit

    elsif params[:remove_cantrip]
      # collect all marked for delete attack_weapon ids
      removed_cantrips = params[:player_character][:cantrips_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
      # physically delete the attack_weapons from database
      Cantrip.delete(removed_cantrips)
      flash[:notice] = "Cantrip removed."
      for attribute in params[:player_character][:cantrips_attributes]
        # rebuild armor and shield attributes that doesn't have an id and its _destroy attribute is not 1
        @player_character.cantrips.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
      end
      render :edit

    else
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
      params.require(:player_character).permit(:add_attack_weapon, :add_armor_and_shield, :add_cantrip, :remove_cantrip, :remove_armor_and_shield, :removed_attack_weapons, :isUsed, :name, :classDnD, :level, :background, :race, :alignment, :experiencePoints, :inspiration, :proficiencyBonus, :armorClass, :initiative, :speed, :currentHitPoints, :maxHitPoints, :temporaryHitPoints, :totalHitDice, :hitDice, :deathSaveSuccesses, :deathSaveFailures, :personalityTraits, :ideals, :bonds, :flaws, :attacksDescription, :passiveWisdom, :otherProficienciesAndLanguages, :maxEquipmentCarryCapacity, :currentEquipmentCarryCapacity, :featuresAndTraits, :age, :height, :weight, :eyes, :skin, :hair, :characterAppearance, :characterBackstory, :additionalFeaturesAndTraits, :treasure, :spellCastingAbility, :spellSaveDC, :spellAttackBonus, ability_scores_attributes: [:id, :name, :score, :modifier ], skills_attributes: [:id, :name, :proficient, :modifier, :ability], saving_throws_attributes: [:id, :name, :proficient, :modifier], wealth_attributes: [:id, :copper, :silver, :electrum, :gold, :platinum], attack_weapons_attributes: [:name, :attackBonus, :damage, :typeDnD, :cost, :unit, :id, :_destroy], armor_and_shields_attributes: [:name, :disadvantage, :cost, :unit, :id, :_destroy], allies_and_organizations_attributes: [:id, :name, :symbolDnD, :description], cantrips_attributes: [:name, :id, :_destroy])
    end
    # def ability_score_params
    #   params.require(:ability_score).permit(:name, :score, :modifier)
    # end
  end
