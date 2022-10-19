class ActivitiesController < ApplicationController

   def index
      activities = Activity.all
      render json: activities, status: :ok
   end

   def destroy
      activity = find_activity
      activity.destroy
      head :no_content
   end

   private

   def find_activity
      Activity.find(params[:id])
   end
   
end
