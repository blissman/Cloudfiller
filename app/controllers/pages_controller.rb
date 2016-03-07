class PagesController < ApplicationController
skip_before_action :require_login, only: [:show]
  def show
    render params[:id]
  end
end
