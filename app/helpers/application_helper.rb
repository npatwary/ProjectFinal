module ApplicationHelper

	def dungeon_master?(user)
      user == current_user
    end
    
end
