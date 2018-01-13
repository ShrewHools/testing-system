class AddQuestionsCountToSubject < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :questions_count, :integer, default: 1
  end
end
