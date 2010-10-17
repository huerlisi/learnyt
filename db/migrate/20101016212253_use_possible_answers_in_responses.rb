class UsePossibleAnswersInResponses < ActiveRecord::Migration
  def self.up
    remove_column :responses, :answer_id
    add_column :responses, :possible_answer_id, :integer
  end

  def self.down
    add_column :responses, :answer_id, :integer
    remove_column :responses, :possible_answer_id
  end
end
