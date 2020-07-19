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

  # いいね通知の作成
  def create_notification_favorite_by(user)
    [sender, receiver].each do |post_user|
      notification = user.active_notifications.new(
        passive_user_id: post_user.id,
        post_id: id,
        action: "favorite"
      )
      notification.save if notification.valid?
    end
  end

  # コメント通知の作成
  def create_notification_post_comment!(current_user, post_comment_id)
    temp_ids = PostComment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_post_comment!(current_user, post_comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_post_comment!(current_user, post_comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_post_comment!(current_user, post_comment_id, passive_user_id)
    [sender, receiver].each do |post_user|
      notification = current_user.active_notifications.new(
        passive_user_id: post_user.id,
        post_id: id,
        post_comment_id: post_comment_id,
        action: 'post_comment'
      )
      # 自分の投稿に対するコメントの場合は、通知済みとする
      if notification.action_user_id == notification.passive_user_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  #投稿時の通知
  def create_notification_post!(current_user)
    notification = current_user.active_notifications.new(
      passive_user_id: receiver_id,
      post_id: id,
      action: 'post'
    )
    notification.save if notification.valid?
  end
end
