class Answer < ApplicationRecord
  belongs_to :question

  scope :true_answers, -> { where(correct: true) }
  validates :title, presence: true
end
