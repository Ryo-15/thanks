require 'rails_helper'

RSpec.describe User, type: :model do
  it "姓、名、メール、パスワード、部署名がある場合、有効である" do
    # userのそれぞれのカラムに対して値を入れてオブジェクト化する
    user = User.new(
    email: "test@example.com",
    password: "password",
    last_name: "テスト",
    first_name: "太郎",
    last_name_kana: "テスト",
    first_name_kana: "タロウ",
    department_id: 1,
    created_at: 2020-8-25,
    updated_at: 2020-8-25,
    )
    # オブジェクトをexpectに渡した時に、有効である(be valid)という意味になります
    expect(user).to be_valid
  end

  it "名がない場合、無効である"
  it "姓がない場合、無効である"
  it "メールアドレスがない場合、無効である"
  it "重複したメールアドレスの場合、無効である"
  it "パスワードがない場合、無効である"
end
