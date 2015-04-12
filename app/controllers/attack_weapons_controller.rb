class AttackWeaponsController < ApplicationController
 


  def index

  	attack_weaponMap = AttackWeapon.getAttackWeaponMap
    @attack_weapons = attack_weaponMap.values
    @player_character_id = params[:player_character_id]
  end


 
  def create
    
    refStringList = params[:ref_ids]# #get list of refStings for the selected weapons in the index view
    wealth = Wealth.find_by playercharacter_id: params[:player_character_id]
    player_character = PlayerCharacter.find_by id: params[:player_character_id]
    refStringList.each do |refString|
      attack_weaponObject = AttackWeapon.getAttackWeapon(refString)
      

      if wealth.gold >= attack_weaponObject.cost 

          wealth.gold = wealth.gold - attack_weaponObject.cost
          wealth.save

      end
        attack_weaponObject.player_character = player_character
          if attack_weaponObject.save
             redirect_to player_character_path(player_character)
        end
    end
        
  end
       
       end


