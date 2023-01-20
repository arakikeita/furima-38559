class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  #has_many :buys

  validates :nickname, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :surname
    validates :name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ一ー]+\z/, message: '全角カナを使用してください' } do
    validates :surnamek
    validates :namek
  end

  validates :birthday, presence: true




end
