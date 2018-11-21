class Test < ApplicationRecord
  has_many :ass_tests_and_users
  has_many :users, through: :ass_tests_and_users

  def self.return_tests(category)
    joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
