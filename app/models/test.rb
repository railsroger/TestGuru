class Test < ApplicationRecord
  INFINITY = Float::INFINITY
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..INFINITY) }
  scope :return_tests, -> (category) joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  validates :level, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }
  validates :title, :level, presence: true, uniqueness: true

  #def self.return_tests(category)
  #  joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  #end
end
