class CampersController < ApplicationController


    # GET
    def index
        campers = Camper.all
        render json: campers, status: 200
    end


    # GET
    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, include: ["activities"], status: 200
        else
            render json: { error: "Camper not found" }, status: 404
        end
    end


    # POST
    def create
        camper = Camper.new(render_camper)

        if camper.save
            render json: camper, status: 201
        else
            render json: { errors: ["error"] }, status: :unprocessable_entity
        end
    end

    private


    def render_camper
        params.permit(:name, :age)
    end
end
