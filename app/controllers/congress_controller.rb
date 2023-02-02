class CongressController < ApplicationController
    def search
      @member = CongressFacade.senate_member_by_name(params[:search]) if !params[:search].empty?
      render "welcome/index"
    end

    def search_state
      state = params[:state]

      @house_members = CongressFacade.house_representatives(state)
      render "welcome/index"
    end
  end

        # Make API call, get response (Service)
      # Service 
      # - Responsibility of Service is to make API calls 
      # - No filtering of the responses should be done in the service
      
      # filtering api response (Facade)
      # Facade
      # - Responsibility of a Facade is to get data (from an API), and pull out what you need
  