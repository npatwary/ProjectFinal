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
    @player_character = PlayerCharacter.new();
    @pcClasses       = PlayerCharacterClass.all;

    @pcClass         = PlayerCharacterClass.find(1);
    @st_table        = SavingThroughsTableForClass.all;
    @skill_table     = SkillsTableForClass.all;
         
    @selectedClass   = @pcClass.name;

    @savingThrougs = @pcClass.savingThroughs; 
    @skills        = @pcClass.proficientSkills;
    @equipment     = @pcClass.equipment;
   
    #byebug
    
    # initializing defauls values
    @abilityScoreVaules = [15,14,13,12,10,8];
    @proficiencyBonus = 2;
    @abilityScoreModifiers = [2,2,1,1,0,-1];

    @savingThroughs = @abilityScoreModifiers; 

    @skills_points = [2,0,1,2,-1,1,0,-1,1,0,1,0,-1,-1,1,2,2];
    

if @pcClass.spellcastAbility.nil? 
   @spellCastingAbility = "N/A";
   @spellSaveDC         = "N/A";
   @spellAttackBonus    = "N/A";
  else
   @spellCastingAbility = @st_table.find(@pcClass.spellcastAbility).name;
   @spellSaveDC         = @pcClass.spellSaveDC + @abilityScoreModifiers[@pcClass.spellcastAbility.to_i-1]+@proficiencyBonus;
   @spellAttackBonus    = @pcClass.spellAttackBonus + @abilityScoreModifiers[@pcClass.spellcastAbility.to_i-1]+@proficiencyBonus;
 end  
 end

  # GET /player_characters/1/edit
  def edit
  end

  # POST /player_characters
  # POST /player_characters.json
   
  
  def create
    @player_character = current_user.player_characters.new(player_character_params)

    @pcClasses       = PlayerCharacterClass.all;

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

    elsif (params[:classSelect]&&params[:class_id])
      @checkName  = "Sohrab";
      
      @proficiencyBonus = 2;

    #byebug
      @playerCharacter = params[:player_character];
      @newAbilityScore = params[:player_character][:ability_scores_attributes];
      
      # reading ability scores
      @abilityScoreVaules = [];
      for n in (0..5) do
        @abilityScoreVaules[n] =  @newAbilityScore[(n).to_s]['score'] ;
      end
      
      # reading ability scores modifiers
      @abilityScoreModifiers = [];
      @am = [];
      for m in (0..5) do
        @abilityScoreModifiers[m] =  (@abilityScoreVaules[m].to_i-10)/2 ;
        @am[m] = (@abilityScoreVaules[m].to_i-10)/2 ;
      end
     @savingThroughs = @abilityScoreModifiers;
     # setting new skill points 
     @skills_points = [@am[1],@am[4],@am[3],@am[0],@am[5],@am[3],@am[4],@am[5],@am[3],@am[4],@am[3],@am[4],@am[5],@am[5],@am[3],@am[1],@am[1],@am[4]]; 

     
     # set attributes according to calss selection
     @@cl_id = params[:class_id]
     @pcClass         = PlayerCharacterClass.find(params[:class_id]);
     @st_table        = SavingThroughsTableForClass.all;
     @skill_table     = SkillsTableForClass.all;
         
     @savingThrougs = @pcClass.savingThroughs; 
     @skills        = @pcClass.proficientSkills;
     @equipment     = @pcClass.equipment;
     
     @selectedClass   = @pcClass.name;
     
    if @pcClass.spellcastAbility.nil? 
       @spellCastingAbility = "N/A";
       @spellSaveDC         = "N/A";
       @spellAttackBonus    = "N/A";
    else
       @spellCastingAbility = @st_table.find(@pcClass.spellcastAbility).name;
       @spellSaveDC         = @pcClass.spellSaveDC + @abilityScoreModifiers[@pcClass.spellcastAbility.to_i-1]+@proficiencyBonus;
       @spellAttackBonus    = @pcClass.spellAttackBonus + @abilityScoreModifiers[@pcClass.spellcastAbility.to_i-1]+@proficiencyBonus;
    end 
  
    @savingsParams = params[:player_character][:saving_throws_attributes];
      
    @proficientSavings = [];
    n2 = 0;
    @index = [];
    for x1 in ["0","1","2","3","4","5"] do
      if @savingsParams[x1]['proficient']== "1"
        #@index[x.to_i] = @skillsParams[x]['proficient']; 
        @index[n2] = x1.to_i;
        @savingThroughs[x1.to_i] = @savingThroughs[x1.to_i] + @proficiencyBonus;
        n2 = n2+1;
      end
    end 

  
 
    @skillsParams = params[:player_character][:skills_attributes];
    @proficiencyBonus = 2;  

      
    n = 0;
    @index = [];
    
    for x in ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"] do
      if @skillsParams[x]['proficient']== "1"
        #@index[x.to_i] = @skillsParams[x]['proficient']; 
        @index[n] = x.to_i;
        @skills_points[x.to_i] = (@skills_points[x.to_i]).to_ + @proficiencyBonus;
        n = n+1;
      end
    end
     
     
  
     render :new


    else

     @checkName  = "Sohrab";
      
      @proficiencyBonus = 2;

    #byebug
      @playerCharacter = params[:player_character];
      @newAbilityScore = params[:player_character][:ability_scores_attributes];
      
      # reading ability scores
      @abilityScoreVaules = [];
      for n in (0..5) do
        @abilityScoreVaules[n] =  @newAbilityScore[(n).to_s]['score'] ;
      end
      

      # reading ability scores modifiers
      @abilityScoreModifiers = [];
      @am = [];
      for m in (0..5) do
        @abilityScoreModifiers[m] =  (@abilityScoreVaules[m].to_i-10)/2 ;
        @am[m] = (@abilityScoreVaules[m].to_i-10)/2 ;
      end
     @savingThroughs = @abilityScoreModifiers;
     # setting new skill points 
     @skills_points = [@am[1],@am[4],@am[3],@am[0],@am[5],@am[3],@am[4],@am[5],@am[3],@am[4],@am[3],@am[4],@am[5],@am[5],@am[3],@am[1],@am[1],@am[4]]; 

     
     # set attributes according to calss selection
     
     @pcClass         = PlayerCharacterClass.find(@@cl_id);
     @st_table        = SavingThroughsTableForClass.all;
     @skill_table     = SkillsTableForClass.all;
         
     @savingThrougs = @pcClass.savingThroughs; 
     @skills        = @pcClass.proficientSkills;
     @equipment     = @pcClass.equipment;
     
    @selectedClass   = @pcClass.name;
    @skillsParams = params[:player_character][:skills_attributes];
      
    @proficientSkills = [];
    n = 0;
    @index = [];
    for x in ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"] do
      if @skillsParams[x]['proficient']== "1"
        #@index[x.to_i] = @skillsParams[x]['proficient']; 
        @index[n] = x.to_i;
        @skills_points[x.to_i] = @skills_points[x.to_i] + @proficiencyBonus;
        n = n+1;
      end
    end
    
   
    @savingsParams = params[:player_character][:saving_throws_attributes];
      
    @proficientSavings = [];
    n2 = 0;
    @index = [];
    for x1 in ["0","1","2","3","4","5"] do
      if @savingsParams[x1]['proficient']== "1"
        #@index[x.to_i] = @skillsParams[x]['proficient']; 
        @index[n2] = x1.to_i;
        @savingThroughs[x1.to_i] = @savingThroughs[x1.to_i] + @proficiencyBonus;
        n2 = n2+1;
      end
    end 
    
   if @pcClass.spellcastAbility.nil? 
       @spellCastingAbility = "N/A";
       @spellSaveDC         = "N/A";
       @spellAttackBonus    = "N/A";
   else
       @spellCastingAbility = @st_table.find(@pcClass.spellcastAbility).name;
       @spellSaveDC         = @pcClass.spellSaveDC + @abilityScoreModifiers[@pcClass.spellcastAbility.to_i-1]+@proficiencyBonus;
       @spellAttackBonus    = @pcClass.spellAttackBonus + @abilityScoreModifiers[@pcClass.spellcastAbility.to_i-1]+@proficiencyBonus;
   end  
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
      params.require(:player_character).permit(:add_attack_weapon, :add_armor_and_shield, :remove_armor_and_shield, :removed_attack_weapons, :isUsed, :name, :classDnD, :level, :background, :race, :alignment, :experiencePoints, :inspiration, :proficiencyBonus, :armorClass, :initiative, :speed, :currentHitPoints, :maxHitPoints, :temporaryHitPoints, :totalHitDice, :hitDice, :deathSaveSuccesses, :deathSaveFailures, :personalityTraits, :ideals, :bonds, :flaws, :attacksDescription, :passiveWisdom, :otherProficienciesAndLanguages, :maxEquipmentCarryCapacity, :currentEquipmentCarryCapacity, :featuresAndTraits, :age, :height, :weight, :eyes, :skin, :hair, :characterAppearance, :characterBackstory, :additionalFeaturesAndTraits, :treasure, :spellCastingAbility, :spellSaveDC, :spellAttackBonus, ability_scores_attributes: [:id, :name, :score, :modifier ], skills_attributes: [:id, :name, :proficient, :modifier, :ability], saving_throws_attributes: [:id, :name, :proficient, :modifier], wealth_attributes: [:id, :copper, :silver, :electrum, :gold, :platinum], attack_weapons_attributes: [:name, :attackBonus, :damage, :typeDnD, :cost, :unit, :id, :_destroy], armor_and_shields_attributes: [:name, :disadvantage, :cost, :unit, :id, :_destroy], allies_and_organizations_attributes: [:id, :name, :symbolDnD, :description])
    end
    # def ability_score_params
    #   params.require(:ability_score).permit(:name, :score, :modifier)
    # end
  end
