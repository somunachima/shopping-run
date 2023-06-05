class Item < ApplicationRecord
  acts_as_list

  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :category, presence: { message: 'Please enter item name' }
  validates :name, presence: { message: 'Please enter item name' }
  validates :name, uniqueness: { scope: :user_id, case_sensitive: false, message: 'Item already added' }
end
