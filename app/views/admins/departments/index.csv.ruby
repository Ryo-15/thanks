require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(id name)
  csv << csv_column_names
  @departments.pluck(*csv_column_names).each do |department|
    csv << department
  end
end