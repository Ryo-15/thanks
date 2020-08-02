require 'csv'

CSV.generate do |csv|
  csv << ['送信日時', '送った人', '所属部署', '投稿内容', '受け取った人', '所属部署', 'いいね数', 'スコア']
  @posts.each do |post|
    csv << [
      post.created_at,
      post.sender.full_name,
      post.sender.department.name,
      post.post,
      post.receiver.full_name,
      post.receiver.department.name,
      post.favorites.count,
      post.score
    ]
  end
end
