class AddUserToQuizResponses < ActiveRecord::Migration
  def self.up
    add_column :quiz_responses, :user_id, :integer
  end

  def self.down
    remove_column :quiz_responses, :user_id
  end
end
