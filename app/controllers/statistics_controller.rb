class StatisticsController < ApplicationController
  def index
    @subjects = Subject.all
    @default_subject = Subject.default
    @sort_statistics = Statistic.rating(@default_subject)
  end

  def change_subject
    @subject = Subject.find_by(id: params[:subject_id])
    @sort_statistics = Statistic.rating(@subject)
  end
end
