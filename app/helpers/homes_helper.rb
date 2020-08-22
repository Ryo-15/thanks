module HomesHelper
  def sort_asc(column_to_be_sorted)
    link_to "▲", { :column => column_to_be_sorted, :direction => "asc" }
  end

  def sort_desc(column_to_be_sorted)
    link_to "▼", { :column => column_to_be_sorted, :direction => "desc" }
  end

  def sort_direction
    %W[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def sort_column
    Post.column_names.include?(params[:column]) ? params[:column] : "created_at"
  end
end
