class PlayerCharacterClassesController < ApplicationController
before_action :logged_in_user, only: [:show]

	def index

	    # byebug
		@pcClasses       = PlayerCharacterClass.all;
		@st_table        = SavingThroughsTableForClass.all;
		@skill_table     = SkillsTableForClass.all;

		@savingThrougs = @pcClasses[0].savingThroughs; 
		@skills        = @pcClasses[0].proficientSkills;
	end


	def show
		@class = PlayerCharacterClass.find(params[:id])
		if params[:race_id]!="";
		#byebug
           @race = Race.find(params[:race_id]);
        else
       	@race = 0;
        end
		respond_to do |format|
			# format.json { render json: @class }
			format.json  { render :json => {:class => @class, 
                                  :race => @race }}
		end
	end

end
