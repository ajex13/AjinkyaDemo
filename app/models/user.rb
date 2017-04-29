class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :permissions
  has_many :roles,through: :permissions

  def role? role
    self.roles.pluck(:name).include? role
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
after_create :send_welcome_note_to_user
after_create :define_user_default_role



  def send_welcome_note_to_user
    NotificationMailer.signup_confirmation(self).deliver
  end

  def define_user_default_role
    Permission.create(user_id:self.id,role_id:Role.second.id)
  end
end
