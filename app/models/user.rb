class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :comments
  has_and_belongs_to_many :posts, join_table: "posts_users_read_status"

  after_create :send_mail

  has_many :user_comment_ratings
  has_many :comments, :through => :user_comment_ratings


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def send_mail
      SignUpMailer.send_email(self).deliver_later
  end
end
