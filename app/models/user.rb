class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :department
  has_many :posts,         dependent: :destroy
  has_many :sent_messages, through: :messages, source: :receiver
  has_many :reverses_of_message, class_name: 'Message', foreign_key: 'receiver_id'
  has_many :received_messages, through: :reverses_of_message, source: :user
  has_many :sender,   class_name: "Post", foreign_key: "sender_id",   dependent: :destroy
  has_many :receiver, class_name: "Post", foreign_key: "receiver_id", dependent: :destroy
  has_many :favorites,     dependent: :destroy
  has_many :post_comments, dependent: :destroy

  def full_name
    last_name + " " + first_name
  end

  def full_name_kana
    last_name_kana + " " + first_name_kana
  end
end
