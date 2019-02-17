class Badge < ApplicationRecord
  has_many :users_badges
  has_many :users, through: :users_badges
end
