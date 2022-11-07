class SignupsController < ApplicationController

    def create
        signup = Signup.create(signup_params)
        if signup.valid?
            render json: signup.activity, status: 201
        else
            render json: { errors: signup.errors.full_messages } , status: 422
        end
    end

    private

    def signup_params
        params.permit(:time, :activity_id, :camper_id)
    end
end
