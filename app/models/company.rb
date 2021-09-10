class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :follow_requests, dependent: :destroy
  def already_requested?(user) # フォローリクエストの確認
    follow_requests.exists?(user_id: user.id)
  end
  has_many :follow_companies, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  # 半角数字でマッチさせるバリデーション
  NUMBER_REGEXP = /\A[0-9]+\z/.freeze

  validates :name, presence: true
  validates :website, presence: true
  validates :phone_number, presence: true, format: { with: NUMBER_REGEXP }

  def already_followed?(user)
    follow_companies.exists?(user_id: user.id)
  end
end
