class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: %i[create update]

  MIN_CORRECT_ANSWERS_PERCENT = 85

  def completed?
    current_question.nil?
  end

  def questions_count
    test.questions.count
  end

  def current_question_index
    test.questions.index(current_question) + 1 if completed?
  end

  def result
    (self.correct_question.to_f) / questions_count) * 100
  end

  def success?
    result >= MIN_CORRECT_ANSWERS
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
