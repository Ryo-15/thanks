require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(id last_name first_name last_name_kana first_name_kana department_id email)
  # csv << column_names 表の列に入る名前を定義
  csv << csv_column_names
  @users.pluck(*csv_column_names).each do |user|
  # @users.each do |user|
  #   column_values = [
  #     user.last_name,
  #     user.email,
  #     user.created_at
  #   ]
    # csv << column_values 表の行に入る値を定義
    # csv << csv_column_values
    csv << user
  end
end