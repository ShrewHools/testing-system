class Test < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many :questions, through: :test_questions
  has_many :test_questions, dependent: :destroy

  validates :user_id, presence: true
  validates :subject_id, presence: true
end
