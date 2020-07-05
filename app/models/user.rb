class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :department
  has_many :posts,         dependent: :destroy
  has_many :favorites,     dependent: :destroy
  has_many :post_comments, dependent: :destroy
end
