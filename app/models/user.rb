class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  def tests_level(level)
    tests.where(level: level)
  end
end
