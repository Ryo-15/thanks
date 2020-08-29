require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'バリデーションのテスト' do
    let(:department) { build(:department) }

    context 'nameカラム' do
      it '空欄でないこと' do
        department.name = ''
        expect(department.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it '1:Nとなっている' do
        expect(Department.reflect_on_association(:users).macro).to eq :has_many
      end
    end
  end
end
