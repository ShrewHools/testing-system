class Test < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many :answers, dependent: :destroy
  has_one :statistic, dependent: :destroy
  has_many :questions, through: :test_questions
  has_many :test_questions, dependent: :destroy

  validates :user_id, presence: true
  validates :subject_id, presence: true

  after_create :create_statistic

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

  private

  def create_statistic
    questions_count = subject.questions_count
    need_answer_percent = subject.need_answer_percent
    Statistic.create(
      user: user,
      test: self,
      subject: subject,
      questions_count: questions_count,
      corrent_answer_count: 0,
      corrent_answer_percent: 0,
      need_answer_percent: need_answer_percent,
      pass: false
    )
  end
end
