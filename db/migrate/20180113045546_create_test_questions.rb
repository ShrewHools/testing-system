class CreateTestQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :test_questions do |t|
      t.references :test
      t.references :question
      t.timestamps
    end
  end
end
