class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment_post = @post_comment.post
    @post_comment.score = Language.get_data(post_comment_params[:comment])
    if @post_comment.save
      flash[:success] = "コメントしました"
      @post_comment_post.create_notification_comment!(current_user, @post_comment.id)
    else
      @post_comments = PostComment.where(id: @post)
    end
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    @post = @post_comment.post
    @post_comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
