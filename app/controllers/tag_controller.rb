class TagController < ApplicationController
  before_action :set_tag, only: %i[ show ]
  def show
    @pagy, @posts = pagy(@tag.posts)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
  end
end
