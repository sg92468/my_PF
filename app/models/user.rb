class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :portfolios, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_portfolios, through: :favorites, source: :portfolio
  has_many :comments, dependent: :destroy
  has_many :follow_requests, dependent: :destroy
  has_many :follow_companys, dependent: :destroy

  attachment :image

  # 全角カタカナと長音符を防ぐバリデーション
  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/.freeze

  validates :name, presence: true
  validates :kana_name, format: { with: KATAKANA_REGEXP }
  validates :email, presence: true, uniqueness: true

  # 検索時に使用する定義。名前と習得言語で検索できるようにしている
  def self.search(search)
    if search != ""
      User.where(['name LIKE(?) OR available_language LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      User.all
    end
  end
end
