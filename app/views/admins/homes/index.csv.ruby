require "csv"
bom = "\uFEFF"
CSV.generate(bom) do |csv|
  csv << ["送信日時", "送った人", "所属部署", "投稿内容", "受け取った人", "所属部署", "いいね数", "スコア"]
  @posts.each do |post|
    if post.sender.present? && post.receiver.present?
      csv << [
        post.created_at,
        post.sender.full_name,
        post.sender.department.name,
        post.post,
        post.receiver.full_name,
        post.receiver.department.name,
        post.favorites.count,
        post.score,
      ]
    elsif post.sender.present? && post.receiver.nil?
      csv << [
        post.created_at,
        post.sender.full_name,
        post.sender.department.name,
        post.post,
        "退職者",
        "",
        post.favorites.count,
        post.score,
      ]
    elsif post.sender.nil? && post.receiver.present?
      csv << [
        post.created_at,
        "退職者",
        "",
        post.post,
        post.receiver.full_name,
        post.receiver.department.name,
        post.favorites.count,
        post.score,
      ]
    end
  end
end
