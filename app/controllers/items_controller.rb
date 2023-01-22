# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @items = Item.story.limit(30)
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
    @comment = Item.children_of(params[:id]).new(item_params)
    @comment.kind = :comment
    @comment.user = current_user

    if @comment.save
      redirect_to @comment.parent
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :url, :body)
  end
end
