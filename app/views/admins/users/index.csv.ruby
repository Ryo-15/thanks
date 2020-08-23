require 'csv'
bom = "\uFEFF"
CSV.generate(bom) do |csv|
  csv_column_names = %w(id last_name first_name last_name_kana first_name_kana department_id email)
  csv << csv_column_names
  @users.pluck(*csv_column_names).each do |user|
    csv << user
  end
end
