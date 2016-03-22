class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save!
      # @rating.create_activity :create, owner: current_user, recipient: User.find(@rating.user_id)
      redirect_to requests_path
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update_attributes(rating_params)
    redirect_to user_path
  end

  private

  def rating_params
    params.require(:rating).permit(:user_id, :rating, :request_id)
  end
end
