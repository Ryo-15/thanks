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
    # @post_receive_ranker = Post.group(:receiver_id).order('count_all DESC').limit(5).count.to_a
    # @post_send_ranker = Post.group(:sender_id).order('count_all DESC').limit(5).count.to_a
    # @post_favorite_ranker = Post.joins(:favorites).group(:post_id).order('count_all DESC').limit(5).count.to_a
    @receiver_ranks = User.find(Post.group(:receiver_id).order('count(receiver_id) desc').limit(3).pluck(:receiver_id))
    @sender_ranks = User.find(Post.group(:sender_id).order('count(sender_id) desc').limit(3).pluck(:sender_id))
    @post_ranks = Post.find(Favorite.group(:user_id).order('count(user_id) desc').limit(3).pluck(:user_id))
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
