class Test < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many :answers, dependent: :destroy

  has_many :questions, through: :test_questions
  has_many :test_questions, dependent: :destroy

  validates :user_id, presence: true
  validates :subject_id, presence: true

  rails_admin do
    edit do
      field :subject
      field :last_question_number
      field :end_page
      field :questions
      field :created_at
      field :user
    end
    show do
      field :subject
      field :last_question_number
      field :end_page
      field :questions
      field :created_at
      field :user
    end
  end
end
