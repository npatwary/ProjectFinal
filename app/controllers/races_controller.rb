class RacesController < ApplicationController
	before_action :logged_in_user, only: [:show]
	#respond_to :html, :js

	def show
		@race = Race.find(params[:id])

		respond_to do |format|
			format.json { render json: @race }
		end
	end

end
