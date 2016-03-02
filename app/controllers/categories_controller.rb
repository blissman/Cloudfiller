class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.find(params[:id])
  end

  def new
    # not in use
  end

  def create
    # not in use
  end

  def edit
    # not in use
  end

  def update
    # not in use
  end

  def destroy
    # not in use
  end

end
