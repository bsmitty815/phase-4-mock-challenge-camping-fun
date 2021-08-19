class SignupsController < ApplicationController


    # POST
    def create
       
        signup = Signup.new(render_signup)
        
        if signup.save
            render json: signup.activity, status: 201
        else
            render json: { errors: ["error"] }, status: :unprocessable_entity
        end


    end
    
    private

    def render_signup
        params.permit(:activity_id, :camper_id, :time)
    end


end
