class AddQuizRelationToQuizAssignments < ActiveRecord::Migration
  def self.up
    add_column :quiz_assignments, :quiz_id, :integer
  end

  def self.down
    remove_column :quiz_assignments, :quiz_id
  end
end
