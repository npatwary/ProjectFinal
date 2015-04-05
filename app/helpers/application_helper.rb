module ApplicationHelper
	def dungeon_master?(user)
		user == current_user
	end

	def current_user
		#TODO: get it from user session
		@current_user = User.find(1)
	end
end
