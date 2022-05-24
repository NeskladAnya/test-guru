class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  SUCCESS_RATIO = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end
  
  def percentage_score
    self.correct_questions.to_f / test.questions.count * 100
  end

  def success?
    percentage_score >= SUCCESS_RATIO
  end

  def save_result
    self.success? ? self.passed = true : self.passed = false

    save!
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    unless answer_ids.nil?
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end
  end

  def correct_answers
    current_question.answers.correct_answers
  end
end
