class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :question
      t.string :answer
      t.boolean :correct, default: false
      t.boolean :incorrect, default: false
      t.references :test
      t.references :user
      t.timestamps
    end
  end
end
