class PostsController < ApplicationController
  #before_action :search, only: [:index, :new, :create, :show, :edit, :update, :destory]
  def index
    @posts = Post.page(params[:page]).per(10).reverse_order
  end

  def new
    @post = Post.new
    @search = User.ransack(params[:q])
    @users = @search.result(distinct: true)
  end

  def create
    @user = User.find(current_user.id)
    @post = Post.new(post_params)
    @post.sender_id = current_user.id
    @post = current_user.posts.build(post_params)
    @post.receiver_id = @user.id
    if @post.save
      flash[:success] = 'ありがとうを投稿しました。'
      redirect_back(fallback_location: posts_path)
    else
      flash[:danger] = 'ありがとうを投稿できませんでした。'
      redirect_back(fallback_location: posts_path)
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @post_comment = PostComment.new
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
    flash[:success] = '投稿を削除しました。'
    redirect_back(fallback_location: posts_path)
  end

  def rank

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
