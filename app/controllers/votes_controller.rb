# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :authenticate_user!

  def upvote
    @vote = Vote.new(item_id: params[:item_id], user_id: current_user.id, value: 1)
    if @vote.save
      redirect_back(fallback_location: root_path) #, notice: 'Upvoted!')
    else
      redirect_back(fallback_location: root_path, alert: @vote.errors.full_messages.to_sentence)
    end
  end

  def downvote
    @vote = Vote.new(item_id: params[:item_id], user_id: current_user.id, value: -1)
    if @vote.save
      redirect_back(fallback_location: root_path) #, notice: 'Downvoted!')
    else
      redirect_back(fallback_location: root_path, alert: @vote.errors.full_messages.to_sentence)
    end
  end

  def destroy
    @vote = Vote.find_by(item_id: params[:item_id], user_id: current_user.id)
    if @vote.destroy
      redirect_back(fallback_location: root_path) #, notice: 'Unvoted!')
    else
      redirect_back(fallback_location: root_path, alert: @vote.errors.full_messages.to_sentence)
    end
  end
end
