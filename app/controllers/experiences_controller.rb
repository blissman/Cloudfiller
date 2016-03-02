class ExperiencesController < ApplicationController

  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @experience = Experience.new(experience_params)
    if @experience.save
      redirect_to user_path
    else


  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end



end
