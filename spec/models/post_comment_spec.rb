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

  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:post_comment) { build(:post_comment, user_id: user.id) }

    context 'commentカラム' do
      it '空欄でないこと' do
        post_comment.comment = ''
        expect(post_comment.valid?).to eq false;
      end
      it '200文字以下であること' do
        post_comment.comment = Faker::Lorem.characters(number:201)
        expect(post_comment.valid?).to eq false;
      end
    end
  end
end
