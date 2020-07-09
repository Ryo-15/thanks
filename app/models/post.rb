class Post < ApplicationRecord
  belongs_to :sender,      class_name: 'User'
  belongs_to :receiver,    class_name: 'User'
  has_many :post_comments, dependent: :destroy
  has_many :favorites,     dependent: :destroy
  validates :post,         presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
