class UpController < ApplicationController
  before_action :authenticate_user!, except: :show
  def show
    render plain: "OK"
  end
end
