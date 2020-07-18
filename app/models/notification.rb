class Notification < ApplicationRecord
  #スコープ(新着順)
  default_scope->{order(created_at: :desc)}

  belongs_to :post,         optional: true
  belongs_to :post_comment, optional: true
  belongs_to :action_user,   class_name: 'User', foreign_key: 'action_user_id',  optional: true
  belongs_to :passive_user,  class_name: 'User', foreign_key: 'passive_user_id', optional: true
end
