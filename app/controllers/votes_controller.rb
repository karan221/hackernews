# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = Vote.new(vote_params)
    @vote.user = current_user

    if @vote.save
      redirect_to @vote.voteable
    else
      redirect_to @vote.voteable, alert: 'You have already voted'
    end
  end

  def upvote
  end

  def downvote
  end

  private

  def vote_params
    params.permit(:score, :type, :id)
  end
end
