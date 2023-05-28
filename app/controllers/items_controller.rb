class ItemsController < ApplicationController
  before_action :set_items, only: [:new, :create, :index, :show, :destroy_all]

  def new
    # @user = current_user
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to items_path(current_user), notice: "Your item has been added!"
    else
      render template: "items/index", status: :unprocessable_entity
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path(current_user), status: :see_other, notice: "Your item has been deleted!"
  end

  def destroy_all
    Item.delete_all
    redirect_to items_path(current_user), status: :see_other, notice: "All your items have been deleted!"
  end

  private

  def set_items
    @user = current_user
  end

  def item_params
    params.require(:item).permit(:name, :content, :user_id)
  end
end
