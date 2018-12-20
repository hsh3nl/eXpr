class User < ApplicationRecord
  include Clearance::User

  mount_uploader :avatar, AvatarUploader

  has_many :groceries, dependent: :destroy
end
