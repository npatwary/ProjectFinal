class PlayerCharacterClassesController < ApplicationController


	def index

	    # byebug
		@pcClasses       = PlayerCharacterClass.all;
		@st_table        = SavingThroughsTableForClass.all;
		@skill_table     = SkillsTableForClass.all;

		@savingThrougs = @pcClasses[0].savingThroughs; 
		@skills        = @pcClasses[0].proficientSkills;
	end


    def show 
		@pcClass         = PlayerCharacterClass.find(params[:class_id]);
		@st_table        = SavingThroughsTableForClass.all;
		@skill_table     = SkillsTableForClass.all;
         
        @savingThrougs = @pcClass.savingThroughs; 
		@skills        = @pcClass.proficientSkills;
        @equipment     = @pcClass.equipment;
	end

end
