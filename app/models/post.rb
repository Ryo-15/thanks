class Post < ApplicationRecord
  belongs_to :sender,      class_name: 'User'
  belongs_to :receiver,    class_name: 'User'
  has_many :post_comments, dependent: :destroy
  has_many :favorites,     dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :post,         presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def create_notification_favorite_by(user)
    [sender, receiver].each do |post_user|
      notification = user.active_notifications.new(
        passive_user_id: post_user.id,
        post_id: id,
        action: "favorite"
      )
      notification.save
    end
  end

  def create_notification_comment!(active_user, post_comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    post_comments = PostComment.select(:user_id).where(post_id: id).where.not(user_id: active_user.id).distinct
    post_comments.each do |post_comment|
      save_notification_comment!(active_user, post_comment_id)
    end
  end

  def save_notification_comment!(active_user, post_comment_id)
    [sender, receiver].each do |post_user|
      notification = active_user.active_notifications.new(
        passive_user_id: post_user.id,
        post_id: id,
        post_comment_id: post_comment_id,
        action: 'post_comment'
      )
      # 自分の投稿に対するコメントの場合は、通知済みとする
      if notification.action_user_id == notification.passive_user_id
        notification.checked = true
      end
      notification.save
    end
  end

  def create_notification_post!(user)
    notification = user.active_notifications.new(
      passive_user_id: receiver_id,
      post_id: id,
      action: 'post'
    )
    notification.save
  end
end
