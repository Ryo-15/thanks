require 'csv'

CSV.generate do |csv|
  # csv_column_names = %w(created_at sender_id post receiver_id COUNT(favorites.id))
  # csv << csv_column_names
  #@poosts = [
  #  { id: 1, title: 'title' ...},
  #  { id: 2, title: 'title' ...},
  #  { id: 3, title: 'title' ...},
  #]
  #@posts.pluck(:id) # [1,2,3]
  #@posts[0].favarites
  csv << ['送信日時', '送った人', '所属部署', '投稿内容', '受け取った人', '所属部署', 'いいね数']
  @posts.each do |post|
    csv << [
      post.created_at,
      post.sender.full_name,
      post.sender.department.name,
      post.post,
      post.receiver.full_name,
      post.receiver.department.name,
      post.favorites.count
    ]
  end
  #@posts.pluck(*csv_column_names).each do |post|
    # post_attributes = post.attributes
    # post_attributes["favorite_id"] = post.favorite.count
  #  csv << post
  #end
end
