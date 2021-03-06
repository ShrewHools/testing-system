class Statistic < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :subject

  rails_admin do
    configure :full_name do
      formatted_value do
          value
      end
    end

    configure :subject_name do
      formatted_value do
          value
      end
    end

    edit do
      field :user
      field :questions_count
      field :corrent_answer_count
      field :corrent_answer_percent
      field :need_answer_percent
      field :pass
      field :subject
      field :group
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
    export do
      field :full_name
      field :pass
      field :corrent_answer_percent
      field :corrent_answer_count
      field :questions_count
      field :group
      field :subject_name
      field :created_at
    end
  end

  def full_name
    user.full_name
  end

  def subject_name
    subject.name
  end

  def self.rating(subject)
    users = User.all
    ratings = []
    users.each do |user|
      user_stats = user.statistics.where(subject: subject)
      next if user_stats.blank?
      stat_count = user_stats.count
      avg_persent = 0.0
      max_persent = 0.0
      user_stats.each do |user_stat|
        avg_persent += user_stat.corrent_answer_percent
        max_persent = user_stat.corrent_answer_percent if user_stat.corrent_answer_percent > max_persent
      end
      user_full_name = user_stats.first.user.full_name
      group_number = user_stats.first.user.group
      avg_persent = (avg_persent / stat_count * 100).round(2)
      max_persent = (max_persent * 100).round(2)
      user_rating = { full_name: user_full_name, group_number: group_number, avg_persent: avg_persent, max_persent: max_persent }
      ratings << user_rating
    end
    sort_ratings = ratings.sort_by { |rating| rating[:avg_persent] }.reverse
  end
end
