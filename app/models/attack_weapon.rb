# == Schema Information
#
# Table name: attack_weapons
#
#  id                 :integer          not null, primary key
#  playercharacter_id :integer
#  name               :string
#  attackBonus        :integer
#  damage             :string
#  typeDnD            :string
#  cost               :integer
#  unit               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#





class AttackWeapon < ActiveRecord::Base

  belongs_to :player_character,
				class_name: "PlayerCharacter",
				foreign_key: "playercharacter_id"
attr_accessor   :ref_string

def self.getAttackWeaponMap
		
		 attackWeaponMap = {}
		
		
		attackWeaponMap["ref1"] = AttackWeapon.new(name:"Club", typeDnD:"Simple Melee Weapon", cost:1,  unit:"sp",damage:"1d4 bludgeoning", ref_string:"ref1")
		attackWeaponMap["ref2"] = AttackWeapon.new(name:"Dagger", typeDnD:"Simple Melee Weapon", cost:2,  unit:"gp",damage:"1d4 piercing",ref_string:"ref2")
		attackWeaponMap["ref3"] = AttackWeapon.new(name:"GreatClub", typeDnD:"Simple Melee Weapon", cost:2, unit:"sp", damage:"1d8 bludgeoning",ref_string:"ref3")
		attackWeaponMap["ref4"] = AttackWeapon.new(name:"Handaxe", typeDnD:"Simple Melee Weapon", cost:5, unit:"gp", damage:"1d6 slashing",ref_string:"ref4")
		attackWeaponMap["ref5"] = AttackWeapon.new(name:"Javelin", typeDnD:"Simple Melee Weapon", cost:5,  unit:"sp", damage:"1d6 piercing",ref_string:"ref5")
		attackWeaponMap["ref6"] = AttackWeapon.new(name:"Light hammer", typeDnD:"Simple Melee Weapon", cost:2,  unit:"gp", damage:"1d4 bludgeoning",ref_string:"ref6")
		attackWeaponMap["ref7"] = AttackWeapon.new(name:"Mace", typeDnD:"Simple Melee Weapon", cost:5,  unit:"gp", damage:"1d6 bludgeoning",ref_string:"ref7")
		attackWeaponMap["ref8"] = AttackWeapon.new(name:"QuarterStuff", typeDnD:"Simple Melee Weapon", cost:2,  unit:"sp", damage:"1d4 slashing",ref_string:"ref8")
		attackWeaponMap["ref9"] = AttackWeapon.new(name:"Sickle",typeDnD:"Simple Melee Weapon", cost:1,  unit:"gp", damage:"1d4+bludgeoning",ref_string:"ref9")
		attackWeaponMap["ref10"] = AttackWeapon.new(name:"Spear",typeDnD:"Simple Melee Weapon", cost:1,  unit:"gp", damage:"1d6 piercing",ref_string:"ref10")
		attackWeaponMap["ref11"] = AttackWeapon.new(name:"Light Crossbow",typeDnD:"Simple Ranged Weapon", cost:25,  unit:"gp", damage:"1d8 piercing",ref_string:"ref11")
		attackWeaponMap["ref12"] = AttackWeapon.new(name:"Dart",typeDnD:"Simple Ranged Weapon", cost:5,  unit:"cp", damage:"1d4 piercing",ref_string:"ref12")
		attackWeaponMap["ref13"] = AttackWeapon.new(name:"Shortbow",typeDnD:"Simple Ranged Weapon", cost:25,  unit:"gp", damage:"1d6 piercing",ref_string:"ref13")
		attackWeaponMap["ref14"] = AttackWeapon.new(name:"Sling",typeDnD:"Simple Ranged Weapon", cost:1,  unit:"sp", damage:"1d4 bludgeoning",ref_string:"ref14")
		attackWeaponMap["ref15"] = AttackWeapon.new(name:"Battleeaxe",typeDnD:"Martial Melee Weapon", cost:10,  unit:"gp", damage:"1d8 slashing",ref_string:"ref15")
		attackWeaponMap["ref16"] = AttackWeapon.new(name:"Flail", typeDnD:"Martial Melee Weapon",cost:10,  unit:"gp", damage:"1d8 bludgeoning",ref_string:"ref16")
		attackWeaponMap["ref17"] = AttackWeapon.new(name:"Glaive",typeDnD:"Martial Melee Weapon", cost:20,  unit:"gp", damage:"1d10 slashing",ref_string:"ref17")
		attackWeaponMap["ref18"] = AttackWeapon.new(name:"Greataxe", typeDnD:"Martial Melee Weapon",cost:30,  unit:"gp", damage:"1d12 slashing",ref_string:"ref18")
		attackWeaponMap["ref19"] = AttackWeapon.new(name:"Greatsword", typeDnD:"Martial Melee Weapon",cost:50,  unit:"gp", damage:"2d6 slashing",ref_string:"ref19")
		attackWeaponMap["ref20"] = AttackWeapon.new(name:"Halberd",typeDnD:"Martial Melee Weapon", cost:20,  unit:"gp", damage:"1d10 slashing",ref_string:"ref20")
		attackWeaponMap["ref21"] = AttackWeapon.new(name:"Lance", typeDnD:"Martial Melee Weapon",cost:10,  unit:"gp", damage:"1d12 piercing",ref_string:"ref21")
		attackWeaponMap["ref22"] = AttackWeapon.new(name:"Longsword", typeDnD:"Martial Melee Weapon", cost:15,  unit:"gp", damage:"1d8 slashing",ref_string:"ref22")
		attackWeaponMap["ref23"] = AttackWeapon.new(name:"Maul", typeDnD:"Martial Melee Weapon", cost:10,  unit:"gp", damage:"2d6 bludgeoning",ref_string:"ref23")
		attackWeaponMap["ref24"] = AttackWeapon.new(name:"Morningstar", typeDnD:"Martial Melee Weapon", cost:15,  unit:"gp", damage:"1d4 bludgeoning",ref_string:"ref24")
		attackWeaponMap["ref25"] = AttackWeapon.new(name:"Pike", typeDnD:"Martial Melee Weapon", cost:5,  unit:"gp", damage:"1d10 piercing",ref_string:"ref25")
		attackWeaponMap["ref26"] = AttackWeapon.new(name:"Rapier",typeDnD:"Martial Melee Weapon", cost:25,  unit:"gp", damage:"1d8 piercing",ref_string:"ref26")
		attackWeaponMap["ref27"] = AttackWeapon.new(name:"Scimitar",typeDnD:"Martial Melee Weapon", cost:25, unit:"gp", damage:"1d6 slashing",ref_string:"ref27")
		attackWeaponMap["ref28"] = AttackWeapon.new(name:"Shortsword",typeDnD:"Martial Melee Weapon", cost:10,  unit:"gp", damage:"1d6 piercing",ref_string:"ref28")
		attackWeaponMap["ref29"] = AttackWeapon.new(name:"Trident",typeDnD:"Martial Melee Weapon", cost:5,  unit:"gp", damage:"1d6 piercing",ref_string:"ref29")
		attackWeaponMap["ref30"] = AttackWeapon.new(name:"War pick",typeDnD:"Martial Melee Weapon", cost:5,  unit:"gp", damage:"1d8 piercing",ref_string:"ref30")
		attackWeaponMap["ref31"] = AttackWeapon.new(name:"Warhammer",typeDnD:"Martial Melee Weapon", cost:15,  unit:"gp", damage:"1d8 bludgeoning",ref_string:"ref31")
		attackWeaponMap["ref32"] = AttackWeapon.new(name:"Whip",typeDnD:"Martial Melee Weapon", cost:2,  unit:"gp", damage:"1d4 slashing",ref_string:"ref32")
		attackWeaponMap["ref33"] = AttackWeapon.new(name:"Blowgun", typeDnD:"Martial Ranged Weapon",cost:10,  unit:"gp", damage:"1 piercing",ref_string:"ref33")
		attackWeaponMap["ref34"] = AttackWeapon.new(name:"Hand crossbow", typeDnD:"Martial Ranged Weapon", cost:75,  unit:"gp", damage:"1d6 piercing",ref_string:"ref34")
		attackWeaponMap["ref35"] = AttackWeapon.new(name:"Heavy crossbow", typeDnD:"Martial Ranged Weapon", cost:50,  unit:"gp", damage:"1d10 piercing",ref_string:"ref35")
		attackWeaponMap["ref36"] = AttackWeapon.new(name:"Longbow", typeDnD:"Martial Ranged Weapon", cost:50,  unit:"gp", damage:"1d8 piercing",ref_string:"ref36")
		attackWeaponMap["ref37"] = AttackWeapon.new(name:"Net", typeDnD:"Martial Ranged Weapon", cost:1,  unit:"gp", damage:"not mentioned",ref_string:"ref37")

			return attackWeaponMap

	end

	
	def self.getAttackWeapon(ref_string)
		return self.getAttackWeaponMap[ref_string]
	end

end


