class Statistic < ApplicationRecord
  belongs_to :user
  belongs_to :test

  rails_admin do
    edit do
      field :user
      field :questions_count
      field :corrent_answer_count
      field :corrent_answer_percent
      field :need_answer_percent
      field :pass
    end
    show do
      field :user
      field :questions_count
      field :corrent_answer_count
      field :corrent_answer_percent
      field :need_answer_percent
      field :pass
    end
  end
end
