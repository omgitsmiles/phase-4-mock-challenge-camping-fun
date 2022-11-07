class ActivitiesController < ApplicationController  
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        activities = Activity.all
        render json: activities, status: 200
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        head :no_content
    end

    private
    
    def render_not_found
        render json: { error: "Activity not found" }, status: 404
    end

end
