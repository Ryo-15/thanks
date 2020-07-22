require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(created_at sender_id post receiver_id)
  csv << csv_column_names
  @posts.pluck(*csv_column_names).each do |post|
    csv << post
  end
end