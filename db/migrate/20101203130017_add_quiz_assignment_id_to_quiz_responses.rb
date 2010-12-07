class AddQuizAssignmentIdToQuizResponses < ActiveRecord::Migration
  def self.up
    add_column :quiz_responses, :quiz_assignment_id, :integer
  end

  def self.down
    remove_column :quiz_responses, :quiz_assignment_id
  end
end
