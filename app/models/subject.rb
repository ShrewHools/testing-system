class Subject < ApplicationRecord
  has_many :tests
  has_many :questions

  validates :name, presence: true, uniqueness: true
end
