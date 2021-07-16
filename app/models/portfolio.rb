class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  attachment :image


  validates :name, presence: true
  validates :github_url, presence: true
  validates :use_language, presence: true
  validates :genre_id, presence: true

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
