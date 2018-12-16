class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, optional: true, class_name: 'User'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }
  validates :title, :level, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }

  def self.titles_by_category(category)
    Test.by_category(category).order(title: :desc).pluck(:title)
  end
end
