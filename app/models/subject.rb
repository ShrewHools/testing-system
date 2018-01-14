class Subject < ApplicationRecord
  DEFAULT_SUBJECT_NAME = 'Subject-default'

  has_many :tests, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :statistics, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def self.default
    Subject.first || Subject.new(name: DEFAULT_SUBJECT_NAME)
  end
end
