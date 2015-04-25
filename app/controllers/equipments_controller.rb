class EquipmentsController < ApplicationController
 
  def index
    equipmentMap = Equipment.getEquipmentMap
    @equipments = equipmentMap.values
    @player_character_id = params[:player_character_id]
  end


  #buying equipments
  def create
    
    refStringList = params[:ref_ids]# #get list of refStings for the selected equipments in the index view
    wealth = Wealth.find_by playercharacter_id: params[:player_character_id]
    player_character = PlayerCharacter.find_by id: params[:player_character_id]
  

    all_equipment_bought_successfully = true

    if player_has_sufficient_wealth?(refStringList,wealth)

      refStringList.each do |refString|
        equipmentObject = Equipment.getEquipment(refString)

        if equipmentObject.unit == "pp" and wealth.platinum >= equipmentObject.cost
             wealth.platinum = wealth.platinum - equipmentObject.cost
            # has_player_sufficient_wealth = true
        elsif  equipmentObject.unit == "gp" and wealth.gold >= equipmentObject.cost
            wealth.gold = wealth.gold - equipmentObject.cost
            #has_player_sufficient_wealth = true
        elsif  equipmentObject.unit == "ep" and wealth.electrum >= equipmentObject.cost
          wealth.electrum = wealth.electrum - equipmentObject.cost
         # has_player_sufficient_wealth = true
        elsif  equipmentObject.unit == "sp" and wealth.silver >= equipmentObject.cost
          wealth.silver = wealth.silver - equipmentObject.cost
          #has_player_sufficient_wealth = true
        elsif  equipmentObject.unit == "cp" and wealth.copper >= equipmentObject.cost
          wealth.copper = wealth.copper - equipmentObject.cost
          #has_player_sufficient_wealth = true
        else
         player_wealth_in_copper = getWealthInCopper(wealth)
         factor = 1
         factor = equipmentObject.unit == "pp" ? 1000
                : equipmentObject.unit == "gp" ? 100
                : equipmentObject.unit == "ep" ? 50
                : equipmentObject.unit == "sp" ? 10
                : 1

          equipment_cost_in_copper  = equipmentObject.cost * factor
          if player_wealth_in_copper >= equipment_cost_in_copper
            player_wealth_in_copper = player_wealth_in_copper - equipment_cost_in_copper
            
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
        end #end of wealth update


        

          all_equipment_bought_successfully = false unless wealth.save
          equipmentObject.player_character = player_character
          all_equipment_bought_successfully = false unless equipmentObject.save
            
          unless all_equipment_bought_successfully
            flash[:alert] = "Could not buy equipments. Please try again!"
            redirect_to equipments_buy_path(player_character)
            return
          end
        end #end of each iterator

        if all_equipment_bought_successfully
          flash[:success] = "#All equipments successfully purchased!"
            redirect_to player_character_path(player_character)
        end
      else
        flash[:alert] = "Player does not have sufficient wealth!"
        redirect_to equipments_buy_path(player_character)
      end #end of outermost if  
  end #end of #create method
      
  #listing list of armor and shield for selling for a player character
  def sell_index
    player_character = PlayerCharacter.find_by id: params[:player_character_id]
    @player_owned_equipments = player_character.equipments 
    @player_character_id = params[:player_character_id]
  end

  #delete the selected armor and shield objects
  def destroy
    refStringList = params[:ref_ids]# #get list of refStings for the selected weapons in the index view
    wealth = Wealth.find_by playercharacter_id: params[:player_character_id]
    player_character = PlayerCharacter.find_by id: params[:player_character_id]
    all_equipment_sold_successfully = true

    refStringList.each do |id|
      equipmentObject = Equipment.find(id)
      if equipmentObject.unit == "pp"
        wealth.platinum += equipmentObject.cost
      elsif equipmentObject.unit == "gp"
        wealth.gold += equipmentObject.cost
      elsif equipmentObject.unit == "ep"
        wealth.electrum += equipmentObject.cost
       elsif equipmentObject.unit == "sp"
        wealth.silver += equipmentObject.cost
       else 
        wealth.copper += equipmentObject.cost 
      end
      equipmentObject.player_character = player_character
      all_equipment_sold_successfully = false unless equipmentObject.destroy
    end #end of each iterator
    all_equipment_sold_successfully = false unless wealth.save

    if all_equipment_sold_successfully
      flash[:success] = "Selected equipments successfully sold!"
        redirect_to player_character_path(player_character)
    else
        flash[:alert] = "Sell is not successful .. please try again!"
        redirect_to equipments_sell_path(player_character)
      end
  end

  private
  def player_has_sufficient_wealth?(refStringList,wealth)  
    player_wealth_in_copper = getWealthInCopper(wealth)
    logger.info "Total wealth in copper : #{player_wealth_in_copper}"
    total_equipment_cost = 0
    refStringList.each do |refString|
      equipmentObject = Equipment.getEquipment(refString)
       factor = 1
       factor = equipmentObject.unit == "pp" ? 1000
              : equipmentObject.unit == "gp" ? 100
              : equipmentObject.unit == "ep" ? 50
              : equipmentObject.unit == "sp" ? 10
              : 1
        logger.info "Selected wealth factor : #{factor}"
        equipment_cost_in_copper  = equipmentObject.cost * factor
        total_equipment_cost += equipment_cost_in_copper
    end
    return player_wealth_in_copper >= total_equipment_cost
  end

end #end of class

  