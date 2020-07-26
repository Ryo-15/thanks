require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(id last_name first_name last_name_kana first_name_kana department_id email)
  csv << csv_column_names
  @users.pluck(*csv_column_names).each do |user|
    csv << user
  end
  # csv << ['送信日時', '送った人', '所属部署', '投稿内容', '受け取った人', '所属部署', 'いいね数']
  # @users.each do |user|
  #   csv << [
  #     post.created_at,
  #     post.sender.full_name,
  #     post.sender.department.name,
  #     post.post,
  #     post.receiver.full_name,
  #     post.receiver.department.name,
  #     post.favorites.count
  #   ]
  # end
end
