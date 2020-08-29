module NotificationsHelper
  def notification_form(notification)
    @action_user = notification.action_user
    @post_comment = nil
    your_post = link_to 'あなたのThanks', post_path(notification), style: "font-weight: bold;"
    @action_user_post_comment = notification.post_comment_id
    unless notification.action_user.nil?
      # notification.actionがpostかfavoriteかcommentか
      case notification.action
      when "post" then
        tag.a(
          notification.action_user.full_name, href: user_path(@action_user), style: "font-weight: bold;"
        ) + "さんからあなた宛に" + tag.a(
        'Thanks!', href: post_path(notification.post_id), style: "font-weight: bold;"
        ) + "が届いています！"
      when "favorite" then
        tag.a(
          notification.action_user.full_name, href: user_path(@action_user), style: "font-weight: bold;"
        ) + "さんが" + tag.a(
        'あなたのThanks!', href: post_path(notification.post_id), style: "font-weight: bold;"
        ) + "にいいね！しました"
      when "post_comment" then
        @post_comment = PostComment.find_by(id: @action_user_post_comment)&.comment
        tag.a(@action_user.full_name, href: user_path(@action_user), style: "font-weight: bold;"
        ) + "さんが" + tag.a(
        'あなたのThanks!', href: post_path(notification.post_id), style: "font-weight: bold;"
        ) + "にコメントしました"
      end
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
