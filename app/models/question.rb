class Question < ApplicationRecord
  belongs_to :subject
  has_many :tests, through: :test_questions
  has_many :test_questions, dependent: :destroy

  validates :subject_id, presence: true
  validates :theme, presence: true
  validates :correct_answer, presence: true

  rails_admin do
    edit do
      field :subject
      field :body
      field :correct_answer
      field :correct_answer_variants, :pg_array
      field :incorrect_answer_variants, :pg_array
      field :theme
      field :literature
    end
    show do
      field :body
      field :correct_answer
      field :correct_answer_variants, :pg_array
      field :theme
      field :literature
    end
  end
end
