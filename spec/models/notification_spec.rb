require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデル(action_user)との関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:action_user).macro).to eq :belongs_to
      end
    end

    context 'Userモデル(passive_user)との関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:passive_user).macro).to eq :belongs_to
      end
    end

    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end

    context 'PostCommentモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:post_comment).macro).to eq :belongs_to
      end
    end
  end
end
