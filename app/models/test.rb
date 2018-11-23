class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.return_tests(category)
    joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
