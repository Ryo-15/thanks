require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(last_name first_name department_id email created_at)
  csv << csv_column_names
  @users.pluck(*csv_column_names).each do |user|
  # @users.each do |user|
  #   column_values = [
  #     user.last_name,
  #     user.email,
  #     user.created_at
  #   ]
    csv << csv_column_values
  end
end