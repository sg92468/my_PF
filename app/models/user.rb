class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :portfolios, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follow_requests, dependent: :destroy
  has_many :follow_companys, dependent: :destroy
  
  attachment :image
  
  # 全角カタカナと長音符を防ぐバリデーション
  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
 # 半角数字でマッチさせるバリデーション
  NUMBER_REGEXP = /\A[0-9]+\z/
  
  validates :kana_name, format: { with: KATAKANA_REGEXP }
  validates :email, presence: true, uniqueness: true
  validates :postal_code, format: { with: NUMBER_REGEXP }
  validates :phone_number, format: { with: NUMBER_REGEXP }
  
end
