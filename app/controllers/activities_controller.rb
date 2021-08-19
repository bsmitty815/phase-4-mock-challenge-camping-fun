class ActivitiesController < ApplicationController

    # GET
    def index
        activities = Activity.all
        render json: activities, status: 200

    end


    # DELETE
    def destroy

        activity = Activity.find_by(id: params[:id])
        if activity
            activity.destroy
            render json: activity, status: 200
        else
            render json: { error: "Activity not found" }, status: 404
        end

    end


end
