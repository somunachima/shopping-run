class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:new, :create, :destroy]
  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)
    # @bookmark = Bookmark.new(bookmark_params)
    # @bookmark.item = @item
    if !@bookmark.save
      flash[:notice] = @bookmark
    end

    redirect_to items_path(current_user)
  end

  # def create
  #   @teacher = Teacher.find(params[:teacher_id])
  #   @review = Review.new(review_params)
  #   @review.teacher = @teacher
  #   if @review.save
  #     redirect_to teacher_path(@teacher)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

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
