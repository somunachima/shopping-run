class ItemsController < ApplicationController
  before_action :set_item, only: [:create, :index, :show, :edit, :update, :destroy, :destroy_all]
  before_action :authenticate_user!

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path(current_user), notice: "Your item has been added!" }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render "items/index", status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @item = Item.new
    if params[:query].present?
      @items = Item.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @items = Item.all
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_path(current_user), notice: "Your item has been deleted!" }
      format.json { head :no_content }
    end
  end

  def destroy_all
    @items = Item.all
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
    params.require(:item).permit(:name, :user_id)
  end
end
