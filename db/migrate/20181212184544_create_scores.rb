class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :correct_answer
      t.integer :wrong_answer
      t.integer :activity_id
      t.string :activity_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
