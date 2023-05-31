class Item < ApplicationRecord
  # has_rich_text :body
  acts_as_list

  belongs_to :user
  has_many :bookmarks

  validates :name, presence: { message: 'Must enter item name' }
  validates :name, uniqueness: { case_sensitive: false, message: 'Item already exists' }

  # include PgSearch::Model
  # pg_search_scope :search_by_name,
  #   against: [ :name ],
  #   using: {
  #     tsearch: { prefix: true, any_word: true, dictionary: "english" }
  #   }

end
