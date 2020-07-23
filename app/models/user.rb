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

  attachment :profile_image

  def full_name
    last_name + " " + first_name
  end

  def full_name_kana
    last_name_kana + " " + first_name_kana
  end

  def personal_info
    " [" + department.name + "] " + last_name + " " + first_name
  end

  ransacker :full_name do |parent|
    Arel::Nodes::InfixOperation.new('||', parent.table[:last_name], parent.table[:first_name])
  end

  ransacker :full_name_kana do |parent|
    Arel::Nodes::InfixOperation.new('||', parent.table[:last_name_kana], parent.table[:first_name_kana])
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      user = find_by(id: row["id"]) || new
      if user.id
        user.attributes = row.to_hash.slice(*updatable_attributes)
      else
        user.attributes = row.to_hash.slice(*registable_attributes)
      end
      user.save
    end
  end

  def self.updatable_attributes
    ["id", "last_name", "first_name", "last_name_kana", "first_name_kana", "department_id"]
  end

  def self.registable_attributes
    ["id", "last_name", "first_name", "last_name_kana", "first_name_kana", "department_id", "email", "password"]
  end
end
