# frozen_string_literal: true

class SubmissionsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @submissions = Submission.all.limit(30)
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.user = current_user

    if @submission.save
      redirect_to @submission
    else
      render :new
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:title, :url, :body)
  end
end
