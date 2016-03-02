class ExperiencesController < ApplicationController

  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @experience = Experience.new(experience_params)
  end

  def create
    @experience = Experience.new(experience_params)
    if @experience.save
      redirect_to user_path
    else
    end
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])
    @experience.update_attributes(experience_params)
    redirect_to user_path
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    render :new
  end

private

def experience_params
  params.require(:experience).permit(:job, :education, :knowledge)
end


end
