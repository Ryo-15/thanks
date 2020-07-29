class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :show, :edit]
  before_action :correct_user, only: [:edit]

  def index
    @posts = Post.page(params[:page]).per(10).reverse_order
  end

  def new
    @user = current_user
    @post = Post.new
    @search = User.ransack(params[:q])
    @users = @search.result(distinct: true)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @post.create_notification_post!(current_user)
      redirect_to posts_finish_path, notice: 'ありがとうを投稿しました'
    else
      flash.now[:alert] = 'メッセージを入力してください。'
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
      redirect_to post_path(@post.id)
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
    search_date = Date.today
    @receiver_ranks = User.find(
      Post.where(
        created_at: search_date.in_time_zone.all_month
      ).group(
        :receiver_id
      ).order(
        'count(receiver_id) desc'
      ).limit(
        3
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
        3
      ).pluck(
        :sender_id
      )
    )
    @post_ranks = Post.find(
      Favorite.where(
        created_at: search_date.in_time_zone.all_month
      ).group(
        :post_id
      ).order(
        'count(post_id) desc'
      ).limit(
        3
      ).pluck(
        :post_id
      )
    )
  end

  private

  def post_params
    params.require(:post).permit(:sender_id, :receiver_id, :post)
  end

  # 他の人が編集できないようにする、before_acttionに繋がる
  def	correct_user
		post = Post.find(params[:id])
		if current_user != post.sender
			redirect_to posts_path
		end
  end

end
