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
    all_attack_weapon_bought_successfully = true

    if player_has_sufficient_wealth?(refStringList,wealth)

      refStringList.each do |refString|
        attack_weaponObject = AttackWeapon.getAttackWeapon(refString)

        if attack_weaponObject.unit == "pp" and wealth.platinum >= attack_weaponObject.cost
             wealth.platinum = wealth.platinum - attack_weaponObject.cost
            # has_player_sufficient_wealth = true
        elsif  attack_weaponObject.unit == "gp" and wealth.gold >= attack_weaponObject.cost
            wealth.gold = wealth.gold - attack_weaponObject.cost
            #has_player_sufficient_wealth = true
        elsif  attack_weaponObject.unit == "ep" and wealth.electrum >= attack_weaponObject.cost
          wealth.electrum = wealth.electrum - attack_weaponObject.cost
         # has_player_sufficient_wealth = true
        elsif  attack_weaponObject.unit == "sp" and wealth.silver >= attack_weaponObject.cost
          wealth.silver = wealth.silver - attack_weaponObject.cost
          #has_player_sufficient_wealth = true
        elsif  attack_weaponObject.unit == "cp" and wealth.copper >= attack_weaponObject.cost
          wealth.copper = wealth.copper - attack_weaponObject.cost
          #has_player_sufficient_wealth = true
        else
         player_wealth_in_copper = getWealthInCopper(wealth)
         factor = 1
         factor = attack_weaponObject.unit == "pp" ? 1000
                : attack_weaponObject.unit == "gp" ? 100
                : attack_weaponObject.unit == "ep" ? 50
                : attack_weaponObject.unit == "sp" ? 10
                : 1

          attack_weapon_cost_in_copper  = attack_weaponObject.cost * factor
          if player_wealth_in_copper >= attack_weapon_cost_in_copper
            player_wealth_in_copper = player_wealth_in_copper - attack_weapon_cost_in_copper
            
            player_wealth_in_platinum = player_wealth_in_copper/1000
            wealth.platinum = player_wealth_in_platinum.to_i
            fractional_platinum = player_wealth_in_platinum % 1

            #assign  gold
            if fractional_platinum > 0 
              gold = fractional_platinum * 10
              wealth.gold = gold.to_i
              fractional_gold = gold % 1

              if fractional_gold > 0
                electrum = fractional_gold * 2
                wealth.electrum = electrum.to_i
                fractional_electrum = electrum % 1

                if fractional_electrum > 0
                    silver = fractional_electrum * 5
                    wealth.silver = silver.to_i
                    fractional_silver = silver % 1

                    if fractional_silver > 0
                      copper = fractional_silver * 10
                      wealth.copper = copper.to_i
                    end
                end
              end
            end
          end
        end#end of wealth update

          all_attack_weapon_bought_successfully = false unless wealth.save
          attack_weaponObject.player_character = player_character
          all_attack_weapon_bought_successfully = false unless attack_weaponObject.save
            
          unless all_attack_weapon_bought_successfully
            flash[:alert] = "Could not buy attack weapons. Please try again!"
            redirect_to attack_weapons_buy_path(player_character)
            return
          end
        end #end of each iterator

        if all_attack_weapon_bought_successfully
          flash[:success] = "#All attack weapons successfully purchased!"
            redirect_to player_character_path(player_character)
        end
      else
        flash[:alert] = "Player does not have sufficient wealth!"
        redirect_to attack_weapons_buy_path(player_character)
      end #end of outermost if  
  end #end of #create method
      
      #listing list of armor and shield for selling for a player character
  def sell_index
    player_character = PlayerCharacter.find_by id: params[:player_character_id]
    @player_owned_attack_weapons = player_character.attack_weapons 
    @player_character_id = params[:player_character_id]
  end


      def destroy
    refStringList = params[:ref_ids]# #get list of refStings for the selected weapons in the index view
    wealth = Wealth.find_by playercharacter_id: params[:player_character_id]
    player_character = PlayerCharacter.find_by id: params[:player_character_id]
    all_attack_weapon_sold_successfully = true

    refStringList.each do |id|
      attack_weaponObject = AttackWeapon.find(id)
      if attack_weaponObject.unit == "pp"
        wealth.platinum += attack_weaponObject.cost
      elsif attack_weaponObject.unit == "gp"
        wealth.gold += attack_weaponObject.cost
      elsif attack_weaponObject.unit == "ep"
        wealth.electrum += attack_weaponObject.cost
       elsif attack_weaponObject.unit == "sp"
        wealth.silver += attack_weaponObject.cost
       else 
        wealth.copper += attack_weaponObject.cost 
      end
      attack_weaponObject.player_character = player_character
      all_attack_weapon_sold_successfully = false unless attack_weaponObject.destroy
    end #end of each iterator
    all_attack_weapon_sold_successfully = false unless wealth.save

    if all_attack_weapon_sold_successfully
      flash[:success] = "Selected attack weapons successfully sold!"
        redirect_to player_character_path(player_character)
    else
        flash[:alert] = "Sell is not successful . please try again!"
        redirect_to attack_weapons_sell_path(player_character)
      end
  end

  private
  def player_has_sufficient_wealth?(refStringList,wealth)  
    player_wealth_in_copper = getWealthInCopper(wealth)
    total_attack_weapon_cost = 0
    refStringList.each do |refString|
      attack_weaponObject = AttackWeapon.getAttackWeapon(refString)
       factor = 1
       factor = attack_weaponObject.unit == "pp" ? 1000
              : attack_weaponObject.unit == "gp" ? 100
              : attack_weaponObject.unit == "ep" ? 50
              : attack_weaponObject.unit == "sp" ? 10
              : 1

        attack_weapon_cost_in_copper  = attack_weaponObject.cost * factor
        total_attack_weapon_cost += attack_weapon_cost_in_copper
    end
    return player_wealth_in_copper >= total_attack_weapon_cost
  end

end #end of class
