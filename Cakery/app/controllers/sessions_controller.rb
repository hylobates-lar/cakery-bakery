class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  def reset_session
    session[:cookie_counter] = 3
    
    # redirect_to movies_path
    redirect_back fallback_location: bakeries_path
  end 


  def new 
    # render new
  end 

  def create 
    bakery = Bakery.find_by(email: params[:session][:email])
    
    if bakery && Bakery.find_by(password: params[:session][:password])
      session[:bakery_id] = bakery.id 
      redirect_to bakeries_path
    else 
      flash[:errors] = ["email and/or password did not match"]
      redirect_to login_path
    end 
  end 


  def destroy
    session[:bakery_id] = nil
    # session.delete(:user_id)
    redirect_to bakeries_path
  end
  
end 
