class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  attachment :image

  enum genre: {game: 0, sns: 1,  shopping: 2, matching: 3, entertainment: 4, educate: 5, location: 6, photo: 7, ec: 8, news: 9, etc: 10}

  validates :name, presence: true
  validates :github_url, presence: true
  validates :use_language, presence: true
  validates :genre, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search != ""
      Portfolio.where(['name LIKE(?) OR genre LIKE(?) OR use_language LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Portfolio.includes(:user).order('created_at DESC')
    end
  end

end
