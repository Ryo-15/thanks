class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(10).reverse_order
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(current_user.id)
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      # redirect_to ("/books/#{@book.id}"),notice:'You have creatad book successfully.'
    else
      @posts = Post.page(params[:page]).per(10).reverse_order
      render :index
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
      # redirect_to book_path(@book), notice:'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    # redirect_to user_path(), notice: "Book was successfully destroyed"
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
    params.require(:post).permit(:user_id, :user_id, :post)
  end
end
