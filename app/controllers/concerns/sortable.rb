module Sortable
  extend ActiveSupport::Concern

  def sort_direction
    %W[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def sort_column
    Post.column_names.include?(params[:column]) ? params[:column] : "created_at"
  end

  # def sort_user
  #   User.column_names.include?(params[:column]) ? params[:column] : "created_at"
  # end
end