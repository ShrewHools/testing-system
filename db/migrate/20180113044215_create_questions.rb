class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.references :subject
      t.text :body
      t.string :correct_answer
      t.string :correct_answer_variants, array: true, default: []
      t.string :incorrect_answer_variants, array: true, default: []
      t.timestamps
    end
  end
end
