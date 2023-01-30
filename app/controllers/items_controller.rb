# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @items = Item.story.includes(:votes).limit(30)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.kind = :story
    @item.user = current_user

    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

  def comment
    @comment = Item.children_of(params[:item_id]).new(item_params)
    @comment.kind = :comment
    @comment.user = current_user

    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path, alert: 'Comment could not be saved')
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :url, :body)
  end
end
