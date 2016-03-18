class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.total_ratings = 0
    if @rating.save
      redirect_to user_path
    else
      render :new
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update_attributes(experience_params)
    redirect_to user_path
  end

  private

  def rating_params
    params.require(:rating).permit(:user_id, :rating, :total_ratings)
  end
end
