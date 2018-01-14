class Statistic < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :subject

  rails_admin do
    edit do
      field :user
      field :questions_count
      field :corrent_answer_count
      field :corrent_answer_percent
      field :need_answer_percent
      field :pass
      field :subject
    end
    show do
      field :subject
      field :user
      field :questions_count
      field :corrent_answer_count
      field :corrent_answer_percent
      field :need_answer_percent
      field :pass
    end
  end
end
