class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: %i[create update]

  MIN_CORRECT_ANSWERS_PERCENT = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def questions_count
    test.questions.count
  end

  def current_question_index
    test.questions.index(current_question) + 1 unless completed?
  end

  def result
    (self.correct_questions.to_f / questions_count) * 100
  end

  def success?
    result >= MIN_CORRECT_ANSWERS_PERCENT
  end

  def successfully?
    completed? && success?
  end

  def overtime?(end_time)
    Time.current > end_time
  end

  def end_time
    created_at + test.timer.minutes
  end

  private

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    (correct_answers_count == answer_ids.count if answer_ids)
  end

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.nil? ? 0 : current_question.id).first
  end

end
