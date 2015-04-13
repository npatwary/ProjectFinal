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
    all_armors_and_shield_bought_successfully = true

    if player_has_sufficient_wealth?(refStringList,wealth)

      refStringList.each do |refString|
        armor_and_shieldObject = ArmorAndShield.getArmorAndShield(refString)

        if armor_and_shieldObject.unit == "pp" and wealth.platinum >= armor_and_shieldObject.cost
             wealth.platinum = wealth.platinum - armor_and_shieldObject.cost
            # has_player_sufficient_wealth = true
        elsif  armor_and_shieldObject.unit == "gp" and wealth.gold >= armor_and_shieldObject.cost
            wealth.gold = wealth.gold - armor_and_shieldObject.cost
            #has_player_sufficient_wealth = true
        elsif  armor_and_shieldObject.unit == "ep" and wealth.electrum >= armor_and_shieldObject.cost
          wealth.electrum = wealth.electrum - armor_and_shieldObject.cost
         # has_player_sufficient_wealth = true
        elsif  armor_and_shieldObject.unit == "sp" and wealth.silver >= armor_and_shieldObject.cost
          wealth.silver = wealth.silver - armor_and_shieldObject.cost
          #has_player_sufficient_wealth = true
        elsif  armor_and_shieldObject.unit == "cp" and wealth.copper >= armor_and_shieldObject.cost
          wealth.copper = wealth.copper - armor_and_shieldObject.cost
          #has_player_sufficient_wealth = true
        else
         player_wealth_in_copper = getWealthInCopper(wealth)
         factor = 1
         factor = armor_and_shieldObject.unit == "pp" ? 1000
                : armor_and_shieldObject.unit == "gp" ? 100
                : armor_and_shieldObject.unit == "ep" ? 50
                : armor_and_shieldObject.unit == "sp" ? 10
                : 1

          armor_and_shield_cost_in_copper  = armor_and_shieldObject.cost * factor
          if player_wealth_in_copper >= armor_and_shield_cost_in_copper
            player_wealth_in_copper = player_wealth_in_copper - armor_and_shield_cost_in_copper
            
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

          all_armors_and_shield_bought_successfully = false unless wealth.save
          armor_and_shieldObject.player_character = player_character
          all_armors_and_shield_bought_successfully = false unless armor_and_shieldObject.save
            
          unless all_armors_and_shield_bought_successfully
            flash[:alert] = "Could not buy armor_and_shields. Please try again!"
            redirect_to armor_and_shields_buy_path(player_character)
            return
          end
        end #end of each iterator

        if all_armors_and_shield_bought_successfully
          flash[:success] = "#All armors and shields successfully purchased!"
            redirect_to player_character_path(player_character)
        end
      else
        flash[:alert] = "Player does not have sufficient wealth!"
        redirect_to armor_and_shields_buy_path(player_character)
      end #end of outermost if  
  end #end of #create method
      
  #listing list of armor and shield for selling for a player character
  def sell_index
    player_character = PlayerCharacter.find_by id: params[:player_character_id]
    @player_owned_armor_and_shields = player_character.armor_and_shields 
    @player_character_id = params[:player_character_id]
  end

  #delete the selected armor and shield objects
  def destroy
    refStringList = params[:ref_ids]# #get list of refStings for the selected weapons in the index view
    wealth = Wealth.find_by playercharacter_id: params[:player_character_id]
    player_character = PlayerCharacter.find_by id: params[:player_character_id]
    all_armors_and_shield_sold_successfully = true

    refStringList.each do |id|
      armor_and_shieldObject = ArmorAndShield.find(id)
      if armor_and_shieldObject.unit == "pp"
        wealth.platinum += armor_and_shieldObject.cost
      elsif armor_and_shieldObject.unit == "gp"
        wealth.gold += armor_and_shieldObject.cost
      elsif armor_and_shieldObject.unit == "ep"
        wealth.electrum += armor_and_shieldObject.cost
       elsif armor_and_shieldObject.unit == "sp"
        wealth.silver += armor_and_shieldObject.cost
       else 
        wealth.copper += armor_and_shieldObject.cost 
      end
      armor_and_shieldObject.player_character = player_character
      all_armors_and_shield_sold_successfully = false unless armor_and_shieldObject.destroy
    end #end of each iterator
    all_armors_and_shield_sold_successfully = false unless wealth.save

    if all_armors_and_shield_sold_successfully
      flash[:success] = "Selected armors and shields successfully sold!"
        redirect_to player_character_path(player_character)
    else
        flash[:alert] = "Sell is not successful .. please try again!"
        redirect_to armor_and_shields_sell_path(player_character)
      end
  end

  private
  def player_has_sufficient_wealth?(refStringList,wealth)  
    player_wealth_in_copper = getWealthInCopper(wealth)
    total_armor_and_shield_cost = 0
    refStringList.each do |refString|
      armor_and_shieldObject = ArmorAndShield.getArmorAndShield(refString)
       factor = 1
       factor = armor_and_shieldObject.unit == "pp" ? 1000
              : armor_and_shieldObject.unit == "gp" ? 100
              : armor_and_shieldObject.unit == "ep" ? 50
              : armor_and_shieldObject.unit == "sp" ? 10
              : 1

        armor_and_shield_cost_in_copper  = armor_and_shieldObject.cost * factor
        total_armor_and_shield_cost += armor_and_shield_cost_in_copper
    end
    return player_wealth_in_copper >= total_armor_and_shield_cost
  end

end #end of class
