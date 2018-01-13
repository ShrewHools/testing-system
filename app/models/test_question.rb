class TestQuestion < ApplicationRecord
  belongs_to :test
  belongs_to :question

  rails_admin do
    edit do
      field :question
    end
    show do
      field :question
    end
  end
end
