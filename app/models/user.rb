class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :password,:password_confirmation,format:{with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :password, confirmation: true
  with_options presence: true do
    validates :nickname
    validates :birthday

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :first_name
    validates :last_name
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :j_family_name 
    validates :j_last_name
  end
  end
  has_many :items
  has_many :purchases
end
