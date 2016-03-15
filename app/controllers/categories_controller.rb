class CategoriesController < ApplicationController
skip_before_action :require_login, only: [:index]

  def index
    @user = User.new
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @requests = @category.requests.where(active: true).page(params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    @category.save
    redirect_to root_path
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
