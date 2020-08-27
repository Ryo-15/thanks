require 'rails_helper'

RSpec.describe PostComment, type: :model do
  context "データが正しく保存される" do
    before do
      @post_comment = PostComment.new
      @post_comment.user_id = 1
      @post_comment.post_id = 1
      @post_comment.comment = "テストです"
      @post_comment.save
    end
    it "全て入力してあるので保存される" do
      expect(@post_comment).to be_valid
    end
  end
  context "データが正しく保存されない" do
    before do
      @post_comment = PostComment.new
      @post_comment.user_id = 1
      @post_comment.post_id = 1
      @post_comment.comment = ""
      @post_comment.save
    end
    it "commentが入力されていないので保存されない" do
      expect(@post_comment).to be_invalid
    end
  end
end
