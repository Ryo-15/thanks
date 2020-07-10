class PostsController < ApplicationController
  #before_action :search, only: [:index, :new, :create, :show, :edit, :update, :destory]
  def index
    @posts = Post.page(params[:page]).per(10).reverse_order
  end

  def new
    @user = User.find(current_user.id)
    @post = Post.new
    @search = User.ransack(params[:q])
    @users = @search.result(distinct: true)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'ありがとうを投稿しました。'
      redirect_to posts_finish_path
    else
      flash[:danger] = 'ありがとうを投稿できませんでした。'
      redirect_back(fallback_location: posts_path)
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = '投稿を更新しました。'
      redirect_back(fallback_location: posts_path)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:danger] = '投稿を削除しました。'
    redirect_to posts_path
  end

  def rank
    # ランキングを月ごとの表示にする
    if params[:pre_preview].present?
      @target_month = Date.parse(params[:pre_preview]) << 1
    elsif params[:next_preview].present?
      @target_month = Date.parse(params[:next_preview]) >> 1
    else
      @target_month = Time.current.to_date << 1
    end
    @post_receive_ranker = Post.group(:receiver_id).order('count_all DESC').limit(5).count.to_a
    @post_send_ranker = Post.group(:sender_id).order('count_all DESC').limit(5).count.to_a
    @post_favorite_ranker = Post.joins(:favorites).group(:post_id).order('count_all DESC').limit(5).count.to_a
    # @post_receiver_name = Post.joins(:user).group("users.last_name").order('count_all DESC').limit(5).count.to_a
    # ユーザーID、1ヶ月分で絞り込み
    # @ranks = User.joins(:posts)
    #             .select("posts.user_id
    #                     ,count(posts.receiver_id) as receiver
    #                     ,to_char(posts.created_at,'YYYY') as post_year
    #                     ,to_char(posts.created_at,'MM') as post_month
    #                     ,round(sum(items.study_hour) + (cast(sum(items.study_minutes) as decimal)  / 60),2) as receive_total
    #                     ,RANK () OVER (PARTITION BY to_char(posts.created_at,'YYYY'),to_char(posts.created_at,'MM') order by (count(posts.receiver_id) desc) as rank_number")
    #             .where(post_date: @target_month.all_month)
    #             .group("to_char(posts.study_date,'YYYY')
    #                     ,to_char(posts.study_date,'MM')
    #                     ,posts.user_id")
  end

  # #画面遷移防止のため、定義
  # def correct_user
  #   # bookについているidを呼び出し
  #   book = Book.find(params[:id])
  #   # カレントユーザーとbookのユーザーのidが不一致であればbook_pathへ
  #   if current_user != book.user
  #     redirect_to books_path
  #   end
  # end

  private
  def post_params
    params.require(:post).permit(:sender_id, :receiver_id, :post)
  end
end
