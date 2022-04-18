class User < ApplicationRecord

  has_one_attached :avatar
  has_many :galleries  
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  # validates :avatar, file_size: { less_than_or_equal_to: 5.megabytes },
  #     file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }

  
end