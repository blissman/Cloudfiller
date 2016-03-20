class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order("created_at desc").where("(owner_id = ? AND owner_type = ?) OR (recipient_id = ? AND recipient_type = ?)", current_user, "User", current_user, "User" )
  end
end
