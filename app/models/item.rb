class Item < ApplicationRecord
  belongs_to :user

  validates :name, presence: { message: 'Must enter item name' }
  validates :name, uniqueness: { case_sensitive: false, message: 'Item already exists' }

end
