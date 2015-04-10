module PlayerCharactersHelper
	@@ability_names = ['Strength', 'Dexterity', 'Constitution', 'Intelligence', 'Wisdom', 'Charisma']
  	@@skill_names = ['Acrobatics', 'Animal Handling', 'Arcana', 'Athletics', 'Deception', 'History', 'Insight', 'Intimidation', 'Investigation', 'Medicine', 'Nature', 'Perception', 'Performance', 'Religion', 'Sleight of Hand', 'Stealth', 'Survival']
  	@@skill_abilities = ['Dex', 'Wis', 'Int','Str', 'Cha', 'Int', 'Wis', 'Cha', 'Int', 'Wis', 'Int', 'Wis', 'Cha', 'Cha', 'Int', 'Dex', 'Dex', 'Wis']
	
	def setup_playercharacter(player_character)
		if player_character.ability_scores.empty?
	      @@ability_names.each do |n|
	          player_character.ability_scores.build(name: n)
	      end
	    end
	    if player_character.saving_throws.empty?
	      @@ability_names.each do |n|
	        player_character.saving_throws.build(name: n)
	      end
	    end
	    if player_character.skills.empty?
	      Hash[@@skill_names.zip(@@skill_abilities)].each do |n, a|
	    	player_character.skills.build(name: n, ability: a)
	      end
	    end
	    player_character.attack_weapons.build if @player_character.attack_weapons.empty?
	    player_character.armor_and_shields.build if @player_character.armor_and_shields.empty?    
	    player_character.build_wealth if @player_character.wealth.nil?
	    player_character.allies_and_organizations.build if @player_character.allies_and_organizations.empty?
	    player_character
	end
end
