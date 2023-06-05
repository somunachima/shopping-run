class ItemsController < ApplicationController
  before_action :set_item, only: [:create, :index, :show, :edit, :update, :destroy, :destroy_all]
  before_action :authenticate_user!

  def create
    @item = current_user.items.new(item_params)
      if !@item.save
        flash[:notice] = @item
      end
    redirect_to items_path, status: :see_other, notice: "Your item has been added!"
  end

  def index
    @item = Item.new
    if params[:query].present?
      @items = current_user.items.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @items = current_user.items.all.order(position: :asc)
    end
  end

  def show
    @item = current_user.items.find(params[:id])
    @bookmark = Bookmark.find(params[:bookmark_id])
  end

  def edit
    @item = Item.where(current_user.item.id)
  end

  def update
    @item = current_user.items.find(params[:id])

    if !@item.update(item_params)
      flash[:notice] = @item
    end
    redirect_to items_path, status: :see_other, notice: "Your item has been updated!"
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    redirect_to items_path(current_user), status: :see_other, notice: "Your item has been deleted!"
  end

  def destroy_all
    @items = current_user.items.all
    @items.each do |item|
      item.destroy
    end
    redirect_to items_path(current_user), status: :see_other, notice: "All your items have been deleted!"
  end

  private

  def set_item
    @user = current_user
  end

  def item_params
    params.require(:item).permit(:name, :category, :user_id)
  end
end
