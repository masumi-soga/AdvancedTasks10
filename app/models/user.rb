class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	has_many :follower, class_name: "Relationship", foreign_key: "follower_id",dependent: :destroy
	has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
	has_many :following_user, through: :follower, source: :followed
	has_many :follower_user, through: :followed, source: :follower

  attachment :profile_image, destroy: false

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end

  def User.search(search, search_category, search_type)
    if search_category == "1"
      if search_type == "1"
        User.where(["name LIKE ?", "#{search}"])
      elsif search_type == "2"
        User.where(["name LIKE ?", "#{search}%"])
      elsif search_type == "3"
        User.where(["name LIKE ?", "%#{search}"])
      elsif search_type == "4"
        User.where(["name LIKE ?", "%#{search}%"])
      else
        User.all
      end
    end
  end
end
