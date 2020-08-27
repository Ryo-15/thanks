require 'rails_helper'

RSpec.describe Post, type: :model do
  context "データが正しく保存される" do
    before do
      @post = Post.new
      @post.sender_id = 1
      @post.receiver_id = 2
      @post.post = "テストです"
      @post.save
    end
    it "全て入力してあるので保存される" do
      expect(@post).to be_valid
    end
  end

  context "データが正しく保存されない" do
    before do
      @post = Post.new
      @post.sender_id = 1
      @post.receiver_id = 2
      @post.post = ""
      @post.save
    end
    it "commentが入力されていないので保存されない" do
      expect(@post).to be_invalid
    end
  end

  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    context 'postカラム' do
      it '空欄でないこと' do
        post.post = ''
        expect(post.valid?).to eq false;
      end
      it '300文字以下であること' do
        book.body = Faker::Lorem.characters(number:301)
        expect(post.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end

end