class Test < ApplicationRecord

  def self.return_tests(category)
    joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
