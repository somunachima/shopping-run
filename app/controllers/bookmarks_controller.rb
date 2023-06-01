class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:index, :new, :create, :destroy, :destroy_all]
  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)
    if !@bookmark.save
      flash[:notice] = @bookmark
    end

    redirect_to items_path
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @item = @bookmark.item
    @bookmark.destroy
    redirect_to items_path
  end

  def destroy_all
    @bookmarks = current_user.bookmarks.all
    @bookmarks.each do |bookmark|
      bookmark.destroy
    end
    redirect_to items_path(current_user), status: :see_other, notice: "All your items have been deleted!"
  end

  def index
    @bookmarks = Bookmark.all
  end

  private

  def set_bookmark
    @user = current_user
  end

  def bookmark_params
    params.require(:bookmark).permit(:item_id)
  end
end
