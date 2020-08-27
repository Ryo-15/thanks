require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    subject { test_user.valid? }

    let(:user) { FactoryBot.create(:user) }

    context 'first_nameカラム' do
      let(:test_user) { user }

      it '空欄でないこと' do
        test_user.first_name = ''
        is_expected.to eq false
      end
    end

    context 'last_nameカラム' do
      let(:test_user) { user }

      it '空欄でないこと' do
        test_user.last_name = ''
        is_expected.to eq false
      end
    end

    context 'first_name_kanaカラム' do
      let(:test_user) { user }

      it '空欄でないこと' do
        test_user.first_name_kana = ''
        is_expected.to eq false
      end
      it 'カタカナであること' do
        test_user.first_name_kana = 'てすと'
        is_expected.to eq false
      end
    end

    context 'last_name_kanaカラム' do
      let(:test_user) { user }

      it '空欄でないこと' do
        test_user.first_name_kana = ''
        is_expected.to eq false
      end
      it 'カタカナであること' do
        test_user.last_name_kana = 'すぺっく'
        is_expected.to eq false
      end
    end

    context 'passwordカラム' do
      let(:test_user) { user }

      it '空欄でないこと' do
        test_user.password = ''
        is_expected.to eq false
      end
      it '空欄の場合はエラーが出る' do
        test_user.password = ''
        test_user.valid?
        expect(test_user.errors[:password]).to include("を入力してください")
      end
      it '6文字以上であること' do
        test_user.password = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '６文字未満の場合はエラーが出る' do
        test_user.password = Faker::Lorem.characters(number: 1)
        test_user.valid?
        expect(test_user.errors[:password]).to include("は6文字以上で入力してください")
      end
      it 'パスワードが不一致' do
        test_user.password = "password1"
        test_user.password_confirmation = "password2"
        test_user.valid?
        expect(test_user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
    end

    describe 'アソシエーションのテスト' do
      context 'Postモデルとの関係' do
        it '1:Nとなっている' do
          expect(User.reflect_on_association(:post).macro).to eq :has_many
        end
      end
      context 'PostCommentモデルとの関係' do
        it '1:Nとなっている' do
          expect(User.reflect_on_association(:post_comment).macro).to eq :has_many
        end
      end
    end
  end
end
