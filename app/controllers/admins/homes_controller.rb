class Admins::HomesController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(10).reverse_order
    respond_to do |format|
      format.html do
        #html用の処理を書く
      end
      format.csv do
        #csv用の処理を書く
        @posts = Post.all
        send_data render_to_string, filename: "post_index.csv", type: :csv
      end
    end
  end

  def rank
    search_date = Date.today
    @receiver_ranks = User.find(Post.where(created_at: search_date.in_time_zone.all_month).group(:receiver_id).order('count(receiver_id) desc').limit(20).pluck(:receiver_id))
    @sender_ranks = User.find(Post.where(created_at: search_date.in_time_zone.all_month).group(:sender_id).order('count(sender_id) desc').limit(20).pluck(:sender_id))
    @post_ranks = Post.find(Favorite.where(created_at: search_date.in_time_zone.all_month).group(:post_id).order('count(post_id) desc').limit(20).pluck(:post_id))
  end

  def chart
    #配列形式でデータを用意する
    search_date = Date.today
    # 月ごとの投稿数
    # 部署ごとの投稿獲得数
    @post_ranks = Post.find(Favorite.where(created_at: search_date.in_time_zone.all_month).group(:user_id).order('count(user_id) desc').limit(3).pluck(:user_id))
    # 部署ごとの投稿数
    @post_ranks = Post.find(Favorite.where(created_at: search_date.in_time_zone.all_month).group(:user_id).order('count(user_id) desc').limit(3).pluck(:user_id))
    @receiver_ranks = User.find(Post.where(created_at: search_date.in_time_zone.all_month).group(:receiver_id).order('count(receiver_id) desc').limit(20).pluck(:receiver_id))
    @sender_ranks = User.find(Post.where(created_at: search_date.in_time_zone.all_month).group(:sender_id).order('count(sender_id) desc').limit(20).pluck(:sender_id))
  end
end
