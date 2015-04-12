class ArmorAndShieldsController < ApplicationController
  def index
    armor_and_shieldMap = ArmorAndShield.getArmorAndShieldMap
    @armor_and_shields = armor_and_shieldMap.values
    @player_character_id = params[:player_character_id]
  end

  #buying armor and shield
  def create
    
    refStringList = params[:ref_ids]# #get list of refStings for the selected weapons in the index view
    wealth = Wealth.find_by playercharacter_id: params[:player_character_id]
    player_character = PlayerCharacter.find_by id: params[:player_character_id]
    refStringList.each do |refString|
      armor_and_shieldObject = ArmorAndShield.getArmorAndShield(refString)
      #get player id

      

      
        if wealth.gold >= armor_and_shieldObject.cost 

          wealth.gold = wealth.gold - armor_and_shieldObject.cost
          wealth.save

      end
        armor_and_shieldObject.player_character = player_character
          if armor_and_shieldObject.save
             redirect_to player_character_path(player_character)
        end
    end
        
  end
       
       end
