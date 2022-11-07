class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        campers = Camper.all
        render json: campers, status: 200
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperWithActivitiesSerializer
    end

    def create
        camper = Camper.create(camper_params)
        if camper.valid?
            render json: camper, status: 201
        else
            render json: { errors: camper.errors.full_messages } , status: :unprocessable_entity
        end
    end
    private

    def camper_params
        params.permit(:name, :age)
    end

    def render_not_found
        render json: { error: "Camper not found" }, status: 404
    end

end
