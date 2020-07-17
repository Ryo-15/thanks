class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :department
  has_many :posts,                  dependent: :destroy
  has_many :favorites,              dependent: :destroy
  has_many :post_comments,          dependent: :destroy
  has_many :sender,                 class_name: "Post",         foreign_key: "sender_id",        dependent: :destroy
  has_many :receiver,               class_name: "Post",         foreign_key: "receiver_id",      dependent: :destroy
  has_many :active_notifications,   class_name: "Notification", foreign_key: "action_user_id",   dependent: :destroy
  has_many :passive_notifications,  class_name: "Notification", foreign_key: "passive_user_id",  dependent: :destroy
  # has_many :passive_notifications,  class_name: "Notification", foreign_key: "post_receiver_id", dependent: :destroy

  # プロフィール画像の設定機能
  attachment :profile_image

  # viewでフルネーム表示
  def full_name
    last_name + " " + first_name
  end

  # viewでフルネーム（カナ）表示
  def full_name_kana
    last_name_kana + " " + first_name_kana
  end

  # viewで部署名＋フルネーム表示
  def personal_info
    " [" + department.name + "] " + last_name + " " + first_name
  end

  # フルネーム検索
  ransacker :full_name do |parent|
    Arel::Nodes::InfixOperation.new('||',parent.table[:last_name], parent.table[:first_name])
  end

  # フルネーム（カナ）検索
  ransacker :full_name_kana do |parent|
    Arel::Nodes::InfixOperation.new('||',parent.table[:last_name_kana], parent.table[:first_name_kana])
  end

  # CSVインポート
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      user = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      user.attributes = row.to_hash.slice(*updatable_attributes)
      # 保存する
      user.save
    end
  end

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["id", "last_name", "first_name", "last_name_kana", "first_name_kana", "deparment_id", "email", "password"]
  end
end
