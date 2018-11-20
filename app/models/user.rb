class User < ApplicationRecord
  has_many :ass_tests_and_users
  has_many :tests, through: :ass_tests_and_users

  def tests_level(level)
    tests.where(level: level)
  end
end
