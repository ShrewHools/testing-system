class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tests, dependent: :destroy
  has_many :statistics, dependent: :destroy

  after_update :update_group, if: proc { |u| u.group_changed? && statistics.present? }

  private

  def update_group
    statistics.update_all(group: group)
  end
end
