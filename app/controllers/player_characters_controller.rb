class PlayerCharactersController < ApplicationController
  before_action :set_player_character, only: [:show, :edit, :showOthers, :update, :destroy,:market]
  before_action :logged_in_user, only: [:index, :show, :new, :showOthers, :edit, :create, :update, :destroy, :ajaxwindow,:market]

  include PlayerCharactersHelper
  # GET /player_characters
  # GET /player_characters.json
  def index
    @player_characters = current_user.player_characters
  end

  # GET /player_characters/1
  # GET /player_characters/1.json
  def show

    @player_character = PlayerCharacter.find(params[:id])
    
    @user_id = current_user.id;

    @dm_id = params[:dm_id];
   #@revealTable = HideAttributesTable.find(params[:id]); 

    @revealTable = HideAttributesTable.find_by pc_id:  @player_character.id; 
    #fix for player_controller test should show player_character
    @revealTable = HideAttributesTable.new(pc_id: pc_id,ability_reveal: true) if @revealTable.nil?



  end

  # GET /player_characters/new
  def new
    @player_character = PlayerCharacter.new()
  end

  def 
  # GET /player_characters/1/edit
  def edit
    @hide_attributes_table = HideAttributesTable.find_by pc_id: pc_id
  end

  # POST /player_characters
  # POST /player_characters.json
  def create
    @player_character = current_user.player_characters.new(player_character_params);

    @player_character.race = Race.find(params[:player_character][:race]).name if Race.exists? (params[:player_character][:race])
    @player_character.classDnD = PlayerCharacterClass.find(params[:player_character][:classDnD]).name if PlayerCharacterClass.exists? (params[:player_character][:classDnD]) 

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
    elsif params[:remove_cantrip]
      render :new
    elsif params[:add_spell]
      @player_character.cantrips.build
      render :new
    elsif params[:remove_spell]
      render :new
    else
      # normal create function
      respond_to do |format|
        if @player_character.save
          @hideTable = HideAttributesTable.new(pc_id:@player_character.id , ability_reveal: true);
          @hideTable.save
          format.html { redirect_to @player_character, notice: 'Player character was successfully created.' }
          format.json { render :show, status: :created, location: @player_character }
        else
          format.html { render :new }
          format.json { render json: @player_character.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  # POST /player_characters/ajaxwindow/:background
  def ajaxwindow
    background = params[:background]
    data = {  'personalityTraits' => personalityTraits5EFor(background),
              'ideals' => ideals5EFor(background),
              'bonds' => bonds5EFor(background),
              'flaws' => flaws5EFor(background),
              'backgroundFeature' => backgroundFeature5EFor(background)
            }
    respond_to do |format|
      format.json { render json: data }
    end
  end

  # PATCH/PUT /player_characters/1
  # PATCH/PUT /player_characters/1.json
  def update
    # if user want to add/remove wweapons or shields
    @player_character = PlayerCharacter.find(params[:id])
    pc_id = @player_character.id
    @hide_attributes_table = HideAttributesTable.find_by pc_id: pc_id
   # @collect_ability_hideattr = (params[:ability_hide].present? ? params[:ability_hide] : nil)

   # byebug
    @collect_ability_hideattr = params[:ability_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(ability_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:skill_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(skill_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:characterbonus_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(characterbonus_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:savingthrow_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(savingthrow_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:attribute_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(attribute_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:wealth_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(wealth_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:personality_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(personality_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:physicalfeature_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(physicalfeature_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:carry_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(carry_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:spellcast_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(spellcast_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:attackweapon_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(attackweapon_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:spell_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(spell_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:armorandshield_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(armorshield_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:attack_description_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(attackdescription_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:characterdescription_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(characterdescription_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:alliesandorganization_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(alliesandorganisation_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:additionalfeature_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(additionalfeature_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:treasure_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(treasure_reveal: @collect_ability_hideattr)


     @collect_ability_hideattr = params[:equipment_hide_reveal];
    if @collect_ability_hideattr.nil?
        @collect_ability_hideattr = true;
    else
        @collect_ability_hideattr = false;
    end
    
    @hide_attributes_table.update(equipment_reveal: @collect_ability_hideattr)

    #byebug
    

   if params[:add_attack_weapon]
      # rebuild the attack weapon attributes that doesn't have an id
      unless params[:player_character][:attack_weapons_attributes].blank?
        for attribute in params[:player_character][:attack_weapons_attributes]
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

    elsif params[:add_spell]
      # rebuild the spells attributes that doesn't have an id
      unless params[:player_character][:spells_attributes].blank?
        for attribute in params[:player_character][:spells_attributes]
          @player_character.spells.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
        end
      end
      # add one more empty spell attribute
      @player_character.spells.build
      render :edit

    elsif params[:remove_spell]
      # collect all marked for delete spell ids
      removed_spells = params[:player_character][:spells_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
      # physically delete the spells from database
      Spell.delete(removed_spells)
      flash[:notice] = "Spell removed."
      for attribute in params[:player_character][:spells_attributes]
        # rebuild spellattributes that doesn't have an id and its _destroy attribute is not 1
        @player_character.spells.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
      end
      render :edit




    else
      respond_to do |format|
         i = 0
        @player_character.allies_and_organizations.each do |alliesAndOrganizations|
          uploaded_io =  params[:player_character][:allies_and_organizations_attributes]["#{i}"][:symbolDnDImage]
          symbol_image = nil
        unless uploaded_io.nil?
          sanitized_filename = sanitize_filename(uploaded_io.original_filename)
          sanitized_filename = "#{current_user.user_name}_#{@player_character.name}_#{sanitized_filename}"
          upload(sanitized_filename,uploaded_io)
          symbol_image = sanitized_filename
        end
        @player_character.allies_and_organizations[i].symbolDnD = symbol_image unless symbol_image.nil?
        i = i + 1
      end
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
    @hide_attributes_table = HideAttributesTable.find_by pc_id: @player_character.id
    @hide_attributes_table.destroy unless @hide_attributes_table.nil?
    @player_character.destroy
    respond_to do |format|
      format.html { redirect_to player_characters_url, notice: 'Player character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def market
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_player_character
      @player_character = PlayerCharacter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_character_params
      params.require(:player_character).permit(:add_attack_weapon, :add_armor_and_shield, :add_cantrip, :remove_cantrip, :add_spell, :remove_spell,:remove_armor_and_shield, :removed_attack_weapons, :isUsed, :name, :classDnD, :level, :background, :race, :alignment, :experiencePoints, :inspiration, :proficiencyBonus, :armorClass, :initiative, :speed, :currentHitPoints, :maxHitPoints, :temporaryHitPoints, :totalHitDice, :hitDice, :deathSaveSuccesses, :deathSaveFailures, :personalityTraits, :ideals, :bonds, :flaws, :attacksDescription, :passiveWisdom, :otherProficienciesAndLanguages, :maxEquipmentCarryCapacity, :currentEquipmentCarryCapacity, :featuresAndTraits, :age, :height, :weight, :eyes, :skin, :hair, :characterAppearance, :characterBackstory, :additionalFeaturesAndTraits, :treasure, :spellCastingAbility, :spellSaveDC, :spellAttackBonus, ability_scores_attributes: [:id, :name, :score, :modifier ], skills_attributes: [:id, :name, :proficient, :modifier, :ability], saving_throws_attributes: [:id, :name, :proficient, :modifier], wealth_attributes: [:id, :copper, :silver, :electrum, :gold, :platinum], attack_weapons_attributes: [:name, :attackBonus, :damage, :typeDnD, :cost, :unit, :id, :_destroy], armor_and_shields_attributes: [:name, :disadvantage, :cost, :unit, :id, :_destroy], allies_and_organizations_attributes: [:id, :name, :symbolDnD, :description], cantrips_attributes: [:name, :id, :_destroy], spells_attributes: [:name, :id, :_destroy])
    end
    # def ability_score_params
    #   params.require(:ability_score).permit(:name, :score, :modifier)
    # end

  end

