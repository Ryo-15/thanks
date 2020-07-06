class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:book_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    # @book_comment = BookComment.new(book_comment_params)
    # @book_comment.user_id = current_user.id
    @post_comment.post_id = @post.id
    # @book_comment.book_id = params[:book_id].to_i
    @post_comment.save
    @post_comments = Post.find(params[:post_id]).post_comments
    # ↓直線の画面に戻るリダイレクト（＋できなかった場合のパス）
    # redirect_back(fallback_location: books_path)
    # 非同期通信にするためコメントアウトした
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    @post_comment = PostComment.find(params[:post_id])
    @post_comment.destroy
    @post_comments = Post.find(@post_comment.post_id).post_comments
    # ↓直線の画面に戻るリダイレクト（＋できなかった場合のパス）
    # redirect_back(fallback_location: books_path)
    # 非同期通信にするためコメントアウトした
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
