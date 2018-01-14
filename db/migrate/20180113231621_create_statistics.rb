class CreateStatistics < ActiveRecord::Migration[5.0]
  def change
    create_table :statistics do |t|
      t.references :user
      t.references :test
      t.integer :questions_count
      t.integer :corrent_answer_count
      t.float :corrent_answer_percent
      t.float :need_answer_percent
      t.boolean :pass
      t.timestamps
    end
  end
end
