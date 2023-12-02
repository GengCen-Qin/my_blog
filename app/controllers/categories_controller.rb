class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show ]

  def index
    @categories = Category.all
  end

  def show
    @pagy, @posts = pagy(@category.posts)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end
end
