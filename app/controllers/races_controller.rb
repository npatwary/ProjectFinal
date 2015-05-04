class RacesController < ApplicationController
	before_action :logged_in_user, only: [:show]
	#respond_to :html, :js

	def show
		@race = Race.find(params[:id])
		if params[:class_id]!= "" 
          @class = PlayerCharacterClass.find(params[:class_id]);
        else
       		@class = 0
        end
		respond_to do |format|
			format.json { render :json => {:class => @class, 
                                  :race => @race }}
		end
	end

end
