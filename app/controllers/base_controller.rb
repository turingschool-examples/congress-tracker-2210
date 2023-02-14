class BaseController < ApplicationController 
    def validate_user
        if session[:user_id].nil?
          flash[:error] = "You must be a registered user to access this page"
          redirect_to root_path
        end 
      end 
end 