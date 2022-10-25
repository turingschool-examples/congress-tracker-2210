class CongressController < ApplicationController
  before_action :require_admin

    def search
      @member = CongressFacade.find_senate_member(params[:search])
      render :search_options
    end

    def search_state
      state = params[:state]
      @house_members = CongressFacade.house_members_by_state(state)
      render :search_options
    end
    
    def search_options 
    end

  end