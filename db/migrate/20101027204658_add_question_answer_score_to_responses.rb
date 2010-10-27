class AddQuestionAnswerScoreToResponses < ActiveRecord::Migration
  def self.up
    add_column :responses, :question_id, :integer
    add_column :responses, :answer_id, :integer
    add_column :responses, :score, :decimal
  end

  def self.down
    remove_column :responses, :score
    remove_column :responses, :answer_id
    remove_column :responses, :question_id
  end
end
