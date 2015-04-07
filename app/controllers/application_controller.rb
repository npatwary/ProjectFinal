class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
 
  def sanitize_filename(file_name)
	  # get only the filename, not the whole path (from IE)
	  just_filename = File.basename(file_name) 
	  # replace all none alphanumeric, underscore or perioids
	  # with underscore
	  just_filename.sub(/[^\w\.\-]/,'_') 
	  return just_filename
   	end

  	def upload (sanitized_filename,uploaded_io)
	  File.open(Rails.root.join('public/images', 'uploads', sanitized_filename), 'wb') do |file|
	    file.write(uploaded_io.read)
  		end
  	end
  	
end
