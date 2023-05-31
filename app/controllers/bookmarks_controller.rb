class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:new, :create, :destroy]
  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)
    if !@bookmark.save
      flash[:notice] = @bookmark
    end

    redirect_to items_path(current_user)
  end

  def destroy
    @bookmark = current_user.bookmark.find(params[:id])
    @item = @bookmark.item
    @bookmark.destroy
    redirect_to items_path
  end

  private

  def set_bookmark
    @user = current_user
  end

  def bookmark_params
    params.require(:bookmark).permit(:item_id)
  end
end
