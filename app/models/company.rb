class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :follow_requests, dependent: :destroy
  has_many :follow_companies, dependent: :destroy

  # 半角数字でマッチさせるバリデーション
  NUMBER_REGEXP = /\A[0-9]+\z/

  validates :name, presence: true
  validates :website, presence: true
  validates :phone_number, presence: true, format: { with: NUMBER_REGEXP }
end
