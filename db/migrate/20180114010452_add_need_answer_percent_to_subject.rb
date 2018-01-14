class AddNeedAnswerPercentToSubject < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :need_answer_percent, :float, default: 0
  end
end
