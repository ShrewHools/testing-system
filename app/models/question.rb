class Question < ApplicationRecord
  belongs_to :subject
  has_many :tests, through: :test_questions
  has_many :test_questions

  validates :subject_id, presence: true
end
