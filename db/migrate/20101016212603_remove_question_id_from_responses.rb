class RemoveQuestionIdFromResponses < ActiveRecord::Migration
  def self.up
    remove_column :responses, :question_id
  end

  def self.down
    add_column :responses, :question_id, :integer
  end
end
