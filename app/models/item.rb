class Item < ApplicationRecord
  # has_rich_text :body
  acts_as_list

  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: { message: 'Please enter item name' }
  validates :name, uniqueness: { scope: :user_id, case_sensitive: false, message: 'Item already added' }


  # include PgSearch::Model
  # pg_search_scope :search_by_name,
  #   against: [ :name ],
  #   using: {
  #     tsearch: { prefix: true, any_word: true, dictionary: "english" }
  #   }

end
