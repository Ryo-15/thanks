class Notification < ApplicationRecord
  #スコープ(新着順)
  default_scope->{order(created_at: :desc)}

  belongs_to :post,         optional: true
  belongs_to :post_comment, optional: true
  belongs_to :action_user,      class_name: 'User', foreign_key: 'action_user_id', optional: true
  belongs_to :post_sender,      class_name: 'User', foreign_key: 'post_sender_id', optional: true
  belongs_to :post_receiver,    class_name: 'User', foreign_key: 'post_receiver_id', optional: true
end
