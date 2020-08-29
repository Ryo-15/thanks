require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '正しく保存されるかテスト' do
    let(:post) { create(:post) }

    context "データが正しく保存される" do
      it "全て入力してあるので保存される" do
        expect(post).to be_valid
      end
    end
  end

  describe 'バリデーションのテスト' do
    let(:post) { build(:post) }

    context 'postカラム' do
      it '空欄でないこと' do
        post.post = ''
        expect(post.valid?).to eq false;
      end
      it '300文字以下であること' do
        post.post = Faker::Lorem.characters(number: 301)
        expect(post.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:sender).macro).to eq :belongs_to
        expect(Post.reflect_on_association(:receiver).macro).to eq :belongs_to
      end
    end

    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
  end
end
