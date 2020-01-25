class ApplicationController < ActionController::Base
    before_action :current_bakery
    before_action :authorize


    private 
  
    def current_bakery
        @logged_in_bakery = Bakery.find_by(id: session[:bakery_id]) 
    end 

    def authorize
        if @logged_in_bakery 
        #do the normal thing
        else
        flash[:errors] = ["you need to be logged in to preform that action"] 

        redirect_to login_path
        end 
    end 
end
