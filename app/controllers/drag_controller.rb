class DragController < ApplicationController

  def item
    @item = Item.find(drag_item_params[:id])
    @item.insert_at(drag_item_params[:position].to_i + 1)
  end

  private

  def drag_item_params
    params.require(:resource).permit(:id, :position)
  end
end
