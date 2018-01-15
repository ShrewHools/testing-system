class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tests, dependent: :destroy
  has_many :statistics, dependent: :destroy
end
