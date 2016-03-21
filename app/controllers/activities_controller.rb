class ActivitiesController < ApplicationController

  before_action :set_activities

  def index
  end

  def show

    respond_to do |format|
      format.html { }
      format.js { }
    end

  end

  def destroy

    @activities.destroy

    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  private
    def set_activities
      @activities = PublicActivity::Activity.order("created_at desc").where("(owner_id = ? AND owner_type = ?) OR (recipient_id = ? AND recipient_type = ?)", current_user, "User", current_user, "User" )
    end

end
