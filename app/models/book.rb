class Book < ApplicationRecord
  belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def Book.search(search, search_category, search_type)
		if search_category == "2"
			if search_type == "1"
				Book.where(["title LIKE ?", "#{search}"])
			elsif search_type == "2"
		    Book.where(["title LIKE ?", "#{search}%"])
			elsif search_type == "3"
				Book.where(["title LIKE ?", "%#{search}"])
			elsif search_type == "4"
		    Book.where(["title LIKE ?", "%#{search}%"])
			else
				Book.all
			end
		end
	end
end
