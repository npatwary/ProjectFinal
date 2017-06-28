# == Schema Information
#
# Table name: equipment
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  description        :string
#  cost               :integer
#  unit               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#




class Equipment < ActiveRecord::Base

  belongs_to :player_character,
				class_name: "PlayerCharacter",
				foreign_key: "playercharacter_id"
attr_accessor   :ref_string


def self.getEquipmentMap
		
		equipmentMap = {}
		
		equipmentMap["ref1"] = Equipment.new(name:"Burglar's Pack", description:"Includes backpack,1000 ball bearing, 10 feet of string, a bell, 5 candles, a crowbar,a hammer, 10 pitons, a hooded lantern, 2 flasks of oil, 5 days ration, a tinderbox, a waterskin,50 feet of rope.", cost:16, unit:"gp", ref_string:"ref1")
		equipmentMap["ref2"] = Equipment.new(name:"Diplomat's Pack", description:"Includes a chest,2 cases for maps and scrolls, a set of fine clothes, a bottle of ink, an ink pen, a llamp, 2 flasks of oil, 5 sheet of paper, a vial of perfume, sealing wax and soap", cost:39, unit:"gp", ref_string:"ref2")
		equipmentMap["ref3"] = Equipment.new(name:"Dungeoneer's Pack", description:"Includes a backpack, a crowbar, a hammer, 10 pitons, 10 torches, a tinderbox, 10 days of rations, a waterskin, 50 feet of hempen rope.", cost:12, unit:"gp", ref_string:"ref3")
		equipmentMap["ref4"] = Equipment.new(name:"Entertainer's Pack", description:"Includes a backpack, a bedroll, 2 costumes,5 candles, 5 days of rations, a waterskin, a disguise kit.", cost:40, unit:"gp", ref_string:"ref4")
		equipmentMap["ref5"] = Equipment.new(name:"Explorer's Pack", description:"Includes a backpack, a bedroll,a mess kit, a tinderbox,10 torches, 10 days of ration, waterskin, 50 feet of hempen rope.", cost:10, unit:"gp", ref_string:"ref5")
		equipmentMap["ref6"] = Equipment.new(name:"Priest's Pack", description:"Includes a backpack, a blanket, 10 candles, a tinderbox, an alms box, 2 blocks on incense, a censer, vestments, 2 days of rations, waterskin.", cost:19, unit:"gp", ref_string:"ref6")
		equipmentMap["ref7"] = Equipment.new(name:"Scholar's Pack", description:"Includes a backpack, a book of lore, a bottle of ink, an ink pen, 10 sheets of parchment, a little bag of sand, a small knife.", cost:40, unit:"gp", ref_string:"ref7")
		
	
		return equipmentMap
	end




def self.getEquipment(ref_string)
		return self.getEquipmentMap[ref_string]
	end

end

