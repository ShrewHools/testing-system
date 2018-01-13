class Question < ApplicationRecord
  belongs_to :subject
  has_many :tests, through: :test_questions
  has_many :test_questions, dependent: :destroy

  validates :subject_id, presence: true

  rails_admin do
    edit do
      field :subject
      field :body
      field :correct_answer
      field :correct_answer_variants, :pg_array
      field :incorrect_answer_variants, :pg_array
    end
    show do
      field :body, :text_with_attachment
      field :correct_answer, :text_with_attachment
      field :correct_answer_variants, :pg_array
      field :incorrect_answer_variants, :pg_array
    end
  end
end
