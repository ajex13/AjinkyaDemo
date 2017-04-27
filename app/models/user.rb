class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
after_create :send_welcome_note_to_user

  def send_welcome_note_to_user
    NotificationMailer.signup_confirmation(self).deliver
  end
end
