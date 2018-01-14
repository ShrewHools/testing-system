class Subject < ApplicationRecord
  has_many :tests, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :statistics, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
