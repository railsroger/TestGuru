class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  validates :body, presence: true
  validates :answers, numericality: { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 4 }
end
