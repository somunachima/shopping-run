class DeleteContentToItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :content, :text
  end
end
