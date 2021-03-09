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
	has_many :user_rooms
	has_many :chats

  attachment :profile_image, destroy: false

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
  
  # JpPrefectureGemについての記述
  # 都道府県コード、都道府県名が参照できるようになる
  include JpPrefecture
  
  jp_prefecture :prefecture_code
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  
  # ここまで

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
