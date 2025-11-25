class MainController < ApplicationController
  # layout "custom"
  def welcome
    redirect_to products_path
  end
end