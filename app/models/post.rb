class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments, allow_destroy: true

#validations
validates :title,:description, presence: true
validates :description, length: { maximum: 2000,
    too_long: "%{count} characters is the maximum allowed" }


end
