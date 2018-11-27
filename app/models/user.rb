class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :author_create, class_name: 'Test', foreign_key: :author_id
  scope :tests_level, -> (level) { where(level: level) }

  validates :name, :email, presence: true

  def tests_level(level)
    tests.where(level: level)
  end
end
