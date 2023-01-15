# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.submission = Submission.find(params[:submission_id])
    if @comment.save
      redirect_to submission_path(@comment.submission)
    else
      render :new
    end
  end

  private

  def comment_params
    params.permit(:body)
  end
end
