class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  include Sortable

  def index
    if params[:column] == "favorite"
      # @posts = Post.find(Favorite.group(:post_id).pluck(:post_id))
      # @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(20)
      # @posts = Post.joins("left outer join favorites on posts.id = favorites.post_id").group(:post_id).order("count(posts.id) desc").page(params[:page]).per(20)
      @posts = Post.left_outer_joins(:favorites).group(:post_id).order("count(posts.id) desc").page(params[:page]).per(20)
      # @posts = @posts.page(params[:page]).per(20)
    else
      @posts = Post.page(params[:page]).per(20).order(sort_column + ' ' + sort_direction)
      # SQL要確認
      select posts.sender_id, posts.receiver_id, posts.post, A.last_name, "->",  receiver.last_name from posts left join users as A on posts.sender_id = A.id left join users as receiver  on posts.receiver_id = receiver.id ;
    end
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
    @receiver_ranks = User.find(
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
    @sender_ranks = User.find(
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
    @post_ranks = Post.find(
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
    @score_ranks = Post.find(
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

  # 作成中（試験運用中）
  def chart
    search_date = Date.today
    @receiver_ranks = User.find(
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
    @sender_ranks = User.find(
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
    @post_ranks = Post.find(
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
    # receive = Post.group(:receiver_id).count
    # @recieve = []
    # receive.each do|r|
    #   @receive << [User.find(r[0]).full_name,r[1]]
    # # end
    # @posts = Post.left_joins(:favorites).group('posts.id').order('COUNT(favorites.id) DESC')
  end
end
