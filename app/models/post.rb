class Post < ApplicationRecord
  belongs_to :sender,   class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :comments,   dependent: :destroy
  has_many :favorites,  dependent: :destroy
  validates :post,      presence: true
end
