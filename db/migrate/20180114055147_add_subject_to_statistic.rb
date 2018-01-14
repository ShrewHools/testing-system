class AddSubjectToStatistic < ActiveRecord::Migration[5.0]
  def change
    add_reference :statistics, :subject, index: true
  end
end
