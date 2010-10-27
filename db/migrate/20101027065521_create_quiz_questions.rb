class CreateQuizQuestions < ActiveRecord::Migration
  def self.up
    create_table :quiz_questions do |t|
      t.integer :quiz_id
      t.integer :question_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :quiz_questions
  end
end
