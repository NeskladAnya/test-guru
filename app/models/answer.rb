class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_number_of_answers, on: :create

  scope :correct_answers, -> { where(correct: true) }

  private
  
  def validate_number_of_answers
    errors.add(:answers_count, 'limit is 4') unless question.answers.count < 4
  end
end
