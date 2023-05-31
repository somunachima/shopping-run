class BookmarksController < ApplicationController
  before_action :set_items, only: [:new, :create]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user

    if !bookmark.save
      flash[:notice] = @bookmark
    end
  end

  def destroy

  end

  private

  def set_bookmark
    @user = current_user
  end

  def bookmark_params
    params.require(:bookmark).permit(:item_id, :user_id)
  end
end
