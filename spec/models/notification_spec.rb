require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Userモデル(action_user)との関係' do
      let(:target) { :action_user }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'Userモデル(passive_user)との関係' do
      let(:target) { :passive_user }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'Postモデルとの関係' do
      let(:target) { :post }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'PostCommentモデルとの関係' do
      let(:target) { :post_comment }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
