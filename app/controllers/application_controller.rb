class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
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
  	
    def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
      end
    end

  def getWealthInGold(wealthObject)
    return (wealthObject.gold) + (wealthObject.platinum*10) + (wealthObject.copper/100) + (wealthObject.silver/10) + (wealthObject.electrum/2) 
  end

  def getWealthInPlatinum(wealthObject)
    return (wealthObject.platinum) + (wealthObject.gold/10) + (wealthObject.copper/1000) + (wealthObject.silver/100) + (wealthObject.electrum/20) 
  end
  

  def getWealthInCopper(wealthObject)
    return (wealthObject.gold*100) + (wealthObject.platinum*1000) + (wealthObject.copper) + (wealthObject.silver*10) + (wealthObject.electrum*50) 
  end

  def getWealthInSilver(wealthObject)
    return (wealthObject.gold*10) + (wealthObject.platinum*100) + (wealthObject.copper/10) + (wealthObject.silver) + (wealthObject.electrum/5) 
  end
  

  def getWealthInElectrum(wealthObject)
    return (wealthObject.gold*2) + (wealthObject.platinum*20) + (wealthObject.copper/50) + (wealthObject.silver/5) + (wealthObject.electrum)  
  end

end
