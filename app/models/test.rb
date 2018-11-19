class Test < ApplicationRecord
  belongs_to :category
  has_many :users

  def self.return_tests(category)
    self.joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
