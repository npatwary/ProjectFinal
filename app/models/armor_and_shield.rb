# == Schema Information
#
# Table name: armor_and_shields
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  disadvantage       :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ArmorAndShield < ActiveRecord::Base

  belongs_to :player_character,
				class_name: "PlayerCharacter",
				foreign_key: "playercharacter_id"

				attr_accessor :cost, :armor_type, :armor_class, :unit, :ref_string

	def self.getArmorAndShieldMap
		 armorAndShieldMap = {}
		#armorAndShieldMap["ref1"] = ArmorAndShield.new(name:"ARMOR NAME", disadvantage:"DISADVANTAGE", cost:"10",unit:"gp", armor_class:"ARMOR CLASS", armor_type: "AROMOR TYPE", ref_string:"ref1" )
		armorAndShieldMap["ref1"] = ArmorAndShield.new(name:"Padded", disadvantage:"yes", cost:"5",unit:"gp",  armor_class:"11+Dex modifier",armor_type: "Light", ref_string:"ref1")
		armorAndShieldMap["ref2"] = ArmorAndShield.new(name:"Leather", disadvantage:"no", cost:"10",unit:"gp",  armor_class:"11+Dex modifier",armor_type: "Light", ref_string:"ref2")
		armorAndShieldMap["ref3"] = ArmorAndShield.new(name:"Studded Leather", disadvantage:"no", cost:"45",unit:"gp",  armor_class:"12+Dex modifier",armor_type: "Light", ref_string:"ref3")
		armorAndShieldMap["ref4"] = ArmorAndShield.new(name:"Hide", disadvantage:"no", cost:"10",unit:"gp",  armor_class:"12+Dex modifier",armor_type: "Medium", ref_string:"ref4")
		armorAndShieldMap["ref5"] = ArmorAndShield.new(name:"Chain Shirt", disadvantage:"no", cost:"50",unit:"gp",  armor_class:"13+Dex modifier",armor_type: "Medium", ref_string:"ref5")
		return armorAndShieldMap
	end

	def self.getArmorAndShield(ref_string)
		return self.getArmorAndShieldMap[ref_string]
	end
end
