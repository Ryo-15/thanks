require 'rails_helper'

RSpec.describe PostComment, type: :model do
  describe 'バリデーションのテスト' do
    let(:post_comment) { create(:post_comment) }

    context "データが正しく保存される" do
      it "全て入力してあるので保存される" do
        expect(post_comment).to be_valid
      end
    end
  end

  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:post_comment) { build(:post_comment, user_id: user.id) }

    context 'commentカラム' do
      it '空欄でないこと' do
        post_comment.comment = ''
        expect(post_comment.valid?).to eq false
      end
      it '200文字以下であること' do
        post_comment.comment = Faker::Lorem.characters(number: 201)
        expect(post_comment.valid?).to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end
