# == Schema Information
#
# Table name: armor_and_shields
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  disadvantage       :string
#  cost               :integer
#  unit               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#


class ArmorAndShield < ActiveRecord::Base


  belongs_to :player_character,
				class_name: "PlayerCharacter",
				foreign_key: "playercharacter_id"

				attr_accessor  :armor_type, :armor_class, :ref_string

	def self.getArmorAndShieldMap
		armorAndShieldMap = {}
		#unit may be: cp, pp, ep, gp, sp
		armorAndShieldMap["ref1"] = ArmorAndShield.new(name:"Padded", disadvantage:"stealth", cost:5, unit:"gp", armor_class:"11+Dex modifier",armor_type: "Light", ref_string:"ref1")
		armorAndShieldMap["ref2"] = ArmorAndShield.new(name:"Leather", disadvantage:"no", cost:10, unit:"gp",armor_class:"11+Dex modifier",armor_type: "Light", ref_string:"ref2")
		armorAndShieldMap["ref3"] = ArmorAndShield.new(name:"Studded Leather", disadvantage:"no", cost:45,unit:"gp",  armor_class:"12+Dex modifier",armor_type: "Light", ref_string:"ref3")
		armorAndShieldMap["ref4"] = ArmorAndShield.new(name:"Hide", disadvantage:"no", cost:10, unit:"gp", armor_class:"12+Dex modifier",armor_type: "Medium", ref_string:"ref4")
		armorAndShieldMap["ref5"] = ArmorAndShield.new(name:"Chain Shirt", disadvantage:"no",unit:"gp", cost:50, armor_class:"13+Dex modifier",armor_type: "Medium", ref_string:"ref5")
		armorAndShieldMap["ref6"] = ArmorAndShield.new(name:"Scale mail", disadvantage:"stealth", cost:50,unit:"gp", armor_class:"14+Dex modifier",armor_type: "Medium", ref_string:"ref6")
		armorAndShieldMap["ref7"] = ArmorAndShield.new(name:"Breast plate", disadvantage:"no", cost:400,unit:"gp", armor_class:"14+Dex modifier",armor_type: "Medium", ref_string:"ref7")
		armorAndShieldMap["ref8"] = ArmorAndShield.new(name:"Half plate", disadvantage:"stealth", cost:750,unit:"gp", armor_class:"15+Dex modifier",armor_type: "Medium", ref_string:"ref8")
		armorAndShieldMap["ref9"] = ArmorAndShield.new(name:"Ring mail", disadvantage:"stealth", cost:30,unit:"gp", armor_class:"14",armor_type: "Heavy", ref_string:"ref9")
		armorAndShieldMap["ref10"] = ArmorAndShield.new(name:"Chain mail", disadvantage:"stealth", cost:75,unit:"gp",armor_class:"16",armor_type: "Heavy", ref_string:"ref10")
		armorAndShieldMap["ref11"] = ArmorAndShield.new(name:"Splint", disadvantage:"stealth", cost:200,unit:"gp", armor_class:"17",armor_type: "Heavy", ref_string:"ref11")
		armorAndShieldMap["ref12"] = ArmorAndShield.new(name:"Plate", disadvantage:"stealth", cost:1500,unit:"gp", armor_class:"18",armor_type: "Heavy", ref_string:"ref12")
		armorAndShieldMap["ref13"] = ArmorAndShield.new(name:"Shield", disadvantage:"no", cost:10,unit:"gp", armor_class:"+2",armor_type: "Shield", ref_string:"ref13")


		return armorAndShieldMap
	end

	def self.getArmorAndShield(ref_string)
		return self.getArmorAndShieldMap[ref_string]
	end

end
