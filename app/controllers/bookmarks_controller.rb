class BookmarksController < ApplicationController
  def create
    @bookmark = current_user.bookmark.new(bookmark_params)

    if !bookmark.save
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
    params.require(:bookmark).permit(:item_id, :user_id)
  end
end
