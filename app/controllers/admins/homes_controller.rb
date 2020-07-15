class Admins::HomesController < ApplicationController
  def top
    #配列形式でデータを用意する
    # @data = [['2019-06-01', 100], ['2019-06-02', 200], ['2019-06-03', 150]]
    search_date = Date.today
    # 月ごとの投稿数
    @post_ranks = Post.find(Favorite.where(created_at: search_date.in_time_zone.all_month).group(:user_id).order('count(user_id) desc').limit(3).pluck(:user_id))
    # 部署ごとの投稿獲得数
    @post_ranks = Post.find(Favorite.where(created_at: search_date.in_time_zone.all_month).group(:user_id).order('count(user_id) desc').limit(3).pluck(:user_id))
    # 部署ごとの投稿数
    @post_ranks = Post.find(Favorite.where(created_at: search_date.in_time_zone.all_month).group(:user_id).order('count(user_id) desc').limit(3).pluck(:user_id))
  end
end
