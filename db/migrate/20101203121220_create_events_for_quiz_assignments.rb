class CreateEventsForQuizAssignments < ActiveRecord::Migration
  def self.up
    QuizAssignment.all.map{|quiz_assignment| quiz_assignment.send(:update_event) }
  end

  def self.down
  end
end
