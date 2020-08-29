class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  include Sortable

  def index
    @posts = Post.with_deleted.order(sort_column + ' ' + sort_direction).page(params[:page]).per(20)
    respond_to do |format|
      format.html do
        # html用の処理を書く
      end
      format.csv do
        # csv用の処理を書く
        @posts = Post.left_joins(:favorites).group('posts.id')
        send_data render_to_string, filename: "post_index-#{
          Time.zone.now.strftime("%Y%m%d %H%M")
        }.csv", type: :csv
      end
    end
  end

  def rank
    search_date = Date.today
    @receiver_ranks = User.with_deleted.find(
      Post.where(
        created_at: search_date.in_time_zone.all_month
      ).
      group(
        :receiver_id
      ).
      order(
        'count(receiver_id) desc'
      ).
      limit(
        10
      ).
      pluck(
        :receiver_id
      )
    )
    @sender_ranks = User.with_deleted.find(
      Post.where(
        created_at: search_date.in_time_zone.all_month
      ).
      group(
        :sender_id
      ).
      order(
        'count(sender_id) desc'
      ).
      limit(
        10
      ).
      pluck(
        :sender_id
      )
    )
    @post_ranks = Post.with_deleted.find(
      Favorite.where(
        created_at: search_date.in_time_zone.all_month
      ).
      group(
        :post_id
      ).
      order(
        'count(post_id) desc'
      ).
      limit(
        10
      ).
      pluck(
        :post_id
      )
    )
    @score_ranks = Post.with_deleted.find(
      PostComment.where(
        created_at: search_date.in_time_zone.all_month
      ).
      group(
        :post_id
      ).
      order(
        'sum(score) desc'
      ).
      limit(
        10
      ).
      pluck(
        :post_id
      )
    )
  end

  def chart
    search_date = Date.today
    @receiver_ranks = User.with_deleted.find(
      Post.where(
        created_at: search_date.in_time_zone.all_month
      ).group(
        :receiver_id
      ).order(
        'count(receiver_id) desc'
      ).limit(
        20
      ).pluck(
        :receiver_id
      )
    )
    @sender_ranks = User.with_deleted.find(
      Post.where(
        created_at: search_date.in_time_zone.all_month
      ).group(
        :sender_id
      ).order(
        'count(sender_id) desc'
      ).limit(
        20
      ).pluck(
        :sender_id
      )
    )
    @post_ranks = Post.with_deleted.find(
      Favorite.where(
        created_at: search_date.in_time_zone.all_month
      ).group(
        :user_id
      ).order(
        'count(user_id) desc'
      ).limit(
        20
      ).pluck(
        :user_id
      )
    )
  end
end
