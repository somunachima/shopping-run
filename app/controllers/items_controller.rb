class ItemsController < ApplicationController
  before_action :set_items, only: [:new, :create, :index, :show, :update, :destroy_all]
  before_action :authenticate_user!

  def new
    # @user = current_user
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    respond_to do |format|
      if @item.save
        # redirect_to items_path(current_user), notice: "Your item has been added!"
        format.html { redirect_to items_path(current_user), notice: "Your item has been added!" }
        format.json { render :show, status: :created, location: @item }
      else
        # render template: "items/index", status: :unprocessable_entity
        format.html { render "items/index", status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @items = Item.all.includes([:rich_text_body]).order(position: :asc)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.where(current_user.booking.id)
  end

  def update
    @item = Item.find(params[:id])
    @item.user = current_user

    respond_to do |format|
      if @item.update(item_params)
        # redirect_to items_path(current_user), notice: "Your item has been added!"
        format.html { redirect_to items_path(current_user), notice: "Your item has been updated!" }
        format.json { render :show, status: :created, location: @item }
      else
        # render template: "items/index", status: :unprocessable_entity
        format.html { render "items/index", status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    # redirect_to items_path(current_user), status: :see_other, notice: "Your item has been deleted!"
    respond_to do |format|
      format.html { redirect_to items_path(current_user), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
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
