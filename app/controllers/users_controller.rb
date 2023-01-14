# frozen string literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
end
