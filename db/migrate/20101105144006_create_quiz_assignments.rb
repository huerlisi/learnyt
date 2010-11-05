class CreateQuizAssignments < ActiveRecord::Migration
  def self.up
    create_table :quiz_assignments do |t|
      t.integer :user_id
      t.datetime :due_at

      t.timestamps
    end
  end

  def self.down
    drop_table :quiz_assignments
  end
end
